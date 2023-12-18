import { Component, OnInit } from '@angular/core';
import { UserService } from '../../services/user.service';
@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrl: './user-list.component.css'
})
export class UserListComponent implements OnInit{
  userList: any ;
  constructor(private userService: UserService){}
  
  ngOnInit(): void {
      this.userService.getUsers()
        .then((users) => {
          this.userList = users;
          console.log(this.userList);
        })
        .catch(() => console.error("tutto malle"));
  }
}
