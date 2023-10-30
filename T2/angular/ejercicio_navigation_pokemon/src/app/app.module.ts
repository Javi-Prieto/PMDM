import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClient, HttpClientModule } from '@angular/common/http'
import { AppRoutingModule } from './modules/app-routing.module';
import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { PokemonListComponent } from './components/pokemon/pokemon-list/pokemon-list.component';
import { PokemonItemComponent } from './components/pokemon/pokemon-item/pokemon-item.component';
import { BerriesListComponent } from './components/berries/berries-list/berries-list.component';
import { BerriesItemsComponent } from './components/berries/berries-items/berries-items.component';
import { NavBarComponent } from './components/navigation/nav-bar/nav-bar.component';

@NgModule({
  declarations: [
    AppComponent,
    PokemonListComponent,
    PokemonItemComponent,
    BerriesListComponent,
    BerriesItemsComponent,
    NavBarComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
