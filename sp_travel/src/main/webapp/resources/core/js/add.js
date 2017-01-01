function populateCountries() {
    var oReq = new XMLHttpRequest();
    //oReq.addEventListener("load", goalsJson);
    oReq.addEventListener("load", parseCountries);
    //oReq.open("GET", "goals.json");
    oReq.open("GET", "js/countries.json");
    oReq.responseType = "text";
    oReq.send();
}

function parseCountries(event) {
    var countries = JSON.parse(this.responseText);
    countries = countries["countries"];

    var select = document.getElementById("countries");

    for(var i in countries) {
        select.innerHTML += '<option value="'+countries[i].id+'">'+countries[i].name+'</option>';
    }
}

function check() {
    var x = document.getElementsByClassName("radios");
    var y = document.getElementsByClassName("others");
    if(document.getElementById("notReq").checked) {
        for(var i in x) {
            x[i].disabled = true;
            x[i].checked = false;
        }
        for(var i in y) {
            y[i].disabled = true;
            y[i].checked = false;
        }
    }
    else
        for(var i in x) 
            x[i].disabled = false;
}

function checkRadios(e) {
    var x = document.getElementsByClassName("others");
    if(e.id != "other")
        for(var i in x) {
            x[i].disabled = true;
            x[i].checked = false;
        }
    else
        for(var i in x) 
            x[i].disabled = false;
}