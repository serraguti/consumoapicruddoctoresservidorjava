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
        <%
        String apellido = request.getParameter("apellido");
        if (apellido != null){
            int iddoctor = Integer.parseInt(request.getParameter("iddoctor"));
            String especialidad = request.getParameter("especialidad");
            String datosalario = request.getParameter("salario");
            String datoidhospital = request.getParameter("idhospital");
            int salario = Integer.parseInt(datosalario);
            int idhospital = Integer.parseInt(datoidhospital);
            String respuesta = controller.updateDoctor(iddoctor, apellido, especialidad
                    , salario, idhospital);
            out.println(respuesta);
        }
        %>
        <h1 style="color:blue">Modificar doctor</h1>
        <a href="webdoctores.jsp">Volver al listado</a>
        <form method="post">
            <%
            String dato = request.getParameter("iddoctor");
            if (dato != null){
                String html = controller.getDoctor(dato);
                %>
                <%=html%>
                <button type="submit">Modificar</button>
                <%
            }
            %>
        </form>
    </body>
</html>
