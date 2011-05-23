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
			var categoryIds = [];
			var data = [];
			
			var first = true;
			
			fields.push('name');
			Ext.each(jsonData, function(monthData, index) {
				
				var dataItem = {};
				dataItem["name"] = monthData.monthYear;
				
				Ext.each(monthData.list, function(monthItem, index) {
					console.log("Nome: " + monthItem.name + ", Valor: " + monthItem.value);
					var catNumber = monthItem.categoryNumber;
					dataItem[catNumber] = monthItem.value;
					if (first) {
						fields.push(catNumber);
						titles[catNumber] = monthItem.category.name;
						categoryIds[catNumber] = monthItem.category.id;
					}
				});
				
				first = false;
				
				data.push(dataItem);
			});

			var store1 = Ext.create('Ext.data.JsonStore', {
				fields : fields,
				data : data
			});
			

			var gridStore = Ext.create('Ext.data.JsonStore', {
				fields : [ 'name', 'data' ]
			});
			
			var contadorTest = 0;
			
			var chartTip = Ext.create('Ext.tip.ToolTip', {
                trackMouse: true,
                width: 580,
                autoHeight: true,
                layout: 'fit',
                renderer: function(klass, item) {
                	var seriesItem = item.series;
                	var seriesItemId = seriesItem.id;
                	var storeItem = item.storeItem;
                	var dataItem = storeItem.data;
                	var valueCat = dataItem[seriesItemId];
                	var valueCatFmt = Ext.util.Format.number(valueCat, '0,0.00');
                	var monthCat = dataItem["name"];
                    this.setTitle("Information for " + titles[seriesItemId] + " (" + monthCat + ")");
                    this.remove('panelTip');
                    var x = this;
                    Ext.Ajax.request({
                		url : 'move/movesCategoryMonthYear.action',
                		params : {
                			monthYear : monthCat,
                			categoryId : categoryIds[seriesItemId]
                		},
                		success : function(result) {
                			var json3 = Ext.decode(result.responseText);
                			
                			var jsonData2 = json3.data;
		                    gridStore.loadData(jsonData2);
		                    x.add(Ext.create('Ext.grid.Panel', {
		                    	id: 'panelTip',
		                    	title: "Total: " + valueCatFmt,
		        				store : gridStore,
		                        autoHeight: true,
		        				columns : [ {
		        					text : 'name',
		        					dataIndex : 'name'
		        				}, {
		        					text : 'data',
		        					dataIndex : 'data'
		        				} ]
		        			}));
                		}
                    });
                }
            });
			
			destroyWindow();
			Ext.create('Ext.Window', {
				id: 'chartWindow',
		        width: 800,
		        height: 600,
		        hidden: false,
		        maximizable: true,
		        title: 'Line Chart',
		        renderTo: Ext.getBody(),
		        layout: 'fit',
				tbar: [comboCat1,comboCat2,comboCat3,
			       {
						text: 'Load',
						handler: startLoadChart
		       }],
		        items: {
		            xtype: 'chart',
		            style: 'background:#fff',
		            animate: true,
		            store: store1,
		            shadow: true,
		            theme: 'Category1',
		            legend: {
		                position: 'right'
		            },
		            axes: [{
		                type: 'Numeric',
		                minimum: 0,
		                position: 'left',
		                fields: ['cat1', 'cat2', 'cat3'],
		                title: 'Values',
		                minorTickSteps: 1,
		                grid: {
		                    odd: {
		                        opacity: 1,
		                        fill: '#ddd',
		                        stroke: '#bbb',
		                        'stroke-width': 0.5
		                    }
		                }
		            }, {
		                type: 'Category',
		                position: 'bottom',
		                fields: ['name'],
		                title: 'Month of the Year'
		            }],
		            series: [{
		            	id: 'cat1',
		                type: 'line',
		                highlight: {
		                    size: 7,
		                    radius: 7
		                },
		                axis: 'left',
		                xField: 'name',
						yField : 'cat1',
						title : titles["cat1"],
		                markerConfig: {
		                    type: 'cross',
		                    size: 4,
		                    radius: 4,
		                    'stroke-width': 0
		                },
		                tips: chartTip
		            }, {
		            	id: 'cat2',
		                type: 'line',
		                highlight: {
		                    size: 7,
		                    radius: 7
		                },
		                axis: 'left',
		                smooth: true,
		                xField: 'name',
						yField : 'cat2',
						title : titles["cat2"],
		                markerConfig: {
		                    type: 'circle',
		                    size: 4,
		                    radius: 4,
		                    'stroke-width': 0
		                },
		                tips: chartTip
		            }, {
		            	id: 'cat3',
		                type: 'line',
		                highlight: {
		                    size: 7,
		                    radius: 7
		                },
		                axis: 'left',
		                smooth: true,
		                fill: false,
		                xField: 'name',
						yField : 'cat3',
						title : titles["cat3"],
		                markerConfig: {
		                    type: 'circle',
		                    size: 4,
		                    radius: 4,
		                    'stroke-width': 0
		                },
		                tips: chartTip
		            }]
		        }
		    });

		}
	});
}