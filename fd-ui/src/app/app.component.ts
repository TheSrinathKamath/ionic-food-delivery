import { Component, OnInit } from '@angular/core';
import { Plugins } from '@capacitor/core';
const { SplashScreen } = Plugins;

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss'],
})
export class AppComponent implements OnInit {
  ngOnInit() {
    SplashScreen.show({
      showDuration: 2000,
      autoHide: true,
      fadeInDuration: 10,
      fadeOutDuration: 10
    });
  }
}
