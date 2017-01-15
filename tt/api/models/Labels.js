module.exports = {
  attributes: {
    labelid: {
      type: 'integer',
      primaryKey: true,
      autoIncrement: true
    },
    value: {
      type: 'string',
      size: 100
    },
    language: {
      type: 'string',
      size: 3
    },
    toJSON: function() {
      var obj = this.toObject();
      delete obj.password;
      return obj;
    }
  }
};
