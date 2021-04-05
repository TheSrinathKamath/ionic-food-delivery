import { Component, OnInit } from '@angular/core';
import { ToastController } from '@ionic/angular';
import { environment } from 'src/environments/environment';
import { ListingService } from '../api/listing.service';

@Component({
  selector: 'app-tabs',
  templateUrl: 'tabs.page.html',
  styleUrls: ['tabs.page.scss']
})
export class TabsPage implements OnInit {

  w_app_contact = '';
  call_inquiry = '';

  constructor(
    private _data: ListingService,
    public toastController: ToastController
  ) { }
  async ngOnInit() {
    const response_raw = await this._data.getNavButtonContacts();
    const response = JSON.parse(JSON.stringify(response_raw));

    if (!response['status']) { this.presentToast('Sorry, items not found!'); return };
    
    this.w_app_contact = response['result'].find(el=>el.c_name == 'nav_order').c_number;
    this.call_inquiry = response['result'].find(el=>el.c_name == 'nav_inquiry').c_number;
  }

  async presentToast(message) {
    const toast = await this.toastController.create({
      message: message,
      duration: 2000
    });
    toast.present();
  }
}
