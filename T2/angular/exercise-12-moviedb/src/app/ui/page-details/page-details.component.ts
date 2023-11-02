import { Component, OnInit, inject } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { MovieDetailsResponse } from 'src/app/models/movie-details.interface';
import { Movie } from 'src/app/models/movie-now-playing-list.interface';
import { MovieService } from 'src/app/services/movie.service';

@Component({
  selector: 'app-page-details',
  templateUrl: './page-details.component.html',
  styleUrls: ['./page-details.component.css']
})
export class PageDetailsComponent implements OnInit{
  route: ActivatedRoute = inject(ActivatedRoute);
  movieId : number = 0;
  selectedMovie !: MovieDetailsResponse;

  constructor(private movieService:MovieService){
    this.movieId = Number(this.route.snapshot.params['id']);
  }
  ngOnInit(): void {
      this.movieService.getMovieDetails(this.movieId).subscribe(resp => {this.selectedMovie = resp});
  }

  setUrlImage():string {
    return `https://image.tmdb.org/t/p/w220_and_h330_face${this.selectedMovie.poster_path}`;
  }
  setImgUrl(comp:any):string{
    return `https://image.tmdb.org/t/p/w220_and_h330_face${comp.logo_path}`;
  }

  isForAdult():string{
    if(this.selectedMovie.adult)
      return "🔞";
    return "👨‍👩‍👧‍👦";
  }
  setColletcionUrlImage():string{
    return `https://image.tmdb.org/t/p/w220_and_h330_face${this.selectedMovie.belongs_to_collection.poster_path}`;
  }
}
