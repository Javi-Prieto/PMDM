import { Component } from '@angular/core';
import { MatTableModule } from '@angular/material/table';
import { Sex, Student } from 'src/app/models/alumno.interface';
import {MatRadioModule} from '@angular/material/radio';
import {FormsModule} from '@angular/forms';
import {MatCheckboxModule} from '@angular/material/checkbox';
import {MatCardModule} from '@angular/material/card';
import { Subject } from 'rxjs';

const TOTAL_HOURS = 50;
const STUDENTS: Student[] = [
  {
    id: '1',
    name: 'Miguel',
    lastname: 'Campos',
    sex: Sex.Female,
    age: 25,
    subjects: [
      {
        name: 'Math',
        hours: 5
      },
      {
        name: 'Spanish',
        hours: 4
      }
    ],
    paid: true
  },
  {
    id: '2',
    name: 'Pepe',
    lastname: 'García',
    sex: Sex.Female,
    age: 25,
    subjects: [
      {
        name: 'Math',
        hours: 10
      },
      {
        name: 'Spanish',
        hours: 30
      }
    ],
    paid: false
  }
];

@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
  styleUrls: ['./student-list.component.css'],
  standalone: true,
  imports: [MatTableModule, MatCardModule, MatCheckboxModule, FormsModule, MatRadioModule],
})
export class StudentListComponent {
  

  studentList = STUDENTS;

  getPaidString(student: Student) {
    return student.paid ? 'Yes' : 'No';
  }
  getSex(sex:number):string{
    if(sex == 1)
      return "Female";
    return "Male";
  }
  getProgressBar(student: Student): number {
    let totalHoursStudent = 0;
    student.subjects.forEach(subject => {
      totalHoursStudent += subject.hours;
    });
    let percent = parseFloat((totalHoursStudent * 100 / TOTAL_HOURS).toFixed(2));
    return percent;
  }
  
  columns = ['id', 'name', 'age', 'sex', 'subjects', 'percent' , 'paid'];

  changeColumns(name:string){
    var columnsCopy = ['id', 'name', 'age', 'sex', 'subjects', 'percent' , 'paid'];
    var index = columnsCopy.indexOf(name);
    var toChange = this.columns[this.columns.indexOf(name)];
    
   if(toChange == null){
    this.columns.splice(index, 0,name);
    debugger;
   }else{
    this.columns.splice(index, 1);
   }
  }
  setAllCheckBox():boolean{
    return true;
  }
  checkId = true;
  checkName = true;
  checkAge = true;
  checkSex = true;
  checkSub = true;
  checkPer = true;
  checkPaid= true;
  indeterminate = false;
  labelPosition: 'before' | 'after' = 'after';
  disabled = false;
  displayedColumns: string[] = this.columns;
  dataSource =  STUDENTS;

}
