<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
                        <input type="text" name="cajaiddoctor"
                               class="form-control"/><br/>
                        <label>Apellido</label>
                        <input type="text" name="cajaapellido"
                               class="form-control"/><br/>
                        <label>Especialidad</label>
                        <input type="text" name="cajaespecialidad"
                               class="form-control"/><br/>
                        <label>Salario</label>
                        <input type="text" name="cajasalario"
                               class="form-control"/><br/>
                        <label>Hospital</label>
                        <input type="text" name="cajahospital"
                               class="form-control"/><br/>
                        <button type="submit" class="btn btn-outline-info">
                            Insertar
                        </button>
                    </form>
                    <c:set var="id" value="${param.cajaiddoctor}"/>
                    <c:if test="${id != null}">
                        <c:set var="apellido" value="${param.cajaapellido}"/>
                        <c:set var="especialidad" value="${param.cajaespecialidad}"/>
                        <c:set var="salario" value="${param.cajasalario}"/>
                        <c:set var="idhospital" value="${param.cajahospital}"/>
                        <c:set var="mensaje"
value="${controller.insertDoctor(id, apellido, especialidad, salario, idhospital)}"/>
                        <c:redirect url="webdoctores.jsp"/>
                    </c:if>
                </div>
            </main><!-- /.container -->            
        </section>        
        <jsp:include page="includes/webfooter.jsp"/>        
    </body>
</html>
