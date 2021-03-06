
 function loadJSON(callback) {   

    var xobj = new XMLHttpRequest();
    xobj.overrideMimeType("text/plain");
    xobj.open('GET', 'js/travels.json', true); // Replace 'my_data' with the path to your file
    xobj.onreadystatechange = function () {
          if (xobj.readyState == 4 && xobj.status == "200") {
            // Required use of an anonymous callback as .open will NOT return a value but simply returns undefined in asynchronous mode
            
            callback(xobj.responseText);
          }
    };
    xobj.send(null);  
 }

function populateTable() {
    var oReq = new XMLHttpRequest();
    //oReq.addEventListener("load", goalsJson);
    oReq.addEventListener("load", parseJSON);
    //oReq.open("GET", "goals.json");
    oReq.open("GET", "js/travels.json");
    oReq.responseType = "text";
    oReq.send()
}

function parseJSON(event) {

    var table = document.getElementById("table");
 //   loadJSON(function(response) {
    // Parse JSON string into object
        var travels = JSON.parse(this.responseText);
        var travel = travels["travel"]; 
        var data = new Array(), j = -1;     
        data[++j] = '<thead><tr><th>';
        data[++j] = "Destination";
        data[++j] = '</td><th>';
        data[++j] = "Date";
        data[++j] = '</td><th>';
        data[++j] = "Status";
        data[++j] = '</td><th>';
        data[++j] = "Open";
        data[++j] = '</th></tr></thead><tbody>';
        for(var i in travel) {
            data[++j] = '<tr><td>';
            data[++j] = travel[i].destination;
            data[++j] = '</td><td>';
            data[++j] = travel[i].date;
            data[++j] = '</td><td>';
            data[++j] = travel[i].status;
            data[++j] = '</td><td>';
            data[++j] = '<a href="manage.html#'+travel[i].id+'" class="openOrder">View</a>';
            data[++j] = '</td></tr>';
        }
        data[++j] = '</tbody>';

        table.innerHTML = data.join('');
    //}: //);

}

function openOrder(id) {
}