import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { auth } from '../../../store/actions/auth.actions';


@Component({
  selector: 'app-login-container',
  templateUrl: './login-container.component.html',
  styleUrls: ['./login-container.component.scss']
})
export class LoginContainerComponent implements OnInit{

  auth$ = this.store.select(state => state.auth.authResult);
  authLoading$ = this.store.select(state => state.auth.loading);
  authErrorMessage$ = this.store.select(state => state.auth.error);

  constructor(
    private store: Store<any>
  ) { }

  ngOnInit(): void {
    this.authLoading$.subscribe((x) => {
      console.log(x);
    });
  }



  login($event: any) {
    this.store.dispatch(auth({email: $event.email, password: $event.password}));
  }

  register($event: any) {
    // TODO
  }
}
