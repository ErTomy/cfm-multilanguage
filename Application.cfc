component {
    this.name = "CFM_LANG";
    this.appBasePath = getDirectoryFromPath(getCurrentTemplatePath());
    this.applicationTimeout=CreateTimeSpan(10, 0, 0, 0);
	this.invokeImplicitAccessor=true;
    this.sessionManagement=true;
	this.sessionTimeout=CreateTimeSpan(0, 0, 30, 0);   	
	this.sessionCookie.httpOnly=true;
	this.sessionCookie.timeout='10';
	this.sessionCookie.disableupdate=true;

    function onApplicationStart(){		
		application.helpers = CreateObject('cfc.helpers');
		return true;
	}
	
	function onRequestStart(string targetPage){

		if(structKeyExists(url, 'reloadApplication')){
			onApplicationStart();	
        }
        
	}
   


    



}