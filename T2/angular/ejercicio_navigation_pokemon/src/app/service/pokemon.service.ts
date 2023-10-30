import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { PokemonDetailsResponse } from 'src/models/pokemon/pokemon-details.interface';
import { PokemonListResponse } from 'src/models/pokemon/pokemon-list.interface';

@Injectable({
  providedIn: 'root'
})
export class PokemonService {

  constructor(private http: HttpClient ) { }
  getPokemonList():Observable<PokemonListResponse>{
    return this.http.get<PokemonListResponse>("https://pokeapi.co/api/v2/pokemon/");
  }
  getPokemonDetails(url : string):Observable<PokemonDetailsResponse>{
    return this.http.get<PokemonDetailsResponse>(url);
  }
}
