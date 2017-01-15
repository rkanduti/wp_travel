/**
 * IndexController
 *
 * @description :: Server-side logic for managing Indices
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var dateFormat = require('dateformat');
 module.exports = {
	index: function(req, res) {

    user = req.session.user;
    company = req.session.company;
    res.view('index', {user: user, company: company});
	},

  overview: function(req, res) {
    res.view('overview', {user: req.session.user, travels: req.session.travels});
  },

  newTravel: function(req, res) {
    var darr = req.body.arrival;
		var ddep = req.body.departure;
		var destination = req.body.destination;

    Travel.create({
      destination: destination,
      darr: darr,
      ddep: ddep,
      status: 0,
      userid: req.session.user.userid
    }).exec(function(err2, travel) {
      if (err2) {
        sails.log("Cannot make task, add task.");
      }

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

      req.session.travels.push(travel);
      res.redirect("/overview");
    });
  },

  viewTravel: function(req, res) {
    travels = req.session.travels;
    for(var travel = 0; travel < travels.length; travel++) {
      if(travels[travel].travelid == req.params.id) {

        res.view('manage', {travel: travels[travel]});
        break;
      }
    }
  },

  add: function(req, res) {
    res.view('add');
  },

  updateTravel: function(req, res) {
    var travelid = req.body.travelid;
    var exp = req.body.expenses;

    var expenses = [];

    for(var i = 0; i < exp.length; i++) {
      var expense = {"travelid": Number(travelid), "name": exp[i].name, "type": exp[i].name, "amount": parseFloat(exp[i].amount+".0")}
      expenses.push(expense);
    }

    sails.log(expenses);
    Expenses.create(expenses).exec(function(err, expenses1) {
      if(err)
        sails.log(err);

      sails.log(expenses1);
      return res.send("true");
    })
  },

  saveExpense: function(req, res) {
    sails.log("tu");

    req.file('file').upload({
    // don't allow the total upload size to exceed ~10MB
      maxBytes: 10000000,
      /*saveAs: function(file){
        return file.filename;
      },*/
      dirname: require('path').resolve(sails.config.appPath, './assets/travels/'+req.session.user.userid+'/')
    },function (err, uploadedFiles) {
      sails.log(uploadedFiles);
      if (err) {
        return res.negotiate(err);
      }

    // If no files were uploaded, respond with an error.
      if (uploadedFiles.length === 0){
        return res.badRequest('No file was uploaded');
      }
      console.log(req.body.travelid);
    // Save the "fd" and the url where the avatar for a user can be accessed
    sails.log(req.body);
      Expenses.create({
        type: req.body.name,
        name: req.body.name,
        amount: req.body.amount,
        travelid: 1,
        proofPath: require('util').format('%s/travels/%s/', sails.getBaseUrl(), req.session.user.userid),
        proofPathFd: uploadedFiles[0].fd.split('\\')[uploadedFiles[0].fd.split('\\').length-1],
        fileName: uploadedFiles[0].fd.split('\\')[uploadedFiles[0].fd.split('\\').length-1]
      }).exec(function(err, expense) {
        if(err)
          sails.log(err);

        sails.log(expense);
        return res.redirect("/travel/"+req.body.travelid);
      });
    });
  },

  getProof: function (req, res){
    Expenses.findOne({expenseid: req.params.id}).exec(function (err, expense) {
      if (err)
        return res.negotiate(err);
      if (!expense)
        return res.notFound();

      // User has no avatar image uploaded.
      // (should have never have hit this endpoint and used the default image)
      if (!expense.proofPathFd) {
        return res.notFound();
      }

      var file = expense.proofPathFd;
      sails.log(expense.proofPath + "" + file);
      res.send(expense.proofPath + "/" + file);
      /*var SkipperDisk = require('skipper-disk');
      var fileAdapter = SkipperDisk();
      var file = expense.proofPathFd.split('\\')[expense.proofPathFd.split('\\').length-1];
      //console.log(file);
      // set the filename to the same file as the user uploaded
      res.set("Content-disposition", "attachment; filename='" + file + "'");
      // Stream the file down
      fileAdapter.read(expense.proofPathFd
      )
      .on('error', function (err){
        return res.serverError(err);
      })
      .pipe(res);
  , function(error , file) {
        if(error) {
          res.json(error);
        } else {
          res.send(file);
        }
      });*/
    });
  }

 };
