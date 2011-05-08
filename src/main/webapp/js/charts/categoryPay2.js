
//Listener for exceptions
Ext.data.DataProxy.addListener('exception', function(proxy, type, action, options, res) {
	Ext.Msg.alert('ERROR', 'Nobody logged, please login', function(btn, text) {
	   if (btn == 'ok'){
		   window.location = 'index.jsp';
	   }
	});
});


var panelCategoryPay2 = new Ext.Panel({
	title: 'Pay per Category (just with Move\'s)',
    height: 800,
    html: '<img src="chart/categoryPay2.action" alt="Graph" />'
});

var panelChartCategoryPay2 = new Ext.Panel({
	id: 'panelChartCategoryPay2',
	title: 'Chart JFreeChart',
    split: true,
    layout: 'fit',
    items: [ panelCategoryPay2]
});

function loadPanelChartCategoryPay2() {
	console.log('afterload storeCategoryPay2');
};