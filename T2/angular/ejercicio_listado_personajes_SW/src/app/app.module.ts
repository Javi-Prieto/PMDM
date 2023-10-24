import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { PersonajesListComponent } from './components/personajes-list/personajes-list.component';
import { PersonajesItemComponent } from './components/personajes-item/personajes-item.component';

@NgModule({
  declarations: [
    AppComponent,
    PersonajesListComponent,
    PersonajesItemComponent,
  ],
  imports: [
    BrowserModule,
    NgbModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
