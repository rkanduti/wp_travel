function populatePage() {
    var oReq = new XMLHttpRequest();
    //oReq.addEventListener("load", goalsJson);
    oReq.addEventListener("load", parseUser);
    //oReq.open("GET", "goals.json");
    oReq.open("GET", "js/users.json");
    oReq.responseType = "text";
    oReq.send()

    oReq = new XMLHttpRequest();
    //oReq.addEventListener("load", goalsJson);
    oReq.addEventListener("load", parseTravel);
    //oReq.open("GET", "goals.json");
    oReq.open("GET", "js/travels.json");
    oReq.responseType = "text";
    oReq.send()
}

function parseUser() {
    var link = window.location;

    var username = link.search.split('&')[0].split('=')[1];

    var users = JSON.parse(this.responseText);
    users = users["users"];
    for(i in users) {
        if(users[i].username == username) {
            document.getElementById("firstname").innerHTML = users[i].firstname;
            document.getElementById("lastname").innerHTML = users[i].lastname;
            document.getElementById("company").innerHTML = users[i].company;
        }     
    }
}

function parseTravel() {

}