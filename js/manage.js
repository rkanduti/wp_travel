function loadData() {
    var id = window.location.hash.split('#')[1];

    var travel = travels["travel"];
    for(i in travel) {
        if(travel[i].id == id)  {
            console.log(travel[i].destination);
            console.log(travel[i].date);
            console.log(travel[i].status);
            document.getElementById("departure").value = travel[i].departure;
            document.getElementById("arrival").value = travel[i].arrival;
            document.getElementById("destination").value = travel[i].destination;
            document.getElementById("status").innerHTML = travel[i].status;
            if(travel[i].status == "Closed") {
                document.getElementById("close").disabled = true;
                document.getElementById("departure").disabled = true;
                document.getElementById("arrival").disabled = true;
                document.getElementById("destination").disabled = true;
            }
            break;
        }
    }
}