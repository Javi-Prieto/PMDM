import { Component, EventEmitter, Input, Output } from '@angular/core';
import { MovieP } from 'src/app/models/movie-popular-list.interface';
import { MovieTR } from 'src/app/models/movie-top-rated-list.interface';

@Component({
  selector: 'app-movie-item',
  templateUrl: './movie-item.component.html',
  styleUrls: ['./movie-item.component.css']
})
export class MovieItemComponent {

  @Input() movie !: MovieP | MovieTR;
  @Output() toEmit = new EventEmitter<number>();

  clickOnFilm(){
    this.toEmit.emit(this.movie.id);
  }
  

  setImgURL():string {
    return `https://image.tmdb.org/t/p/w220_and_h330_face${this.movie.poster_path}`;
  }
}
