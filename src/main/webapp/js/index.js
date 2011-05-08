Ext.onReady(function(){
	
	var month = new Date().getMonth() + 1;
	var year = new Date().getFullYear();
	var actual = month + '/' + year;
	var tabs = new Ext.TabPanel({
	    activeTab: 0,
	    items: [ panelMove
	             ,panelMoveInfo
	             ,panelCategory
	             ,panelTypeOfPay
	             ,panelCollectiveBuy
//	             ,panelInvestiment
//	             ,panelChartCategoryPay
//	             ,panelChartCategoryPay2 
	           ],
	    listeners: {
			tabchange: function(tab, panel) {
				switch(panel.id) {
					case 'panelCategory': 
						loadPanelCategory(); 
						break;
					case 'panelTypeOfPay': 
						loadPanelTypeOfPay(); 
						break;
					case 'panelMove': 
						loadPanelMove(); 
						break;
					case 'panelMoveInfo': 
						loadPanelMoveInfo(actual, 1); 
						break;
					case 'panelCollectiveBuy': 
						loadPanelCollectiveBuy(); 
						break;
//					case 'panelInvestiment': 
//						loadPanelInvestiment(); 
//						break;
//					case 'panelChartCategoryPay': 
//						loadPanelChartCategoryPay(); 
//						break;	
//					case 'panelChartCategoryPay2': 
//						loadPanelChartCategoryPay2(); 
//						break;					
				}
			}
		}
	});
	
    
    var viewPort = new Ext.Viewport({
        layout: 'fit',
        items: [tabs]
    });
});