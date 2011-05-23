Ext.require('Ext.chart.*');
Ext.require([ 'Ext.Window', 
              'Ext.fx.target.Sprite',
              'Ext.layout.container.Fit' ]);
Ext.require([ 'Ext.data.*' ]);

Ext.onReady(function() {
	storeCat1.load();
	storeCat2.load();
	storeCat3.load();
	var cat1 = 7;
	var cat2 = 16;
	var cat3 = 47;
	loadRadarChart(cat1, cat2, cat3);
});

function startLoadChart() {
	destroyWindow();
	var cat1 = comboCat1.getValue();
	var cat2 = comboCat2.getValue();
	var cat3 = comboCat3.getValue();
	loadRadarChart(cat1, cat2, cat3);
	
}

function destroyWindow() {
	var chartWindow = Ext.getCmp('chartWindow');
	if(chartWindow) {
		chartWindow.destroy();
	}
}

Ext.define('Category', {
    extend: 'Ext.data.Model',
    fields: [
        {name: 'id', type: 'int'}, 'name'
    ],
    idProperty: 'id'
});

var proxy = Ext.create('Ext.data.HttpProxy', {
	type: 'ajax',
    api: {
        read: 'category/view.action'
    },
    reader: {
    	type: 'json',
    	totalProperty : 'total',
    	successProperty : 'success',
    	idProperty : 'id',
    	root : 'data',
    	messageProperty : 'message'
    },
    listeners: {
        exception: function(proxy, response, operation){
            Ext.MessageBox.show({
                title: 'REMOTE EXCEPTION',
                msg: operation.getError(),
                icon: Ext.MessageBox.ERROR,
                buttons: Ext.Msg.OK
            });
        }
    }
});

var storeCat1 = Ext.create('Ext.data.Store', {
    id: 'storeCat1',
    pageSize: 200,
	autoHeight : true,
	autoWidth : true,
    model: 'Category',
    proxy: proxy
    
});

var comboCat1 = Ext.create('Ext.form.ComboBox', {
    fieldLabel: 'Category 1',
    store: storeCat1,
    queryMode: 'local',
    displayField: 'name',
    valueField: 'id'
});

var storeCat2 = Ext.create('Ext.data.Store', {
    id: 'storeCat2',
    pageSize: 200,
	autoHeight : true,
	autoWidth : true,
    model: 'Category',
    proxy: proxy
    
});

var comboCat2 = Ext.create('Ext.form.ComboBox', {
    fieldLabel: 'Category 2',
    store: storeCat2,
    queryMode: 'local',
    displayField: 'name',
    valueField: 'id'
});

var storeCat3 = Ext.create('Ext.data.Store', {
    id: 'storeCat3',
    pageSize: 200,
	autoHeight : true,
	autoWidth : true,
    model: 'Category',
    proxy: proxy
    
});

var comboCat3 = Ext.create('Ext.form.ComboBox', {
    fieldLabel: 'Category 3',
    store: storeCat3,
    queryMode: 'local',
    displayField: 'name',
    valueField: 'id'
});


function loadRadarChart(cat1, cat2, cat3) {
	Ext.Ajax.request({
		url : 'move/radar.action',
		params : {
			cat1 : cat1,
			cat2 : cat2,
			cat3 : cat3
		},
		success : function(result) {
			var json2 = Ext.decode(result.responseText);
			
			var jsonData = json2.data;
			
			var fields = [];
			var titles = [];
			var data = [];
			
			var first = true;
			
			fields.push('name');
			Ext.each(jsonData, function(monthData, index) {
				
				var dataItem = {};
				dataItem["name"] = monthData.monthYear;
				
				Ext.each(monthData.list, function(monthItem, index) {
					console.log("Nome: " + monthItem.name + ", Valor: " + monthItem.value);
					dataItem[monthItem.categoryNumber] = monthItem.value;
					if (first) {
						fields.push(monthItem.categoryNumber);
						titles[monthItem.categoryNumber] = monthItem.category.name;
					}
				});
				
				first = false;
				
				data.push(dataItem);
			});

			var store1 = Ext.create('Ext.data.JsonStore', {
				fields : fields,
				data : data
			});
			destroyWindow();
			Ext.create('Ext.Window', {
				id: 'chartWindow',
				width : 1000,
				height : 600,
				hidden : false,
				shadow : false,
				maximizable : true,
				style : 'overflow: hidden;',
				title : 'Radar Chart',
				renderTo : Ext.getBody(),
				layout : 'fit',
				tbar: [comboCat1,comboCat2,comboCat3,
				       {
							text: 'Load',
							handler: startLoadChart
				       }],				       
				items : {
					id : 'chartCmp',
					xtype : 'chart',
					style : 'background:#fff',
					theme : 'Category2',
					animate : true,
					store : store1,
					insetPadding : 20,
					legend : {
						position : 'right'
					},
					axes : [ {
						type : 'Radial',
						position : 'radial',
						label : {
							display : true
						}
					} ],
					series : [ {
						type : 'radar',
						xField : 'name',
						yField : 'cat1',
						title : titles["cat1"],
						showInLegend : true,
						showMarkers : true,
						markerConfig : {
							radius : 5,
							size : 5
						},
						style : {
							'stroke-width' : 2,
							fill : 'none'
						},
						hidden : true
					}, {
						type : 'radar',
						xField : 'name',
						yField : 'cat2',
						title : titles["cat2"],
						showInLegend : true,
						showMarkers : true,
						markerConfig : {
							radius : 5,
							size : 5
						},
						style : {
							'stroke-width' : 2,
							fill : 'none'
						}
					}, {
						type : 'radar',
						xField : 'name',
						yField : 'cat3',
						title : titles["cat3"],
						showInLegend : true,
						showMarkers : true,
						markerConfig : {
							radius : 5,
							size : 5
						},
						style : {
							'stroke-width' : 2,
							fill : 'none'
						}
					} ]
				}
			});

		}
	});
}