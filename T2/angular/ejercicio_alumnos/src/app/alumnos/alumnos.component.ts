import { Component } from '@angular/core';
import { Alumnos } from '../model/alumnos.interface';
const ALUMNOS:Alumnos[] = [
  {
    "nombre": "Javier",
    "apellidos": "Prieto Ortiz",
    "id_alumno": 1,
    "edad": 18,
    "sexo": "hombre",
    "modulos": [
      {
        "nombre": "Dise�o Interfaces",
        "horas": 190
      }
    ]
  },
  {
    "nombre": "Alejandro",
    "apellidos": "Jimenez",
    "id_alumno": 2,
    "edad": 19,
    "sexo": "hombre",
    "modulos": [
      {
        "nombre": "Acceso a Datos",
        "horas": 190
      }
    ]
  },
  {
    "nombre": "Manuel",
    "apellidos": "Molina",
    "id_alumno": 3,
    "edad": 20,
    "sexo": "hombre",
    "modulos": [
      {
        "nombre": "Programaci�n Multimedia y Dispositivos M�viles",
        "horas": 190
      }
    ]
  }

]
@Component({
  selector: 'app-alumnos',
  templateUrl: './alumnos.component.html',
  styleUrls: ['./alumnos.component.css']
})
export class AlumnosComponent {
  alumnoList = ALUMNOS;
}
