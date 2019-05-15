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


//Display the progressionBar

function displayPB(html) {
  const pbContainer = document.getElementById('progBar');
  if (pbContainer) {
    pbContainer.innerHTML = html;
  }
}
fetch("/structure/progressionBar.jsp")
  .then((response) => response.text())
  .then(displayPB);


$(document).ready(function () {
  $("#next").click(function (e) {
    e.stopPropagation();
    e.preventDefault();
    $(".nav-item.active label").css({"color": "#ff6600"});
    $(".nav-item label").next().css({"color": "red"});
    //TODO Dire à la bare de passer l'état du label "active" en "passive", et passer le suivant en "active"
  });
});





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