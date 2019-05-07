//Display the homeBar
function displayHB(html) {
  var hbContainer = document.getElementById('homeBar');

  if (hbContainer) {
    hbContainer.innerHTML = html;
  }
}

fetch("../structure/homeBar.jsp").then(function (response) {
  return response.text();
}).then(displayHB); //Display the navbar

function displayNB(html) {
  var nbContainer = document.getElementById('navBar');

  if (nbContainer) {
    nbContainer.innerHTML = html;
  }
}

fetch("/structure/navBar.jsp").then(function (response) {
  return response.text();
}).then(displayNB); //Display the form

function displayForm(html) {
  var formContainer = document.getElementById('form-container');

  if (formContainer) {
    formContainer.innerHTML = html;
  }
}

fetch("/form.jsp").then(function (response) {
  return response.text();
}).then(displayForm); //Display the footer

function displayFooter(html) {
  var fooContainer = document.getElementById('footer');

  if (fooContainer) {
    fooContainer.innerHTML = html;
  }
}

fetch("/structure/footer.jsp").then(function (response) {
  return response.text();
}).then(displayFooter);
//# sourceMappingURL=main.js.map