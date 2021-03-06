import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { User } from 'src/app/store/models/user.model';
import { selectAuthenticatedUser } from 'src/app/store/selectors/auth.selector';
import { selectUsers, selectRoles, selectUserLoading, selectUserError } from 'src/app/store/selectors/user.selector';
import { ACTION_USER_CREATE_USER, ACTION_USER_DELETE_USER, ACTION_USER_EDIT_USER, ACTION_USER_GET_ROLES, ACTION_USER_GET_USERS } from 'src/app/store/store.constants';

@Component({
  selector: 'app-admin-container',
  templateUrl: './admin-container.component.html',
  styleUrls: ['./admin-container.component.scss']
})
export class AdminContainerComponent implements OnInit {
  getAuthenticatedUser$ = this.store.select(selectAuthenticatedUser);

  users$ = this.store.select(selectUsers);
  allRoles$ = this.store.select(selectRoles);

  userLoading$ = this.store.select(selectUserLoading);
  userError$ = this.store.select(selectUserError);

  constructor( private store: Store<any> ) { }

  ngOnInit(): void {
    this.getUsers();
  }

  getUsers() {
    this.store.dispatch({ type: ACTION_USER_GET_USERS });
    this.store.dispatch({ type: ACTION_USER_GET_ROLES });
  }

  createUser(pUser: User) {
    this.store.dispatch({ type: ACTION_USER_CREATE_USER, user: pUser });
  }

  editUser(pEvent: any) {
    this.store.dispatch({ type: ACTION_USER_EDIT_USER, user: pEvent.user, forceLogout: pEvent.forceLogout });
  }

  deleteUser(pEvent: any) {
    this.store.dispatch({ type: ACTION_USER_DELETE_USER, user: pEvent.user, forceLogout: pEvent.forceLogout });
  }

}
