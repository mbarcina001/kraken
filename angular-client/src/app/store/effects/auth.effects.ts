import { Injectable } from '@angular/core';
import { Actions, ofType, Effect } from '@ngrx/effects';
import { map, mergeMap, catchError } from 'rxjs/operators';
import { AuthService } from '../services/auth.service';
import { auth, authSuccess } from '../actions/auth.actions';
import { Auth, AuthResponse } from '../models/auth.model';

@Injectable()
export class IssueEffects {

    @Effect()
    auth$ = this.actions$.pipe(
      ofType(auth),
      mergeMap((action: any) => this.authService.auth(action.email, action.password)
        .pipe(
          map((res: AuthResponse) => {
            const authResult: Auth = new Auth(
              res.access_token, res.token_type, res.refresh_token, res.expires_in, res.scope
            );
            return authSuccess({ authResult });
          }),
          /*catchError((err: any) => {
            // return of(getIssueListFail({ error: error.message}))
            console.error(err);
          })*/
        )
      )
    );

    constructor(private actions$: Actions, private authService: AuthService) {}
}