//Display the navbar
function displayNB(html) {
  var nbContainer = document.getElementById('navBar');

  if (nbContainer) {
    nbContainer.innerHTML = html;
  }
}

fetch("/structure/navBar.jsp").then(function (response) {
  return response.text();
}).then(displayNB); //Display the homeBar

function displayHB(html) {
  var hbContainer = document.getElementById('homeBar');

  if (hbContainer) {
    hbContainer.innerHTML = html;
  }
}

fetch("/structure/homeBar.jsp").then(function (response) {
  return response.text();
}).then(displayHB); //Display the progressionBar

function displayPB(html) {
  var pbContainer = document.getElementById('progBar');

  if (pbContainer) {
    pbContainer.innerHTML = html;
  }
}

fetch("/structure/progressionBar.jsp").then(function (response) {
  return response.text();
}).then(displayPB); //Permit the change of the form

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
}); //Display the footer

function displayFooter(html) {
  var fooContainer = document.getElementById('footer');

  if (fooContainer) {
    fooContainer.innerHTML = html;
  }
}

fetch("/structure/footer.jsp").then(function (response) {
  return response.text();
}).then(displayFooter); //------------- FR LANGUAGE ------------------
//Display the navbar

function displayNBFR(html) {
  var nbContainer = document.getElementById('navBarFR');

  if (nbContainer) {
    nbContainer.innerHTML = html;
  }
}

fetch("/FR/structure/navBar.jsp").then(function (response) {
  return response.text();
}).then(displayNBFR); //Display the homeBar

function displayHBFR(html) {
  var hbContainer = document.getElementById('homeBarFR');

  if (hbContainer) {
    hbContainer.innerHTML = html;
  }
}

fetch("/FR/structure/homeBar.jsp").then(function (response) {
  return response.text();
}).then(displayHBFR); //Display the progressionBar

function displayPBFR(html) {
  var pbContainer = document.getElementById('progBarFR');

  if (pbContainer) {
    pbContainer.innerHTML = html;
  }
}

fetch("/FR/structure/progressionBar.jsp").then(function (response) {
  return response.text();
}).then(displayPBFR); //Display the footer

function displayFooterFR(html) {
  var fooContainer = document.getElementById('footerFR');

  if (fooContainer) {
    fooContainer.innerHTML = html;
  }
}

fetch("/FR/structure/footer.jsp").then(function (response) {
  return response.text();
}).then(displayFooterFR);
//# sourceMappingURL=main.js.map