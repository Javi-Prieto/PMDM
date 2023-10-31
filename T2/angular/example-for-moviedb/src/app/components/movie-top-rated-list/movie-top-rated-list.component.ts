import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { MovieTR } from 'src/app/models/movie-top-rated-list.interface';
import { MovieService } from 'src/app/services/movie.service';

@Component({
  selector: 'app-movie-top-rated-list',
  templateUrl: './movie-top-rated-list.component.html',
  styleUrls: ['./movie-top-rated-list.component.css']
})
export class MovieTopRatedListComponent implements OnInit{
  movieList !: MovieTR[];
  @Output() toEmit = new EventEmitter<number>();
  constructor(private movieService:MovieService){}

  ngOnInit(): void {
      this.movieService.getTopRatedMoviesList().subscribe(list => this.movieList = list.results);
  }
  clickOnTopRated(id: number){
    this.toEmit.emit(id);
  }
}
