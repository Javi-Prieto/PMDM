import { Injectable } from '@angular/core';
import {
  Firestore,
  addDoc,
  collection,
  getDocs,
  query,
} from '@angular/fire/firestore';
import { Observable } from 'rxjs';
import { of } from 'rxjs';

const COLLECTION_USERS = 'users';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  constructor(public firestore: Firestore) {}

  async createUser(name: string, age: number) {
    const docRef = await addDoc(collection(this.firestore, COLLECTION_USERS), {
      name: name,
      age: age,
    });
    console.log('Document written with ID: ', docRef.id);
  }

  async getUsers() {
    const docs = (await getDocs(collection(this.firestore, COLLECTION_USERS))).docChanges();
    let users: any[] = [];
    
    docs.forEach(user => {
      users.push(user.doc.data());
    });
    let toReturn = of(users);
    return users;
  }
}
