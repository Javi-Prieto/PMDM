import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { CharacterListResponse } from '../models/character-list.interface';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CharacterService {

  constructor(private http: HttpClient) { }

  getCharacterList(page:number):Observable<CharacterListResponse>{
    return this.http.get<CharacterListResponse>(`https://rickandmortyapi.com/api/character/?page=${page}`);
  }
}
