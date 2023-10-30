import { Component, Input } from '@angular/core';
import { Pokemon } from 'src/models/pokemon/pokemon-list.interface';

@Component({
  selector: 'app-pokemon-item',
  templateUrl: './pokemon-item.component.html',
  styleUrls: ['./pokemon-item.component.css']
})
export class PokemonItemComponent {
  @Input() pokemon !: Pokemon;


  setPokemonImage():string{
    let id = this.pokemon.url.split("/").reverse()[1];
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/'+id+'.png';
  }
}
