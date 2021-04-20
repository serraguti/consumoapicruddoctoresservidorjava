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
                    <h1>Doctores Api Crud</h1>
                    <a href="webinsertardoctor.jsp">Nuevo doctor</a>
                    <c:set var="eliminar" value="${param.eliminar}"/>
                    <c:if test="${eliminar != null}">
                        <c:set var="mensaje"
                               value="${controller.deleteDoctor(eliminar)}"/>
                        <c:out value="${mensaje}" escapeXml="false"/>
                    </c:if>
                    <form method="post">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Apellido</th>
                                    <th>Especialidad</th>
                                    <th>Salario</th>
                                    <th>Hospital</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${controller.doctores}"
                                           var="doctor">
                                    <tr>
                                        <td>
                                            <c:out value="${doctor.apellido}"/>
                                        </td>
                                        <td>
                                            <c:out value="${doctor.especialidad}"/>
                                        </td>
                                        <td>
                                            <c:out value="${doctor.salario}"/>
                                        </td>
                                        <td>
                                            <c:out value="${doctor.idHospital}"/>
                                        </td>
                                        <td>
                                            <button type="submit"
                                                    name="eliminar"
                                                    value="${doctor.idDoctor}"
                                                    class="btn btn-danger">Eliminar</button>
                                        </td>
                                        <td>
                                            <a href="webmodificardoctor.jsp?iddoctor=${doctor.idDoctor}" 
                                               class="btn btn-outline-dark">
                                                Editar
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div>
            </main><!-- /.container -->            
        </section>
        <jsp:include page="includes/webfooter.jsp"/>
    </body>
</html>
