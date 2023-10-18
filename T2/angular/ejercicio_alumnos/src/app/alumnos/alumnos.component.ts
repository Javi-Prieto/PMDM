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
        "nombre": "Diseno Interfaces",
        "horas": 190
      },
      {
        "nombre": "Acceso a Datos",
        "horas": 260
      },
      {
        "nombre": "Programacion Multimedia y Dispositivos Moviles",
        "horas": 200
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
        "horas": 260
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
        "nombre": "Programacion Multimedia y Dispositivos Moviles",
        "horas": 200
      },
      {
        "nombre": "Acceso a Datos",
        "horas": 260
      }
    ]
  },
  {
    "nombre": "Loli",
    "apellidos": "Gutierrez Martinez",
    "id_alumno": 4,
    "edad": 26,
    "sexo": "mujer",
    "modulos": [
      {
        "nombre": "Programacion Multimedia y Dispositivos Moviles",
        "horas": 200
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
  horasTotales = 650;
  horasTotalesAlumno = 0;
  setHorasAlumno(horas:number):number{
    this.horasTotalesAlumno += horas
    return this.horasTotalesAlumno;
  }
  checkHoras():boolean{
    console.log(this.horasTotalesAlumno)
    if(this.horasTotalesAlumno >= this.horasTotales){
      this.horasTotalesAlumno = 0;
      return true;
    }
      this.horasTotalesAlumno = 0;
    return false;
  }
}
