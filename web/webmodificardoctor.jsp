<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
                    <c:set var="apellido" value="${param.apellido}"/>
                    <c:if test="${apellido != null}">
                        <c:set var="iddoctor" value="${param.iddoctor}"/>
                        <c:set var="apellido" value="${param.apellido}"/>
                        <c:set var="especialidad" value="${param.especialidad}"/>
                        <c:set var="salario" value="${param.salario}"/>
                        <c:set var="idhospital" value="${param.idhospital}"/>
                        <c:set var="respuesta" 
value="${controller.updateDoctor(iddoctor, apellido, especialidad, salario, idhospital)}"/>
                        <c:redirect url="webdoctores.jsp"/>
                    </c:if>
                    <h1 style="color:blue">Modificar doctor</h1>
                    <a href="webdoctores.jsp">Volver al listado</a>
                    <form method="post">
                        <c:set var="iddoctor" value="${param.iddoctor}"/>
                        <h1>
                            <c:out value="${param.iddoctor}"/>    
                        </h1>
                        
                        <c:if test="${iddoctor != null}">
                            <c:set var="doctor" value="${controller.getDoctor(iddoctor)}"/>
                            <input type="hidden" name="iddoctor" value="${iddoctor}"/>
                            <label>Apellido: </label>
                            <input type="text" name="apellido" value="${doctor.apellido}"
                                   class="form-control"/><br/>
                            <label>Especialidad: </label>
                            <input type="text" name="especialidad"
                                   value="${doctor.especialidad}"
                                   class="form-control"/><br/>
                            <label>Salario: </label>
                            <input type="text" name="salario"
                                   value="${doctor.salario}"
                                   class="form-control"/><br/>
                            <label>Id Hospital: </label>
                            <input type="text" name="idhospital"
                                   value="${doctor.idHospital}"
                                   class="form-control"/>
                            <button type="submit" class="btn btn-info">Modificar</button>
                        </c:if>
                    </form>
                </div>
            </main><!-- /.container -->            
        </section>        
        <jsp:include page="includes/webfooter.jsp"/>  
    </body>
</html>
