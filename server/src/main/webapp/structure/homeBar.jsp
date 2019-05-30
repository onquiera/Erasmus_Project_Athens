<nav class="navbar navbar-expand-lg navbar-light justify-content-end">
  <a href="/" class="navbar-brand"><img src="/resources/logo.png" alt="Insert logo here" id=logo-img></a>
  <button class="btn ml-auto mr-2"></button>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse flex-grow-0" id="navbarSupportedContent">
    <ul class="navbar-nav text-right">
      <li class="nav-item ">
        <a class="nav-link" href="/FR/index.jsp"> <img src="/resources/France.png" alt="French flag" id="flag">France -
          FR</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="/informations/contactUs.html"><span class="glyphicon glyphicon-envelope"></span>
          Contact us</a>
      </li>
      <%
          //gestion login
          String login = (String)session.getAttribute("login");
          
          if (login == null) {
            out.println(
            "<li class=\"nav-item active\"><a class=\"nav-link\" href=\"/connexion/sign-in.html\"  color=\"red;\"><span class=\"glyphicon glyphicon-user\"></span>"
            +" Sign in</a></li>"
            +"<li class=\"nav-item active\"><a class=\"nav-link\" href=\"/connexion/login.html\"><span class=\"glyphicon glyphicon-user\"></span>"
            +" Login</a></li>");
          }else{
            out.println("<li class=\"nav-item active\"><a class=\"nav-link\" href=\"/servlet-Deconnecte\">Disconnect</a></li>");
          }
        %>
    </ul>
  </div>
</nav>