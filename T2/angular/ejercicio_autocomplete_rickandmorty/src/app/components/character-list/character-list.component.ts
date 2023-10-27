import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Observable, filter, map, startWith } from 'rxjs';
import { CharacterService } from 'src/app/services/character.service';
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
  
  constructor(private characterService: CharacterService){}
  
  ngOnInit(): void {
    this.characterService.getListCharacters().subscribe(resp => {
        this.characterList = resp.results;
        this.characterInfo = resp.info;
    });
    this.filteredOptions = this.myControl.valueChanges.pipe(
      startWith(''),
      map(value => {
        const characterName = typeof value === 'string' ? value : value?.name;
        return characterName ? this._filter( characterName as string) : this.characterList.slice();
      })
    );
    
  }
  displayFn(c: Character): string{
    return c && c.name? c.name : '';
  }
  onSubmit():Character[]{
    this.filteredOptions.subscribe(fliteredCharacters => {
      this.characterList = fliteredCharacters;
    });
    return this.characterList;
  }

  private _filter(name: string): Character[]{
    const filterValue = name.toLowerCase();

    return this.characterList.filter(c => c.name.toLowerCase().includes(filterValue));
  }

}
