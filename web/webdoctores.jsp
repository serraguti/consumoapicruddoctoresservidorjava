<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controller" class="controllers.ControllerDoctores"
             scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="includes/webhead.jsp"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="includes/webmenu.jsp"/>
        <section>
            <main role="main" class="container">
                <div class="starter-template">
                    <h1>Doctores Api Crud</h1>
                    <a href="webinsertardoctor.jsp">Nuevo doctor</a>
                    <%
                    String eliminar = request.getParameter("eliminar");
                    if (eliminar != null){
                        String mensaje = controller.deleteDoctor(eliminar);
                        out.println(mensaje);
                    }
                    %>
                    <form method="post">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Apellido</th>
                                    <th>Especialidad</th>
                                    <th>Salario</th>
                                    <th>Hospital</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%=controller.getDoctores()%>
                            </tbody>
                        </table>
                    </form>
                </div>
            </main><!-- /.container -->            
        </section>
        <jsp:include page="includes/webfooter.jsp"/>
    </body>
</html>
