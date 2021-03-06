import { Component, Output, EventEmitter, ViewChild, TemplateRef, ChangeDetectorRef, ChangeDetectionStrategy, AfterViewInit, Input } from '@angular/core';
import { Subject } from 'rxjs';
import { LOGIN_TEMPLATE, REGISTER_TEMPLATE } from '../../app.constants';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class LoginComponent implements AfterViewInit {

  @ViewChild('loginTmpl') loginTmpl: TemplateRef<any>;
  @ViewChild('registerTmpl') registerTmpl: TemplateRef<any>;

  @Input() isLoading: boolean;

  error$: any;
  get error(): any {
    return this.error$;
  }
  @Input() set error(pValue: any) {
    if (pValue) {
      this.enableForm.next(true);
    } else {
      this.showingTemplate = LOGIN_TEMPLATE;
      this.resetForm.next(true);
    }
  }

  @Output() doLogin = new EventEmitter<any>();
  @Output() doRegister = new EventEmitter<any>();

  private showingTemplate = LOGIN_TEMPLATE;
  public enableForm = new Subject();
  public resetForm = new Subject();

  constructor(private cdRef: ChangeDetectorRef){}

  ngAfterViewInit() {
    this.cdRef.detectChanges();
  }

  getShowingTemplate() {
    return this.showingTemplate === LOGIN_TEMPLATE ? this.loginTmpl : this.registerTmpl;
  }

  showLoginTemplate() {
    this.showingTemplate = LOGIN_TEMPLATE;
  }

  showRegisterTemplate() {
    this.showingTemplate = REGISTER_TEMPLATE;
  }

}
