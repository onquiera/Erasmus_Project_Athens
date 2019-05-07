//Display the homeBar

function displayHB(html) {
  const hbContainer = document.getElementById('homeBar');
  if (hbContainer) {
    hbContainer.innerHTML = html;
  }
}
fetch("../structure/homeBar.jsp")
  .then((response) => response.text())
  .then(displayHB);



//Display the navbar
function displayNB(html) {
  const nbContainer = document.getElementById('navBar');
  if (nbContainer) {
    nbContainer.innerHTML = html;
  }
}

fetch("../structure/navBar.jsp")
  .then((response) => response.text())
  .then(displayNB);



//Display the form
function displayForm(html) {
  const formContainer = document.getElementById('form-container');
  if (formContainer) {
    formContainer.innerHTML = html;
  }
}
fetch("../form.jsp")
  .then((response) => response.text())
  .then(displayForm);



//Display the footer
function displayFooter(html) {
  const fooContainer = document.getElementById('footer');
  if (fooContainer) {
    fooContainer.innerHTML = html;
  }
}
fetch("../structure/footer.jsp")
  .then((response) => response.text())
  .then(displayFooter);