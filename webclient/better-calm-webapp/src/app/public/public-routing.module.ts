import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { PlaylistsComponent } from "./playlists/playlists.component";
import { AppointmentComponent } from "./appointment/appointment.component";
import { ContentsComponent } from "./contents/contents/contents.component";
import { IndexPublicComponent } from "./index-public/index-public.component";

const routes: Routes = [
    {
        path:'',
        component: IndexPublicComponent,
        children: [
            {
                path: '',
                redirectTo: 'contents',
                pathMatch: 'full'
            },
            {
                path: 'contents',
                component: ContentsComponent,
                pathMatch: 'full'
            },
            {
                path: 'playlists',
                component: PlaylistsComponent,
                pathMatch: 'full'
            },
            {
                path: 'playlists/contents/:playlistId',
                component: ContentsComponent,
                pathMatch: 'full',
            },
            {
                path: 'appointment',
                component: AppointmentComponent,
                pathMatch: 'full'
            }
        ]
    }
]

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
  
export class PublicRoutingModule { }