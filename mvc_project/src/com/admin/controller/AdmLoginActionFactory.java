package com.admin.controller;

import com.login.controller.action.AdmAction;
import com.login.controller.action.AdmLoginAction;
import com.login.controller.action.AdmLoginOKAction;
import com.login.controller.action.AdmLogoutAction;

public class AdmLoginActionFactory {
	static private AdmLoginActionFactory instance = new AdmLoginActionFactory();
	static public AdmLoginActionFactory getInstance(){
		return instance;
	}
	private AdmLoginActionFactory(){}
	
	
	public AdmAction getAction(String command){
		AdmAction action = null;
		if( command.equals("/adm/login/login.do") ){
			action = new AdmLoginAction();
		}
		if( command.equals("/adm/login/loginOK.do") ){
			action = new AdmLoginOKAction();
		}	
		if( command.equals("/adm/login/logout.do") ){
			action = new AdmLogoutAction();
		}			
		return action;
	}
}
