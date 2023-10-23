import { Component,Input } from '@angular/core';
import { Planet } from 'src/app/models/planets.interface';

@Component({
  selector: 'app-planet-item',
  templateUrl: './planet-item.component.html',
  styleUrls: ['./planet-item.component.css']
})
export class PlanetItemComponent {
  @Input() planet!:Planet;

}

