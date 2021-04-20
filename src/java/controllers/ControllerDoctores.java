package controllers;

import java.io.IOException;
import java.util.List;
import models.Doctor;
import services.ServiceDoctores;

public class ControllerDoctores {

    ServiceDoctores service;

    public ControllerDoctores() {
        this.service = new ServiceDoctores();
    }

    public String getDoctores() throws IOException {
        List<Doctor> doctores = this.service.getDoctores();
        String html = "";
        for (Doctor doc : doctores) {
            html += "<tr>";
            html += "<td>" + doc.getApellido() + "</td>";
            html += "<td>" + doc.getEspecialidad() + "</td>";
            html += "<td>" + doc.getSalario() + "</td>";
            html += "<td>" + doc.getIdHospital() + "</td>";
            html += "<td>";
            html += "<button type='submit' name='eliminar' value='"
                    + doc.getIdDoctor() + "'>Eliminar</button>";
            html += "</td>";
            html += "<td>";
            html += "<a href='webmodificardoctor.jsp?iddoctor="
                    + doc.getIdDoctor() + "'>Editar</a>";
            html += "</td>";
            html += "</tr>";
        }
        return html;
    }

    public String insertDoctor(int iddoctor, String apellido, String especialidad,
            int salario, int idhospital) throws IOException {
        int code
                = this.service.insertDoctor(iddoctor, apellido, especialidad, salario, idhospital);
        return "<h1 style='color:blue'>Doctor insertado, Code (" + code + ")</h1>";
    }

    public String deleteDoctor(String iddoctor) throws IOException {
        int code
                = this.service.eliminarDoctor(iddoctor);
        return "<h1 style='color:red'>Doctor eliminado, Code (" + code + ")</h1>";
    }

    //PARA MODIFICAR, VAMOS A CREAR UN METODO PARA BUSCAR AL DOCTOR
    //Y DIBUJAR LAS CAJAS CON SUS DATOS.
    //UNA VEZ QUE PULSE SOBRE EL BOTON DE MODIFICAR, PUES OTRO METODO
    //PARA MODIFICAR
    //TENEMOS 2 OPCIONES:
    //1.- DIBUJAR EL FORMULARIO DINAMICAMENTE
    //2.- ENVIAR EL DOCTOR COMO OBJETO Y DIBUJAR SUS DATOS EN LA PAGINA
    public String getDoctor(String iddoctor) throws IOException {
        Doctor doctor = this.service.findDoctor(iddoctor);
        String html = "<input type='hidden' name='iddoctor' value='"
                + doctor.getIdDoctor() + "'/>";
        html += "<label>Apellido: </label>";
        html += "<input type='text' name='apellido' value='"
                + doctor.getApellido() + "'/><br/>";
        html += "<label>Especialidad: </label>";
        html += "<input type='text' name='especialidad' value='"
                + doctor.getEspecialidad() + "'/><br/>";
        html += "<label>Salario: </label>";
        html += "<input type='text' name='salario' value='"
                + doctor.getSalario() + "'/><br/>";
        html += "<label>Hospital: </label>";
        html += "<input type='text' name='idhospital' value='"
                + doctor.getIdHospital() + "'/><br/>";
        return html;
    }

    public String updateDoctor(int iddoctor, String apellido,
            String especialidad, int salario, int idhospital) throws IOException {
        int code = this.service.updateDoctor(iddoctor, apellido, especialidad,
                salario, idhospital);
        return "<h1 style='color:fuchsia'>Doctor actualizado (" + code + ")</h1>";
    }
}
