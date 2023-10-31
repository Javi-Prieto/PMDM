import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { MovieTopRatedResponse } from '../models/movie-top-rated-list.interface';
import { MoviePopularResponse } from '../models/movie-popular-list.interface';
import { MovieDetailsResponse } from '../models/movie-details.interface';

@Injectable({
  providedIn: 'root'
})
export class MovieService {

  constructor(private http: HttpClient) { }

  getPopularMoviesList():Observable<MoviePopularResponse>{
    return this.http.get<MoviePopularResponse>("https://api.themoviedb.org/3/movie/popular?api_key=fab7d493325528d418b4366ba529f773");
  }

  getTopRatedMoviesList():Observable<MovieTopRatedResponse>{
    return this.http.get<MovieTopRatedResponse>("https://api.themoviedb.org/3/movie/top_rated?api_key=fab7d493325528d418b4366ba529f773");
  }

  getMovieDetails(id:number):Observable<MovieDetailsResponse>{
    return this.http.get<MovieDetailsResponse>(`https://api.themoviedb.org/3/movie/${id}?api_key=fab7d493325528d418b4366ba529f773`)
  }
}
