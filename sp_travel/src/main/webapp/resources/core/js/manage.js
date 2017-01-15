var trav;

function sendRequest() {
    var oReq = new XMLHttpRequest();
    //oReq.addEventListener("load", goalsJson);
    oReq.addEventListener("load", loadData);
    //oReq.open("GET", "goals.json");
    oReq.open("GET", "js/travels.json");
    oReq.responseType = "text";
    oReq.send();
}


function loadData() {
    var travels = JSON.parse(this.responseText);
    var id = window.location.hash.split('#')[1];

    var travel = travels["travel"];
    for(i in travel) {
        if(travel[i].id == id)  {
            trav = travel[i];
            var readOnly = "";
            var disabled = "";
            document.getElementById("departure").value = travel[i].departure;
            document.getElementById("arrival").value = travel[i].arrival;
            document.getElementById("destination").value = travel[i].destination;
            document.getElementById("status").value = travel[i].status;
            document.getElementById("status").readOnly = true;

            if(travel[i].status == "Closed") {
                document.getElementById("close").disabled = true;
                document.getElementById("departure").readOnly = true;
                document.getElementById("arrival").readOnly = true;
                document.getElementById("destination").readOnly = true;
                document.getElementById("add").disabled = true;
                document.getElementById("countries").disabled = true;
                readOnly = "readonly";
                disabled = "disabled";

                document.getElementById("control").innerHTML = '<p><input type="submit" formaction="overview.html" value="Back" class="back"></p>';
            }

            var expenses = travel[i].expenses;

            for(j in expenses) {
                var id = "panel#" + expenses[j].id;
                document.getElementById("acc").innerHTML += '<button type="button" class="accordion '+id+'" id="'+id+'">'+expenses[j].name+'</button>'+
                                                            '<div class="panel '+id+'" style="margin-left: 1em; margin-right: 1em;">'+
                                                            '    <p>Name<input '+readOnly+' type="text" onchange="edited(\''+id+'\', this.value)" name="status" id="status" value="'+expenses[j].name+'"></p>'+
                                                            '    <p>Amount (&euro;)<input '+readOnly+' type="text" name="status" id="status" value="'+expenses[j].price+'"></p>'+
                                                            '    <p>Proof<input '+disabled+' type="file" accept="image/*" onchange="loadFile(event)"></p>'+
                                                            '    <p><button type="button" '+disabled+' class="remove" onclick="remove(\''+id+'\')" name="status" id="status" style="margin-bottom: 5px;">Remove</button></p>'+
                                                            '</div>';
            }
            break;
        }

    }

    oReq = new XMLHttpRequest();
    //oReq.addEventListener("load", goalsJson);
    oReq.addEventListener("load", parseCountries);
    //oReq.open("GET", "goals.json");
    oReq.open("GET", "js/countries.json");
    oReq.responseType = "text";
    oReq.send();

    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].onclick = function(){
            this.classList.toggle("active");
            this.nextElementSibling.classList.toggle("show");
      }
    }
}

function parseCountries(event) {
    var countries = JSON.parse(this.responseText);
    countries = countries["countries"];

    var select = document.getElementById("countries");

    for(var i in countries) {
        if(trav.countryID == countries[i].id) 
            select.innerHTML += '<option value="'+countries[i].id+'" selected>'+countries[i].name+'</option>';
        else
            select.innerHTML += '<option value="'+countries[i].id+'">'+countries[i].name+'</option>';
    }
}

function addAccordium() {
    try {
        var acc = document.getElementsByClassName("accordion");
        var next = Number(acc[acc.length-1].className.split(' ')[1].split('#')[1])+1;
    }
    catch(err) {
        var next = 1;
    }

    var id = "panel#"+next;
    var text = document.createElement('div');
    text.innerHTML += '<button type="button" class="accordion panel#'+next+'" id="panel#'+next+'" id="panel#'+next+'"></button>'+
                      '<div class="panel panel#'+next+'" style="margin-left: 1em; margin-right: 1em;">'+
                      '    <p>Name<input type="text" onchange="edited(\''+id+'\', this.value, this)" name="status" id="name#'+next+'" value=""></p>'+
                      '    <p>Amount (&euro;)<input type="text" name="status" id="status"></p>'+
                      '    <p>Proof<input type="file" accept="image/*" onchange="loadFile(event)"></p>'+
                      '    <p><button type="button" class="remove" onclick="remove(\''+id+'\')" name="status" id="status" style="margin-bottom: 5px;">Remove</button></p>'+
                      '</div>';

    document.getElementById("acc").appendChild(text);

    var acc = document.getElementsByClassName("panel#"+next);

    setTimeout(function() {acc[0].click(); document.getElementById("name#"+next).focus();}, 100);
    var i;
    for (i = 0; i < acc.length; i++) {
        acc[i].onclick = function(){
            this.classList.toggle("active");
            this.nextElementSibling.classList.toggle("show");
      }
    }
}

function edited(id, val, input) {
    document.getElementById(id).innerHTML = val;
    input.innerHTML = val;
}

function remove(id) {
    var toRemove = document.getElementsByClassName(id);

    toRemove[1].remove();
    toRemove[0].remove();
}

function saveJSON() {
    var acc = document.getElementById("acc");
    console.log(acc);
}