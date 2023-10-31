import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { MovieP } from 'src/app/models/movie-popular-list.interface';
import { MovieService } from 'src/app/services/movie.service';

@Component({
  selector: 'app-movie-popular-list',
  templateUrl: './movie-popular-list.component.html',
  styleUrls: ['./movie-popular-list.component.css']
})
export class MoviePopularListComponent implements OnInit{
  movieList !: MovieP[];
  @Output() toEmit = new EventEmitter<number>();

  constructor(private movieService: MovieService){}

  ngOnInit(): void {
      this.movieService.getPopularMoviesList().subscribe(list => this.movieList = list.results);
  }
  clickOnPopularFilm(id: number){
    this.toEmit.emit(id);
  }
}
