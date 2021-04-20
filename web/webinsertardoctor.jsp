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
                    <h1>Insertar doctor</h1>
                    <a href="webdoctores.jsp">Volver a doctores</a>
                    <form method="post">
                        <label>Id doctor</label>
                        <input type="text" name="cajaiddoctor"/><br/>
                        <label>Apellido</label>
                        <input type="text" name="cajaapellido"/><br/>
                        <label>Especialidad</label>
                        <input type="text" name="cajaespecialidad"/><br/>
                        <label>Salario</label>
                        <input type="text" name="cajasalario"/><br/>
                        <label>Hospital</label>
                        <input type="text" name="cajahospital"/><br/>
                        <button type="submit">
                            Insertar doctor
                        </button>
                    </form>
                    <%
                    String id = request.getParameter("cajaiddoctor");
                    if (id != null){
                        int iddoctor = Integer.parseInt(id);
                        String apellido = request.getParameter("cajaapellido");
                        String especialidad = request.getParameter("cajaespecialidad");
                        String datosalario = request.getParameter("cajasalario");
                        String datohospital = request.getParameter("cajahospital");
                        int salario = Integer.parseInt(datosalario);
                        int idhospital = Integer.parseInt(datohospital);
                        String mensaje = 
                                controller.insertDoctor(iddoctor, apellido
                                        , especialidad, salario, idhospital);
                        out.println(mensaje);
                    }
                    %>                
                </div>
            </main><!-- /.container -->            
        </section>        
        <jsp:include page="includes/webfooter.jsp"/>        
    </body>
</html>
