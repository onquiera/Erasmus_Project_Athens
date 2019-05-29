<%@ page contentType="text/html; charset=UTF-8" %>
<nav class="navbar navbar-expand-lg navbar-light justify-content-end">
  <a href="/FR/index.jsp" class="navbar-brand"><img src="/resources/logo.png" alt="Insert logo here" id=logo-img></a>
  <button class="btn ml-auto mr-2"></button>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse flex-grow-0" id="navbarSupportedContent">
    <ul class="navbar-nav text-right">
      <li class="nav-item ">
        <a class="nav-link" href="/index.jsp">English - EN</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="/FR/informations/contactUs.html">Nous contacter</a>
      </li>
      <%
          //gestion login
          String login = (String)session.getAttribute("login");
          
          if (login == null) {
            out.println(
            "<li class=\"nav-item active\"><a class=\"nav-link\" href=\"/FR/connexion/sign-in.html\"  color=\"red;\"><span class=\"glyphicon glyphicon-user\"></span>"
            +"Inscription</a></li>"
            +"<li class=\"nav-item active\"><a class=\"nav-link\" href=\"/FR/connexion/login.html\"><span"
            +"class=\"glyphicon glyphicon-user\"></span> Connection</a></li>");
          }else{
            out.println("<li class=\"nav-item active\"><a class=\"nav-link\" href=\"/servlet-Deconnecte\">Déconnection</a></li>");
          }
        %>
    </ul>
  </div>
</nav>