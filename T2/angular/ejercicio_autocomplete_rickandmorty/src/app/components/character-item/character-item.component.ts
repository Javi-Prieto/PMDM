import { Component, Input } from '@angular/core';
import { Character } from 'src/models/character-list.interface';

@Component({
  selector: 'app-character-item',
  templateUrl: './character-item.component.html',
  styleUrls: ['./character-item.component.css']
})
export class CharacterItemComponent {
  @Input() character !: Character;
}
