import { Component } from '@angular/core';

@Component({
  selector: 'app-calculator',
  templateUrl: './calculator.component.html',
  styleUrls: ['./calculator.component.css']
})
export class CalculatorComponent {
    n1:string = "";
    n2:string = "";
    operator = "";
    screen = "0";
    first=true;
  
  getNumber(num:number){
    if(this.first){
      this.n1.concat(num.toString());
      this.changeScreen(this.n1);
    }
    
  }
  changeScreen(text:string){
    this.screen = text;
  }
}
