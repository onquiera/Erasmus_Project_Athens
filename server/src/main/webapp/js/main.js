//Display the navbar
function displayNB(html) {
  const nbContainer = document.getElementById('navBar');
  if (nbContainer) {
    nbContainer.innerHTML = html;
  }
}

fetch("/structure/navBar.jsp")
  .then((response) => response.text())
  .then(displayNB);


//Display the homeBar

function displayHB(html) {
  const hbContainer = document.getElementById('homeBar');
  if (hbContainer) {
    hbContainer.innerHTML = html;
  }
}
fetch("/structure/homeBar.jsp")
  .then((response) => response.text())
  .then(displayHB);


//Permit the change of the form
$(document).ready(function () {
  $('.tabing a').click(function (e) {
    e.stopPropagation();
    e.preventDefault();
    var tabcont = $(this).attr('href');
    $('.tabing a').removeClass('active');
    $(this).addClass('active');
    $('.tab1').fadeOut(0);
    $(tabcont).fadeIn(200);
  });
});


//Display the footer
function displayFooter(html) {
  const fooContainer = document.getElementById('footer');
  if (fooContainer) {
    fooContainer.innerHTML = html;
  }
}
fetch("/structure/footer.jsp")
  .then((response) => response.text())
  .then(displayFooter);

//------------- FR LANGUAGE ------------------


//Display the navbar
function displayNBFR(html) {
  const nbContainer = document.getElementById('navBarFR');
  if (nbContainer) {
    nbContainer.innerHTML = html;
  }
}

fetch("/FR/structure/navBar.jsp")
  .then((response) => response.text())
  .then(displayNBFR);


//Display the homeBar

function displayHBFR(html) {
  const hbContainer = document.getElementById('homeBarFR');
  if (hbContainer) {
    hbContainer.innerHTML = html;
  }
}
fetch("/FR/structure/homeBar.jsp")
  .then((response) => response.text())
  .then(displayHBFR);


//Display the footer
function displayFooterFR(html) {
  const fooContainer = document.getElementById('footerFR');
  if (fooContainer) {
    fooContainer.innerHTML = html;
  }
}
fetch("/FR/structure/footer.jsp")
  .then((response) => response.text())
  .then(displayFooterFR);