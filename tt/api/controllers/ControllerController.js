/**
 * ControllerController
 *
 * @description :: Server-side logic for managing Controllers
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	firstPage: function(req, res) {
		return res.view('index');
	},

	login: function(req, res) {
		User.find({username: req.body.user, password: req.body.pass}).exec(function (err, user){
		  if (err) {
		    return res.redirect('/login');
		  }

			if(user.length != 0) {

				req.session.userid = user[0].userid;
			}

	    return res.redirect('/');
		});
	}
};
