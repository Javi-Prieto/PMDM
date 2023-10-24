import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Pokemon } from 'src/app/models/pokemonlist.interface';

@Component({
  selector: 'app-pokemon-item',
  templateUrl: './pokemon-item.component.html',
  styleUrls: ['./pokemon-item.component.css']
})
export class PokemonItemComponent {
  @Input() pokemon!:Pokemon;

  @Output() pokemonClick = new EventEmitter<string>();

  clickedDetails(){
    this.pokemonClick.emit(this.pokemon.name)
  }
}
