import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PokemonListComponent } from '../components/pokemon/pokemon-list/pokemon-list.component';
import { BerriesListComponent } from '../components/berries/berries-list/berries-list.component';

const routes: Routes = [
  {path: 'pokemon', component: PokemonListComponent},
  {path: 'berries', component: BerriesListComponent},
  {path: '', pathMatch: 'full', redirectTo: 'pokemon'},
  {path: '**', redirectTo: 'pokemon'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
