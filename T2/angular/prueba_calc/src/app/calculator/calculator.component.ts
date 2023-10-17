import { Component } from '@angular/core';
import { toInteger } from '@ng-bootstrap/ng-bootstrap/util/util';

@Component({
  selector: 'app-calculator',
  templateUrl: './calculator.component.html',
  styleUrls: ['./calculator.component.css']
})
export class CalculatorComponent {
  //Todos estos atributos se podrían reducir a solo el atributo operation
  //pero voy mal de tiempo entonces no voy a hacerlo   
    n1 = "";
    n2 = "";
    operator = "";
    screen = "0";
    operation = "";
  
  getNumber(num:number){
    if(this.operator == ""){
      this.n1 += num.toString();
      this.operation += num;
      
    }else{
      this.n2 += num.toString();
      this.operation += num;
    }
    this.changeScreen();
  }
  
  getOperator(ope:string){
    this.operator = ope ;
    this.operation += ope;
    this.changeScreen();
  }

  changeScreen(){
    this.screen = this.operation;
  }
  getResult(){
    let op1:number = +this.n1;
    let op2:number = +this.n2;
    this.n1 = "";
    this.n2 = "";
    let result:number;
    this.operator == "+"? result = op1 + op2 : result = op1 - op2;
    this.screen = result.toString();
  }
  deleteAll(){
    this.operation = "";
    this.screen = "0";
  }
  deleteOne(){
    this.operation = this.operation.replace(this.operation.charAt(this.operation.length -1), "");
    if(this.operator == ""){
      if(this.n2 == ""){
        this.n1 = this.n1.replace(this.n1.charAt(this.n1.length -1), "");
      }else{
        this.n2 = this.n2.replace(this.n2.charAt(this.n2.length -1), "");
      }
    }else{
      this.operator = this.operator.replace(this.operator.charAt(this.operator.length - 1), "");
    }
    console.log(this.n1)
    console.log(this.operation)
    this.changeScreen();
  }
 
}
