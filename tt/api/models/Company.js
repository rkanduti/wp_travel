/**
 * User.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */
module.exports = {
  attributes: {
    companyid: {
      type: 'integer',
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: 'string',
      size: 45
    },
    address: {
      type: 'string',
      size: 45
    },
    city: {
      type: 'string',
      size: 45
    },
    country: {
      type: 'string',
      size: 45
    },
    users: {
      collection: 'user',
      via: 'companyid'
    },
    toJSON: function() {
      var obj = this.toObject();
      return obj;
    }
  }
};
