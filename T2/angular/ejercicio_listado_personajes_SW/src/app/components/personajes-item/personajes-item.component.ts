import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Personaje } from 'src/models/personajes.interface';

@Component({
  selector: 'app-personajes-item',
  templateUrl: './personajes-item.component.html',
  styleUrls: ['./personajes-item.component.css']
})
export class PersonajesItemComponent {
  @Input() personaje!: Personaje
  @Output() clickOnCharacter = new EventEmitter<Personaje>();
  
  setImgUrl():string{
    let characterId = this.personaje.url.split("/").reverse()[1];
    return "https://starwars-visualguide.com/assets/img/characters/" + characterId + ".jpg"
  }

  pickCharacter() {
    this.clickOnCharacter.emit(this.personaje);

  };
}
