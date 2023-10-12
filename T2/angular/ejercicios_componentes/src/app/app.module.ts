import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { CarCardComponent } from './car-card/car-card.component';
import { RestaurantCardComponent } from './restaurant-card/restaurant-card.component';
import { NgbdRatingBasic } from './rating/rating.component';

@NgModule({
  declarations: [
    AppComponent,
    CarCardComponent,
    RestaurantCardComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    NgbdRatingBasic
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
