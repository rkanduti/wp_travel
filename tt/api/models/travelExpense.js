module.exports = {
  attributes: {
    travelExpenseIid: {
      type: 'integer',
      primaryKey: true,
      autoIncrement: true
    },
    expenseid: {
      model: 'expenses'
    },
    travelid: {
      model: 'travel'
    },
    toJSON: function() {
      var obj = this.toObject();
      delete obj.password;
      return obj;
    }
  }
};
