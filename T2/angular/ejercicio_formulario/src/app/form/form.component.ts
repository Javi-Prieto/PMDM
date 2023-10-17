import { Component } from '@angular/core';

@Component({
  selector: 'app-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.css']
})
export class FormComponent {
  name="";
  apellidos="";
  NIF="";
  telf="";
  email="";
  sex="";
  desc="";
  contr="";
  confC="";
  showData(){
    console.log(
      "name: " + this.name + " " +
      "apellidos: " + this.apellidos + " "+
      "NIF: " + this.NIF + " "+
      "telefono: " + this.telf + " "+ 
      "email: " + this.email + " "+
      "sex: " + this.sex + " "+
      "desc: " + this.desc +" "+
      "contraseña: " + this.contr +" "+ 
      "confirmarContraseña: " + this.confC
    )
  }
  tryData(){
    if(this.name =="" &&
    this.apellidos =="" &&
    this.NIF =="" &&
    this.confC =="" &&
    this.contr =="" &&
    this.email =="" &&
    this.sex =="" &&
    this.desc =="" &&
    this.telf =="" ){
      console.log("Datos Incorrectos")
    }else{
      if(this.contr == this.confC){
        this.showData();
      }else(
        console.log("Las contraseñas no coinciden")
      )
    }
  }
}
