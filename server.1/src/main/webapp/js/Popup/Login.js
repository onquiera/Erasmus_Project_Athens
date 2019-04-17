
import PopupInterface from '../Popup/PopupInterface.js';
//import UsersDAO from '../../WEB-INF/classes/connexion/UsersDAO.java';
//import Users from '../../WEB-INF/classes/connexion/Users.java';

export default class Login extends PopupInterface {   

  constructor() {
    super();
  }

  open(){
    this.render();
    super.open();

    //Listener to send the connection request on the DAO
   // const buttonRequest = document.querySelector('#sendRequest');
    //buttonRequest.addEventListener('click', this.sendRequest);

    //Listener to redirect on the register page
    const register = document.querySelector('#SignUp');
    register.addEventListener('click', this.openRegister);
  }
  
  //TODO don't forget to implement this, or delete it.
  openRegister(event){
    event.preventDefault();
    const register = new Register();
    register.open();
  }

  sendRequest(event){
    event.preventDefault();

    const email = document.querySelector('#usrmail');
    const psw = document.querySelector('#psw');

    //List of the value about the querySelector
    const emailV = email.value;
    const pswV = psw.value;

    //If a field is empty
    let error = false;
    if (error = (!emailV || !pswV)) {
      super.error("All field is required. Please complete it.");
    }
    if(error){
      return;
    }
   

//    fetch("http://localhost:8080/",{


  //  });

    //Connect to the database and see if the e-mail match.
    //dao = new UsersDAO();
    //user = dao.find(emailV);
      
    //if(user!=null && user.getPassword().equals(pswV)) {
      //Create a session with the attribute we want
      //session.setAttribute("login", user );
      //session.setMaxInactiveInterval(10);
    //}

    super.close();
    console.log("connection ok, avec:");
    console.log(user);
    document.location.reload(true);
  }

  render(){
    const result =`  
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-log-in"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form action="Authentification" method=post role="form class=form">
           
            <div class="form-group">
              <label for="usrmail"><span class="glyphicon glyphicon-envelope"></span> E-mail</label>
              <input type="email" class="form-control" id="usrmail" placeholder="Enter email">
            </div>
            
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-lock"></span> Password</label>
              <input type="password" class="form-control" id="psw" placeholder="Enter password">
            </div>

            <center><p id="error"></p></center>
            
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button id="sendRequest" type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <p>Not a member? <a id="SignUp"href="#">Sign Up</a></p>
          <p>Forgot <a href="#">Password?</a></p>
        </div>
      </div>
      `;
  super.render(result);
  }




}