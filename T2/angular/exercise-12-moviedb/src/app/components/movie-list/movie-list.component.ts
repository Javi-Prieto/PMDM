import { Component, OnInit } from '@angular/core';
import { Movie } from 'src/app/models/movie-now-playing-list.interface';
import { MovieService } from 'src/app/services/movie.service';

@Component({
  selector: 'app-movie-list',
  templateUrl: './movie-list.component.html',
  styleUrls: ['./movie-list.component.css']
})
export class MovieListComponent implements OnInit{
  movieList!: Movie[];
  movieCount !: number;
  actualPage : number = 1;
  constructor(private movieService: MovieService){}

  ngOnInit(): void {
      this.loadNewPage();
  }
  loadNewPage(): void{
    this.movieService.getMovieList(this.actualPage).subscribe(rerp => {
      this.movieList = rerp.results;
      this.movieCount = rerp.total_results;
    });
  }
}
