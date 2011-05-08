Ext.onReady(function() {
    
	var toolbar = new Ext.Toolbar({
        items   : [
            {text: 'Home', handler: goHome},
            {text: 'Moves', handler: goMoves},
            {text: 'Categories', handler: goCategories},
            {text: 'Types of Pay', handler: goTypeOfPays},
            {text: 'Charts', handler: goChartCategoryPay},
            {text: 'logout', handler: goLogout}
        ]
    });
    
    var menu = new Ext.Panel({
        border  : true,
        width   : 800,
        tbar: toolbar
    });

    function goHome(){
    	window.location = 'home.jsp';
    }
    
    function goCategories(){
    	window.location = 'categories.jsp';
    }
    
    function goMoves(){
    	window.location = 'moves.jsp';
    }

    function goTypeOfPays(){
    	window.location = 'typeOfPay.jsp';
    }
    
    function goChartCategoryPay(){
    	window.location = 'chartCategoryPay.jsp';
    }
    
    function goLogout(){
    	Ext.Msg.confirm('Logout', 'Are you sure?', function(btn, text) {
		   if (btn == 'yes'){
			   window.location = 'index.jsp';
		   }
		});
    }

    //render to DIV
    menu.render('menu');
    
});