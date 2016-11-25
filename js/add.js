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