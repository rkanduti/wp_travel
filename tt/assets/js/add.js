function validateForm() {
  var departure = document.forms["from"]["departure"].value;
  var arrival = document.forms["from"]["arrival"].value;
  var destination = document.forms["from"]["destination"].value;
  if(departure > arrival)
    return false;
  if(destination == "")
    return false

  return true;

}
