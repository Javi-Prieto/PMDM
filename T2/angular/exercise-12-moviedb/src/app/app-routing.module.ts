import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PageHomeComponent } from './ui/page-home/page-home.component';
import { PageDetailsComponent } from './ui/page-details/page-details.component';
import { PageNotFoundComponent } from './ui/page-not-found/page-not-found.component';

const routes: Routes = [
  {path: 'movies', component:PageHomeComponent},
  {path: 'details/:id', component:PageDetailsComponent},
  {path: '', pathMatch: 'full', redirectTo:'/movies'},
  {path: '**', component:PageNotFoundComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
