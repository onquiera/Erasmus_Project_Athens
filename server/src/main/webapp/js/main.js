//Display the homeBar
function displayHB(html) {

  const hbContainer = document.getElementById('homeBar');
  if (hbContainer) {
    hbContainer.innerHTML = html;
  }
}
fetch("../homeBar.jsp")
  .then((response) => response.text())
  .then(displayHB);

//Display the navbar
function displayNB(html) {

  const nbContainer = document.getElementById('navBar');
  if (nbContainer) {
    nbContainer.innerHTML = html;
  }
}
fetch("../navBar.jsp")
  .then((response) => response.text())
  .then(displayNB);
