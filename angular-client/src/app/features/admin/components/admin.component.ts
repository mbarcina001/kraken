import { Component, Output, EventEmitter, Input, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { User } from 'src/app/store/models/user.model';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.scss']
})
export class AdminComponent {

  @Input() loading: boolean;
  @Output() reloadUserList = new EventEmitter();

  userList$: User[];
  get userList(): User[] {
    return this.userList$;
  }
  @Input() set userList(value: User[]) {
    if (value && value.length > 0) {
      this.dataSource = new MatTableDataSource(value);
      this.sortAndPaginate();
    }
  }

  dataSource: any;

  displayedColumns: string[] = ['username', 'email', 'roles'];

  @ViewChild(MatPaginator, {static: false}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: false}) sort: MatSort;

  constructor() { }

  reload(): void {
    this.reloadUserList.emit();
  }

  sortAndPaginate() {
    /*
    * The code needs to be inside a timeout function as angular material paginator doesn't work well inside *ngIf
    */
    setTimeout(() => {
      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator;
    });
  }

  getRoles(elementRoles) {
    return elementRoles.map(role => role.name.toLowerCase().replace('role_', '')).join(', ');
  }

}