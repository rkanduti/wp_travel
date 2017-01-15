/**
 * User.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */
module.exports = {
  attributes: {
    travelid: {
      type: 'integer',
      primaryKey: true,
      autoIncrement: true
    },
    destination: {
      type: 'string',
      size: 45
    },
    ddep: {
      type: 'date'
    },
    darr: {
      type: 'date'
    },
    status: {
      type: 'integer'
    },
    userid: {
      model: 'user'
    },
    expenses: {
      collection: 'expenses',
      via: 'travelid'
    },
    toJSON: function() {
      var obj = this.toObject();
      delete obj.password;
      return obj;
    }
  }
};
