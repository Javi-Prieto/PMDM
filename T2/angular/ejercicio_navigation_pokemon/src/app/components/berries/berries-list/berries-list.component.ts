import { Component, OnInit } from '@angular/core';
import { BerryService } from 'src/app/service/berry.service';
import { Berry } from 'src/models/berries/berries-list.interface';

@Component({
  selector: 'app-berries-list',
  templateUrl: './berries-list.component.html',
  styleUrls: ['./berries-list.component.css']
})
export class BerriesListComponent implements OnInit{
  
  berriesList !: Berry[];

  constructor(private berryService: BerryService){}
  
  ngOnInit(): void {
    this.berryService.getBerriesList().subscribe(b => {this.berriesList = b.results});
  }
}
