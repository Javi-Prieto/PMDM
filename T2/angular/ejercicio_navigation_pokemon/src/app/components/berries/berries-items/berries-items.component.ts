import { Component, Input } from '@angular/core';
import { Berry } from 'src/models/berries/berries-list.interface';

@Component({
  selector: 'app-berries-items',
  templateUrl: './berries-items.component.html',
  styleUrls: ['./berries-items.component.css']
})
export class BerriesItemsComponent {
  @Input() berry !: Berry;

  setBerryImage():string{
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/berries/'+ this.berry.name + '-berry.png';
  }
}
