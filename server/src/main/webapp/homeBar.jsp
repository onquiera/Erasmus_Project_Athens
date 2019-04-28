<nav class="navbar navbar-expand-lg navbar-light justify-content-end">
  <a href="" class="navbar-brand"><img src="./resources/logo.png" alt="Insert logo here" id=logo-img></a>
  <button class="btn ml-auto mr-2"></button>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse flex-grow-0" id="navbarSupportedContent">
    <ul class="navbar-nav text-right">
      <li class="nav-item ">
        <a class="nav-link" href="#">Choose your language</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="#">Contact us</a>
      </li>
      <%
          //gestion login
          String login = (String)session.getAttribute("login");
          
          if (login == null) {
            out.println(
            "<li class=\"nav-item active\"><a class=\"nav-link\" href=\"sign-in.html\"  color=\"red;\"><span class=\"glyphicon glyphicon-user\"></span>"
            +"Sign in</a></li>"
            +"<li class=\"nav-item active\"><a class=\"nav-link\" href=\"login.html\"><span"
            +"class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>");
          }else{
            out.println("<li><p><b>connected</b></p></li>");
            out.println("<li class=\"nav-item active\"><a class=\"nav-link\" href=\"servlet-Deconnecte\">Disconnect</a></li>");
          }
        %>
    </ul>
  </div>
</nav>