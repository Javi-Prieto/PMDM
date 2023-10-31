import { Component } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { MovieDetailsResponse } from 'src/app/models/movie-details.interface';
import { MovieService } from 'src/app/services/movie.service';

@Component({
  selector: 'app-page-home',
  templateUrl: './page-home.component.html',
  styleUrls: ['./page-home.component.css']
})
export class PageHomeComponent {
  selectedFilm!: MovieDetailsResponse;

  constructor(private movieService: MovieService, private modalService: NgbModal){};

  open(id: number, modal: any){
    this.movieService.getMovieDetails(id).subscribe(movie => {
      this.selectedFilm= movie;
      this.modalService.open(modal);
    });
  }
}
