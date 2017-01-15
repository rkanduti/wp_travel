/**
 * IndexController
 *
 * @description :: Server-side logic for managing Indices
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var dateFormat = require('dateformat');
 module.exports = {
	index: function(req, res) {
    sails.log.info("GET Index");

    user = req.session.user;
    company = req.session.company;
    res.view('index', {user: user, company: company});
	},

  overview: function(req, res) {
    sails.log.info("GET Overview");
    res.view('overview', {user: req.session.user, travels: req.session.travels});
  },

  /**
  * @api {post} /new New travel
  * @apiName New travel
  * @apiDescription Create new travel
  * @apiGroup Travel
  * @apiPermission signed in
  * @apiParam {Integer} userid User id.
  * @apiParam {String} destination Travel destination.
  * @apiParam {Date} ddep Date of departure.
  * @apiParam {Date} darr Date of rrival,
  * @apiParam {String} status Status of travel
  * @apiSuccessExample Success-Response:
  *     HTTP/1.1 201 Created
  */
  newTravel: function(req, res) {
    var darr = req.body.arrival;
		var ddep = req.body.departure;
		var destination = req.body.destination;

    sails.log.info("POST new travel");

    Travel.create({
      destination: destination,
      darr: darr,
      ddep: ddep,
      status: 0,
      userid: req.session.user.userid
    }).exec(function(err2, travel) {
      if (err2) {
        sails.log.error("Cannot make task, add task.");
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

  /**
  * @api {get} /travel/:id Get travel details
  * @apiName Travel details
  * @apiDescription Get travel by id
  * @apiGroup Travel
  * @apiPermission signed in
  * @apiParam {Integer} travelid Travel id.
  * @apiSuccess {Travel}   travel Requested travel
  * @apiSuccessExample Success-Response:
  *     HTTP/1.1 200 OK
  *     {
  *       "travel": travel
  *     }
  */
  viewTravel: function(req, res) {
    sails.log.info("GET view travel by id");
    travels = req.session.travels;
    for(var travel = 0; travel < travels.length; travel++) {
      if(travels[travel].travelid == req.params.id) {

        res.view('manage', {travel: travels[travel]});
        break;
      }
    }
  },

  add: function(req, res) {
    sails.log.info("GET Add");
    res.view('add');
  },

  updateTravel: function(req, res) {
    sails.log.info("UPDATE travel");
    var travelid = req.body.travelid;
    var exp = req.body.expenses;

    var expenses = [];

    for(var i = 0; i < exp.length; i++) {
      var expense = {"travelid": Number(travelid), "name": exp[i].name, "type": exp[i].name, "amount": parseFloat(exp[i].amount+".0")}
      expenses.push(expense);
    }

    Expenses.create(expenses).exec(function(err, expenses1) {
      if(err)
        sails.log.error(err);

      return res.send("true");
    })
  },


  /**
  * @api {post} /saveExpense Add expenses
  * @apiName Add expenses
  * @apiDescription Add expenses to travel
  * @apiGroup Travel
  * @apiPermission signed in
  * @apiParam {Integer} travelid Travel id.
  * @apiSuccessExample Success-Response:
  *     HTTP/1.1 200 OK
  *     {
  *     }
  */
  saveExpense: function(req, res) {
    sails.log.info("POST new travel expense");

    req.file('file').upload({
    // don't allow the total upload size to exceed ~10MB
      maxBytes: 10000000,
      /*saveAs: function(file){
        return file.filename;
      },*/
      dirname: require('path').resolve(sails.config.appPath, './assets/travels/'+req.session.user.userid+'/')
    },function (err, uploadedFiles) {
      if (err) {
        return res.negotiate(err);
      }

    // If no files were uploaded, respond with an error.
      if (uploadedFiles.length === 0){
        return res.badRequest('No file was uploaded');
      }

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
          sails.log.error(err);

        return res.redirect("/travel/"+req.body.travelid);
      });
    });
  },

  /**
  * @api {get} /viewProof/:id Get travel expense proof
  * @apiName Expense proof
  * @apiDescription Get travel expense proof
  * @apiGroup Travel
  * @apiPermission signed in
  * @apiParam {Integer} expense Expense id.
  * @apiSuccess {String}   filename URL to proof
  * @apiSuccessExample Success-Response:
  *     HTTP/1.1 200 OK
  *     {
  *       "filepath": "http://localhost/travel/1/asd.jpg"
  *     }
  */
  getProof: function (req, res){
    sails.log.info("GET travel expense proof");
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
      res.send(expense.proofPath + "/" + file);

    });
  }

 };
