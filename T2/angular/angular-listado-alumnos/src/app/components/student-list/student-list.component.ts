import { Component } from '@angular/core';
import { Sex, Student } from 'src/app/models/alumno.interface';



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
  styleUrls: ['./student-list.component.css']
})
export class StudentListComponent {
  displayedColumns: string[] = ['id', 'name', 'age', 'sex', 'subjects', 'percent' , 'paid'];
  studentList = STUDENTS;
  
  checkId: boolean = true;
  checkName: boolean = true;
  checkAge: boolean = true;
  checkSex: boolean = true;
  checkPer: boolean = true;
  checkPaid: boolean= true;
  
  

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
  
  

  changeColumns(){
    this.displayedColumns =[];
    debugger;
    if(this.checkId){
      this.displayedColumns.push('id');
    }
    if(this.checkName){
      this.displayedColumns.push('name');
    }
    if(this.checkAge){
      this.displayedColumns.push('age');
    }
    if(this.checkSex){
      this.displayedColumns.push('sex');
    }
    if(this.checkPer){
      this.displayedColumns.push('percent');
    }
    if(this.checkPaid){
      this.displayedColumns.push('paid');
    }
  }
  

}
