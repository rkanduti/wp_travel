module.exports = {
  attributes: {
    expenseid: {
      type: 'integer',
      primaryKey: true,
      autoIncrement: true
    },
    type: {
      type: 'string',
      size: 45
    },
    name: {
      type: 'string',
      size: 45
    },
    amount: {
      type: 'float'
    },
    proofPath: {
      type: 'string',
      size: 255
    },
    proofPathFd: {
      type: 'string',
      size: 255
    },
    fileName: {
      type: 'string',
      size: 45
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
