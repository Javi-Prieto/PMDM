import { Component, OnInit } from '@angular/core';
import { CharacterListResponse, Info } from 'src/app/models/character-list.interface';
import { CharacterService } from 'src/app/services/character.service';

@Component({
  selector: 'app-character-list',
  templateUrl: './character-list.component.html',
  styleUrls: ['./character-list.component.css']
})
export class CharacterListComponent implements OnInit{
  characterList!: CharacterListResponse;
  characterListInfo !: Info;
  actualPage = 1;
  constructor(private characterService:CharacterService){}

  ngOnInit(): void {
    this.loadNewPage();
  }

  loadNewPage(): void{
    this.characterService.getCharacterList(this.actualPage).subscribe(resp => {this.characterList = resp});
  }
}
