import { Component, Input } from '@angular/core';
import { Movie } from 'src/app/models/movie-now-playing-list.interface';

@Component({
  selector: 'app-movie-item',
  templateUrl: './movie-item.component.html',
  styleUrls: ['./movie-item.component.css']
})
export class MovieItemComponent {
  @Input() movie !: Movie;

  setUrlImage():string {
    return `https://image.tmdb.org/t/p/w220_and_h330_face${this.movie.poster_path}`;
  }
}
