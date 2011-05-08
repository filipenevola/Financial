Ext.onReady(function(){

	Ext.BLANK_IMAGE_URL = '/f/extjs/resources/images/default/s.gif';
	
	//Panel for progress bar
	var progressPanel = new Ext.Panel(
		{id: "progressPanel", bodyStyle: 'background-color:white;', layout: 'table',
    	border: false, hidden: false,
    	layoutConfig: {
    		columns: 1
    	},
    	items: [
	    	new Ext.ProgressBar({text:'Wait ...', width: 150, id:'myprogress', cls:'center-align'})
    	]
    });
	
	//Window for progress bar
    var progress = new Ext.Window(
    	{plain: false, modal: true, closable: false, border: true, closeAction: 'hide',
    	maximizable: false, resizable: false, buttonAlign: 'center', bodyStyle: 'background-color:white;',
    	id: 'progress', width: 164, height: 37, html: "",
    	items: [progressPanel]
    });
    
	var panel = new Ext.Panel({
        title: 'Home',
        frame: true,
        width: 800,
        height: 300,
        layout: 'fit',
        html: '<center><font size="24">Home page of financial control.</font></center>'
    });
	
	panel.render('home');
    

});