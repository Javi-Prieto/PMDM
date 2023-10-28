import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Observable, filter, map, of, startWith } from 'rxjs';
import { CharacterService } from 'src/app/services/character.service';
import { CharacterDetailsResponses } from 'src/models/character-details.interface';
import { Character, Info } from 'src/models/character-list.interface';

@Component({
  selector: 'app-character-list',
  templateUrl: './character-list.component.html',
  styleUrls: ['./character-list.component.css']
})
export class CharacterListComponent implements OnInit{
  
  characterList !: Character[];
  characterInfo !: Info;
  myControl = new FormControl<string | Character>('');
  filteredOptions !: Observable<Character[]>;
  selectedCharacter !: CharacterDetailsResponses;

  constructor(private characterService: CharacterService, ){}
  
  ngOnInit() {
    this.characterService.getListCharacters().subscribe(resp => {
        this.characterList = resp.results;
        this.characterInfo = resp.info;
        this.filteredOptions = this.myControl.valueChanges.pipe(
          startWith(''),
          map(value => {
            const characterName = typeof value === 'string' ? value : value?.name;
            return characterName ? this._filter( characterName as string) : this.characterList;
          })
        );
    });
  }
  displayFn(c: Character): string{
    return c && c.name? c.name : '';
  }

  changeCard(character: Character){
    this.characterService.getCharacter(character.url).subscribe(character => {
      this.selectedCharacter=character;
      const selectedElement = document.querySelector('app-character-detail');
      
      selectedElement?.classList.add('d-visible')    
    });
  }
  

  private _filter(name: string): Character[]{
    const filterValue = name.toLowerCase();

    return this.characterList.filter(c => c.name.toLowerCase().includes(filterValue));
  }

}
