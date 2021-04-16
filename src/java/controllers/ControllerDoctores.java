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
}
