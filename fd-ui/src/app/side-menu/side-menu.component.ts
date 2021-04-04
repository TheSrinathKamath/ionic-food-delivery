import { Component, OnInit } from '@angular/core';
import { Plugins } from '@capacitor/core';
const { Share } = Plugins;

@Component({
  selector: 'app-side-menu',
  templateUrl: './side-menu.component.html',
  styleUrls: ['./side-menu.component.scss'],
})
export class SideMenuComponent implements OnInit {

  constructor() { }

  ngOnInit() { }

  async shareApp() {
    try {
      const response = await Share.share({
        dialogTitle: "വിരുന്ന്‌ - രുചികരമായ ഭക്ഷണം നിങ്ങളുടെ അരികിൽ",
        title: 'വിരുന്ന്‌ - A food delivery initiative by The Paravur Vadakkekara Service Co-operative Bank Ltd. No.3131',
        text: 'Get healthy, homely food with വിരുന്ന്‌.',
      })
    } catch (error) {
      console.log(error)
    }

  }

}
