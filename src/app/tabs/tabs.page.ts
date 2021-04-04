import { Component } from '@angular/core';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-tabs',
  templateUrl: 'tabs.page.html',
  styleUrls: ['tabs.page.scss']
})
export class TabsPage {

  w_app_contact = environment.w_app_contact;
  call_inquiry = environment.call_inquiry;
  
  constructor() { }

}
