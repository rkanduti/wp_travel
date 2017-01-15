define({ "api": [
  {
    "type": "post",
    "url": "/saveExpense",
    "title": "Add expenses",
    "name": "Add_expenses",
    "description": "<p>Add expenses to travel</p>",
    "group": "Travel",
    "permission": [
      {
        "name": "signed in"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "travelid",
            "description": "<p>Travel id.</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "api/controllers/IndexController.js",
    "groupTitle": "Travel"
  },
  {
    "type": "get",
    "url": "/viewProof/:id",
    "title": "Get travel expense proof",
    "name": "Expense_proof",
    "description": "<p>Get travel expense proof</p>",
    "group": "Travel",
    "permission": [
      {
        "name": "signed in"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "expense",
            "description": "<p>Expense id.</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "filename",
            "description": "<p>URL to proof</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n  \"filepath\": \"http://localhost/travel/1/asd.jpg\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "api/controllers/IndexController.js",
    "groupTitle": "Travel"
  },
  {
    "type": "post",
    "url": "/new",
    "title": "New travel",
    "name": "New_travel",
    "description": "<p>Create new travel</p>",
    "group": "Travel",
    "permission": [
      {
        "name": "signed in"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "userid",
            "description": "<p>User id.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "destination",
            "description": "<p>Travel destination.</p>"
          },
          {
            "group": "Parameter",
            "type": "Date",
            "optional": false,
            "field": "ddep",
            "description": "<p>Date of departure.</p>"
          },
          {
            "group": "Parameter",
            "type": "Date",
            "optional": false,
            "field": "darr",
            "description": "<p>Date of rrival,</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "status",
            "description": "<p>Status of travel</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 201 Created",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "api/controllers/IndexController.js",
    "groupTitle": "Travel"
  },
  {
    "type": "get",
    "url": "/travel/:id",
    "title": "Get travel details",
    "name": "Travel_details",
    "description": "<p>Get travel by id</p>",
    "group": "Travel",
    "permission": [
      {
        "name": "signed in"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "travelid",
            "description": "<p>Travel id.</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Travel",
            "optional": false,
            "field": "travel",
            "description": "<p>Requested travel</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n  \"travel\": travel\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "api/controllers/IndexController.js",
    "groupTitle": "Travel"
  }
] });
