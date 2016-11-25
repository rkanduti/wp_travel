
function populateTable() {
    var table = document.getElementById("table");
    var data = new Array(), j = -1;
    var travel = travels["travel"];        
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
        console.log(travel[i]);
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
}

function openOrder(id) {
    console.log(id);
}