Ext.require('Ext.chart.*');
Ext.require(['Ext.Window', 'Ext.fx.target.Sprite', 'Ext.layout.container.Fit']);
Ext.require(['Ext.data.*']);

Ext.onReady(function() {

    var fields = [];
    var series1 = [];
    
    fields.push('name');
    
    Ext.Ajax.request({
		url : 'move/radarCategories.action',
		success : function(result) {
			var json = Ext.decode(result.responseText);
			console.log(json);			 
	        
			Ext.each(json.data, function(cat, index) {
				var category = 'cat' + cat.id;
				fields.push(category);
				var serie = new Object();
				serie.type = 'radar';
				serie.xField = 'name';
				serie.yField = category;
				serie.showInLegend = true;
				serie.showMarkers = true;
				serie.markerConfig = {radius: 5,size: 5};
				serie.style = {'stroke-width': 2,fill: 'none'};
				series1.push(serie);
//				series.push(
//						{
//	                type: 'radar',
//	                xField: 'name',
//	                yField: category,
//	                showInLegend: true,
//	                showMarkers: true,
//	                markerConfig: {
//	                    radius: 5,
//	                    size: 5
//	                },
//	                style: {
//	                    'stroke-width': 2,
//	                    fill: 'none'
//	                }
//	            });
			});
			
			console.log(fields);
			
			Ext.Ajax.request({
    			url : 'move/radar.action',
    			success : function(result) {
    				var json2 = Ext.decode(result.responseText);
    				console.log(json2);
    			
			        var data = [];
			        Ext.each(json2.data, function(monthData, index) {
			        	var dataItem = [];
			        	dataItem['name'] = monthData.monthYear;
			        	Ext.each(monthData.list, function(monthItem, index) {
			        		console.log('monthYear: ' + monthData.monthYear + ', category: ' + monthItem.category + ', value: ' + monthItem.value);
			        		dataItem[monthItem.category] = monthItem.value; 
			        	});
			            data.push(dataItem);
			        });       

		    
				    var store1 = Ext.create('Ext.data.JsonStore', {
				        fields: fields
				    });
				    
				    store1.loadData(data);
		    
					 var win = Ext.create('Ext.Window', {
					        width: 800,
					        height: 600,
					        hidden: false,
					        shadow: false,
					        maximizable: true,
					        style: 'overflow: hidden;',
					        title: 'Radar Chart',
					        renderTo: Ext.getBody(),
					        layout: 'fit',
					        tbar: [{
					            text: 'Reload Data',
					            handler: function() {
					                store1.loadData(generateData());
					            }
					        }, {
					            enableToggle: true,
					            pressed: true,
					            text: 'Animate',
					            toggleHandler: function(btn, pressed) {
					                var chart = Ext.getCmp('chartCmp');
					                chart.animate = pressed ? { easing: 'ease', duration: 500 } : false;
					            }
					        }],
					        items: {
					            id: 'chartCmp',
					            xtype: 'chart',
					            style: 'background:#fff',
					            theme: 'Category2',
					            animate: true,
					            store: store1,
					            insetPadding: 20,
					            legend: {
					                position: 'right'
					            },
					            axes: [{
					                type: 'Radial',
					                position: 'radial',
					                label: {
					                    display: true
					                }
					            }],
					            series: [series1]
					        }
					    });
					    
    			}
			});
			
    
    	}
   });   
   
});