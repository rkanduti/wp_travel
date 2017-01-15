/**
 * User.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */
var bcrypt = require('bcryptjs');
module.exports = {
  attributes: {
    userid: {
      type: 'integer',
      primaryKey: true,
      autoIncrement: true
    },
    username: {
      type: 'string',
      size: 24
    },
    mail: {
      type: 'string',
      size: 24
    },
    password: {
      type: 'string',
      minLength: 5
    },
    firstname: {
      type: 'string',
      size: 24
    },
    lastname: {
      type: 'string',
      size: 24
    },
    companyid: {
      model: 'company'
    },
    num: {
      type: 'integer',
      defaultsTo: 0
    },
    travels: {
      collection: 'travel',
      via: 'userid'
    },
    toJSON: function() {
      var obj = this.toObject();
      delete obj.password;
      return obj;
    }
  },
  beforeCreate: function(user, cb) {
    bcrypt.genSalt(10, function(err, salt) {
        bcrypt.hash(user.password, salt, function(err, hash) {
            if (err) {
                console.log(err);
                cb(err);
            } else {
                user.password = hash;
                cb();
            }
        });
    });
  }
};
