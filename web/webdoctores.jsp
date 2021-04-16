<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controller" class="controllers.ControllerDoctores"
             scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
    </body>
</html>
