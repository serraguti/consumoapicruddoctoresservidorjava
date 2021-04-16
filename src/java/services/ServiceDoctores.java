package services;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import models.Doctor;

public class ServiceDoctores {

    String urlapi;

    public ServiceDoctores() {
        this.urlapi = "https://apicrudoctoresjava.azurewebsites.net/";
    }

    //CREAMOS UN METODO PARA CONVERTIR EL STREAM
    //DE LA PETICION HTTP A STRING
    private String readStreamHttp(InputStream stream) throws IOException {
        BufferedReader buffer
                = new BufferedReader(new InputStreamReader(stream));
        StringBuffer data = new StringBuffer();
        String linea = "";
        String separador = "";
        while ((linea = buffer.readLine()) != null) {
            data.append(separador + linea);
            separador = "\n";
        }
        return data.toString();
    }

    //METODO PARA PODER REALIZAR LA PETICION GET
    //ESTE METODO LO VAMOS A UTILIZAR PARA TODAS LAS
    //PETICIONES GET QUE TUVIERAMOS EN ESTE SERVICE
    //ES UN METODO GENERICO QUE DEVUELVE EL JSON
    private String getHttpRequest(String request) throws MalformedURLException, IOException {
        URL url = new URL(this.urlapi + request);
        HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
        conexion.setRequestMethod("GET");
        conexion.setRequestProperty("Accept", "application/json");
        if (conexion.getResponseCode() == 200) {
            InputStream stream = conexion.getInputStream();
            String data = this.readStreamHttp(stream);
            conexion.disconnect();
            return data;
        } else {
            conexion.disconnect();
            return null;
        }
    }

    public List<Doctor> getDoctores() throws IOException {
        String request = "api/doctores";
        String datosjson = this.getHttpRequest(request);
        Gson converter = new Gson();
        List<Doctor> doctores
                = converter.fromJson(datosjson,
                        new TypeToken<List<Doctor>>() {
                        }.getType()
                );
        return doctores;
    }

    public Doctor findDoctor(String id) throws IOException {
        String request = "api/doctores/" + id;
        String datosjson = this.getHttpRequest(request);
        Gson converter = new Gson();
        Doctor doctor
                = converter.fromJson(datosjson, Doctor.class);
        return doctor;
    }

    public int eliminarDoctor(String id) throws MalformedURLException, IOException {
        String request = "api/doctores/delete/" + id;
        URL url = new URL(this.urlapi + request);
        HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
        conexion.setRequestMethod("DELETE");
        int statuscode = conexion.getResponseCode();
        conexion.disconnect();
        return statuscode;
    }

    public int insertDoctor(int iddoctor, String apellido, String especialidad,
            int salario, int idhospital) throws MalformedURLException, IOException {
        String request = "api/doctores/post";
        URL url = new URL(this.urlapi + request);
        HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
        conexion.setRequestMethod("POST");
        //DEBEMOS INDICAR EL TIPO DE CONTENIDO QUE VAMOS A ENVIAR
        conexion.setRequestProperty("Content-Type", "application/json");
        Doctor doctor = new Doctor(iddoctor, apellido, especialidad, salario, idhospital);
        Gson converter = new Gson();
        String doctorjson = converter.toJson(doctor);
        //DEBEMOS ENVIAR EL DOCTOR AL SERVICIO, CUANDO LEEMOS LO HACEMOS
        //MEDIANTE Stream, PUES CUANDO ENVIAMOS, LO HAREMOS TAMBIEN
        //MEDIANTE Stream
        //INDICAMOS AL SERVICIO QUE ENVIAMOS INFORMACION
        conexion.setDoOutput(true);
        //RECUPERAMOS EL Stream DEL SERVICIO PARA PODER ESCRIBIR
        //DATOS SOBRE EL
        OutputStream writer = conexion.getOutputStream();
        //ESCRIBIMOS LOS DATOS EN Stream FORMATO byte[]
        writer.write(doctorjson.getBytes());
        //LIBERAMOS EL FLUJO DEL Stream
        writer.flush();
        writer.close();
        int statuscode = conexion.getResponseCode();
        conexion.disconnect();
        return statuscode;
    }

    public int updateDoctor(int iddoctor, String apellido, String especialidad,
            int salario, int idhospital) throws MalformedURLException, IOException {
        String request = "api/doctores/put";
        URL url = new URL(this.urlapi + request);
        HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
        conexion.setRequestMethod("PUT");
        conexion.setRequestProperty("Content-Type", "application/json");
        Doctor doctor = new Doctor(iddoctor, apellido, especialidad, salario, idhospital);
        Gson converter = new Gson();
        String doctorjson = converter.toJson(doctor);
        conexion.setDoOutput(true);
        OutputStream writer = conexion.getOutputStream();
        writer.write(doctorjson.getBytes());
        writer.flush();
        writer.close();
        int statuscode = conexion.getResponseCode();
        conexion.disconnect();
        return statuscode;
    }
}
