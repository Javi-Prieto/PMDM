import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BerryDetailsResponse } from 'src/models/berries/berries-details.interface';
import { BerriesListResponses } from 'src/models/berries/berries-list.interface';

@Injectable({
  providedIn: 'root'
})
export class BerryService {

  constructor(private http:HttpClient) { }

  getBerriesList():Observable<BerriesListResponses>{
    return this.http.get<BerriesListResponses>("https://pokeapi.co/api/v2/berry/");
  }
  getBerrieDetail(url: string):Observable<BerryDetailsResponse>{
    return this.http.get<BerryDetailsResponse>(url);
  }
}
