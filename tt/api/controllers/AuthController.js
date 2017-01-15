var passport = require('passport');

module.exports = {

    _config: {
        actions: false,
        shortcuts: false,
        rest: false
    },

    login: function(req, res) {

        passport.authenticate('local', function(err, user, info) {
            if(info)
              sails.log.error(info);
            if ((err) || (!user)) {
                return res.view("login", {messages: info});
            }
            req.logIn(user, function(err) {
                if (err) {
                  return res.view("login", {messages: info});
                }

                req.session.user = user;
                return res.redirect("/");
            });

        })(req, res);
    },

    logout: function(req, res) {
        sails.log(req.isAuthenticated());
        req.logout();
        sails.log("logout");
        res.redirect('/');
    }
};
