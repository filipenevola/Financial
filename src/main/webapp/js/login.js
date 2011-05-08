Ext.onReady(function(){
    Ext.QuickTips.init();
 	
 	logar = function(){ 
        login.getForm().submit({ 
            method: 'POST', 
            waitTitle: 'Connecting', 
            waitMsg: 'login...', 
 
            success: function(){                         	
	         	window.location = 'home.jsp';
                    },
 
                    failure: function(form, action){ 
                    	Ext.Msg.alert('Status', 'Login Successful!');
                if(action.failureType == 'server'){ 
                    obj = Ext.util.JSON.decode(action.response.responseText); 
                    Ext.Msg.alert('Login Failed!', obj.errors.reason); 
                }else{ 
                    Ext.Msg.alert('Warning!', 'Authentication server is unreachable : ' + action.response.responseText); 
                } 
            	login.getForm().reset(); 
            }
        }); 
    }
    
    var login = new Ext.FormPanel({ 
        labelWidth: 80,
        url: 'user/login.action', 
        frame: true, 
        title: 'Please Login', 
        defaultType: 'textfield',
		monitorValid: true,
        items:[
            { 
                fieldLabel: 'Username', 
                name: 'login',
                id: 'login',
                allowBlank: false 
            },{ 
                fieldLabel: 'Password', 
                name: 'pass',
                id: 'pass',
                inputType: 'password', 
                allowBlank: false 
            }
        ],   
        buttons: [{ 
            text:'Login',
            formBind: true,	 
            handler: logar
        }] 
    });
     
    var win = new Ext.Window({
        layout: 'fit',
        width: 300,
        height: 150,
        closable: false,
        resizable: false,
        plain: true,
        border: false,
        items: [login]
	});
	win.show();
	$('#pass').bind('keyup', function(e) {
		if (e.keyCode == 13) {
			logar();
		}
	});
		
});