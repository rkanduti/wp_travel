var users;

function populateUsers() {
    var oReq = new XMLHttpRequest();
    //oReq.addEventListener("load", goalsJson);
    oReq.addEventListener("load", parseUser);
    //oReq.open("GET", "goals.json");
    oReq.open("GET", "js/users.json");
    oReq.responseType = "text";
    oReq.send()
}

function parseUser() {
    users = JSON.parse(this.responseText);
    users = users["users"];
}

function validateForm() {
    var username = document.forms["login_form"]["user"].value;
    var password = document.forms["login_form"]["pass"].value;

    for(var i in users) {
        if((users[i].username == username || users[i].email == users) && users[i].password == password) {
            return true;
        }
    }

    alert("Invalid username or password.");
    return false;

}