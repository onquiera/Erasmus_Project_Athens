import Login from './Popup/Login.js';
var linkLogin = document.querySelector('.login');

if (linkLogin) {
  var login = new Login();
  linkLogin.addEventListener('click', function (event) {
    event.preventDefault();
    login.open();
  });
}
//# sourceMappingURL=main.js.map