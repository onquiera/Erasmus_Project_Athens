import Login from './Popup/Login.js';

const linkLogin = document.querySelector('.login');

if (linkLogin) {
  const login = new Login();
  linkLogin.addEventListener('click', (event) => {
    event.preventDefault();
    login.open();
  });
}