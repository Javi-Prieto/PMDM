import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { MovieNowPlayingResponses } from '../models/movie-now-playing-list.interface';
import { environment } from 'src/environments/environment.development';
import { MovieDetailsResponse } from '../models/movie-details.interface';

@Injectable({
  providedIn: 'root'
})
export class MovieService {

  constructor(private http: HttpClient) { }

  getMovieList(page:number):Observable<MovieNowPlayingResponses>{
    return this.http.get<MovieNowPlayingResponses>(`${environment.baseUrl}/now_playing?${environment.apiKey}&&page=${page}`);
  }

  getMovieDetails(id:number):Observable<MovieDetailsResponse>{
    return this.http.get<MovieDetailsResponse>(`${environment.baseUrl}/${id}?${environment.apiKey}`)
  }
}
