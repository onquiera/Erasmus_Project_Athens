//Display the homeBar
function displayHB(html) {
  var hbContainer = document.getElementById('homeBar');

  if (hbContainer) {
    hbContainer.innerHTML = html;
  }
}

fetch("../homeBar.jsp").then(function (response) {
  return response.text();
}).then(displayHB); //Display the navbar

function displayNB(html) {
  var nbContainer = document.getElementById('navBar');

  if (nbContainer) {
    nbContainer.innerHTML = html;
  }
}

fetch("../navBar.jsp").then(function (response) {
  return response.text();
}).then(displayNB);
//# sourceMappingURL=main.js.map