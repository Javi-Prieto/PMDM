import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { CharacterDetailsResponses } from 'src/models/character-details.interface';
import { CharacterListResponses } from 'src/models/character-list.interface';

@Injectable({
  providedIn: 'root'
})
export class CharacterService {

  constructor(private http:HttpClient) { }

  getListCharacters():Observable<CharacterListResponses>{
    return this.http.get<CharacterListResponses>('https://rickandmortyapi.com/api/character');
  }

  getCharacter(url:string):Observable<CharacterDetailsResponses>{
    return this.http.get<CharacterDetailsResponses>(url);
  }
}
