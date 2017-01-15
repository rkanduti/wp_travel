module.exports = function(req, res, next) {

  if (req.isAuthenticated()) {

    User.findOne({
      userid: req.session.user.userid
    })
    .populate('travels')
    .exec(function(err, user) {
      if (err) {
        sails.log.error("cannot find user, error");
      }
      Company.findOne({
        companyid: user.companyid
      })
      .exec(function(err, company) {
        if (err) {
          sails.log.error("cannot find company, error");
        }
        Travel.find().
        sort('darr DESC').
        where({userid: user.userid}).
        populate('expenses').
        exec(function(err, travels) {
          for(var i = 0; i < travels.length; i++) {
            var travel = travels[i];
            //travel.darr = travel.darr.toISOString().slice(0, 10);
            mArr = travel.darr.getMonth()+1;
            mArr = (mArr < 10) ? ("0" + mArr) : mArr;

            mDep = travel.ddep.getMonth()+1;
            mDep = (mDep < 10) ? ("0" + mDep) : mDep;

            dArr = travel.darr.getDate();
            dArr = (dArr < 10) ? ("0" + dArr) : dArr;

            dDep = travel.ddep.getDate();
            dDep = (dDep < 10) ? ("0" + dDep) : dDep;

            travel.darr = travel.darr.getFullYear()+"-"+mArr+"-"+dArr;
            travel.ddep = travel.ddep.getFullYear()+"-"+mDep+"-"+dDep;
            travels[i] = travel;
          }
          user.travels = travels;
          req.session.user = user;
          req.session.travels = travels;
          req.session.company = company;

          return next();
        })
      });
    });
  }
  else{
    return res.redirect('/login');
  }
};
