
    var datesType = [[1, 'Date of Move'], [2, 'Date of Pay']];

    var comboDateType = new Ext.form.ComboBox({
    	width: 100,
        typeAhead: true,
        triggerAction: 'all',
        lazyRender:true,
        mode: 'local',
        store: new Ext.data.ArrayStore({
            id: 0,
            fields: [
                'myId',
                'displayText'
            ],
            data: datesType
        }),
        valueField: 'myId',
        displayField: 'displayText'
    });
    
    comboDateType.on('select', function(combo, record) {
    	loadPanelMoveInfo(monthToCalcInfo.getValue(), combo.getValue());
    });

    function setInitialValueInfo(combo, value) {
    	combo.setValue(value);
    }
  //Typical Store collecting the Proxy, Reader and Writer together.
  var storeMoveInfo = new Ext.data.GroupingStore({
      id: 'storeMove',
      root: 'data',
  	proxy: new Ext.data.HttpProxy({
  		url: 'move/movesByMonth.action'
  	}),
      reader: readerMove,
      listeners: {
  		beforeload: function(){
  			console.log('beforeload storeMoveInfo');
  		},
  		load: function(){
  			console.log('load storeMoveInfo');
  		}
  	},
  	sortInfo: {field: 'dateOfMove', direction: 'ASC'},
  	groupField: 'categoryId'
  });
  
  
//   define a custom summary function
  Ext.ux.grid.GroupSummary.Calculations['totalValue'] = function(v, record, field){
      return v + (record.data.value);
  };
  var monthToCalcInfo = new Ext.form.TextField({  
    fieldLabel:'Month/Year',  
    id: 'monthToCalcInfo'  
});

function balanceMonth(month) {
	Ext.Ajax.request( {
		url : 'calculation/balanceMonth.action',
		params: {month: month},
		success : function(result) {
		 	var values = Ext.util.JSON.decode(result.responseText);
		 	var colorRecPay = values.recPay < 0.0 ? "red" : "green";
		 	var colorRecMove = values.recMove < 0.0 ? "red" : "green";
			var text = '<p style="line-height: 24pt; font-size: 16pt;">' + 
					'<b>Recevied</b>: R$ <font style="color: green;">' + n(values.rec) + '</font>' +
					'<br/><b>Paied:</b> R$ <font style="color: red;">' + n(values.pay) + '</font>' +
					'<br/><b>Moved</b>: R$ <font style="color: red;">' + n(values.move) + '</font>' +
					'<br/><b>Balance Paied</b>: R$ <font style="color: ' + colorRecPay + ';">' + n(values.recPay) + '</font>' +
					'<br/><b>Balance Moved</b>: R$ <font style="color: ' + colorRecMove + ';">' + n(values.recMove) + '</font>' +
					'</p>';
			var wind = new Ext.Window({
		        title: 'Balance of ' + monthToCalcInfo.getValue(),
		        autoWidth: true,
		        autoHeight: true,
		        html: text
			});
			wind.show();
		},
		failure : function() {
			Ext.Msg.alert('ERROR', 'An error ocurr');
		}
	});

}
function monthCalc(month, pay) {
	Ext.Ajax.request( {
		url : 'calculation/month.action',
		params: {month: month, pay: pay},
		success : function(result) {
		 	var values = Ext.util.JSON.decode(result.responseText);
			var text = values.content;
			var wind = new Ext.Window({
		        title: 'Categories of ' + monthToCalcInfo.getValue(),
		        autoWidth: true,
		        autoHeight: true,
		        html: text
			});
			wind.show();
		},
		failure : function() {
			Ext.Msg.alert('ERROR', 'An error ocurr');
		}
	});
}

	// utilize custom extension for Group Summary
    var summary = new Ext.ux.grid.GroupSummary();

    var gridMoveInfo = new Ext.grid.GridPanel({
        ds: storeMoveInfo,
        columns: [
            {header: "DATE OF MOVE", width: 100, sortable: true, dataIndex: 'dateOfMove',
            	renderer: Ext.util.Format.dateRenderer('Y/M/d')
			},
		    {header: "NAME", width: 200, sortable: true, dataIndex: 'name',
                summaryType: 'count'
		    },
		    {header: "VALUE", width: 100, sortable: true, dataIndex: 'value', 
                summaryType: 'totalValue',
                summaryRenderer: Ext.util.Format.usMoney,
		    	renderer: rendererValueForMove
		    },
		    {header: "CATEGORY", width: 120, sortable: true, dataIndex: 'categoryId',
		    	renderer: rendererCategoryForMove
		    },        
		    {header: "DATE OF PAY", width: 100, sortable: true, dataIndex: 'dateOfPay',
		         renderer: Ext.util.Format.dateRenderer('Y/M/d')
		    },
		    {header: "TYPE OF PAY", width: 120, sortable: true, dataIndex: 'typeOfPayId',
		    	renderer: rendererTypesOfPayForMove
		    },
		    {header: "PLACE", width: 150, sortable: true, dataIndex: 'place'
		    },
		    {header: "PAY ?", width: 50, sortable: true, dataIndex: 'categoryId', 
		    	editable: false, align: 'center',
		    	renderer: rendererPayForMove
		    }
        ],

        view: new Ext.grid.GroupingView({
            forceFit: true,
            showGroupName: false,
            enableNoGroups: false,
			enableGroupingMenu: false,
            hideGroupedColumn: true,
            startCollapsed: true
        }),

        plugins: summary,

        tbar : [{text: 'Date: '},comboDateType,
                {text: 'Month/Year: '},monthToCalcInfo,
                
    {
        iconCls: 'icon-user-add',
        text: 'Balance of month',
        handler: function(){
    		balanceMonth(monthToCalcInfo.getValue());
        }
    },
    {
        iconCls: 'icon-user-add',
        text: 'Received of month',
        handler: function(){
    		monthCalc(monthToCalcInfo.getValue(), false);
        }
    },
    {
        iconCls: 'icon-user-add',
        text: 'Paid of month',
        handler: function(){
    		monthCalc(monthToCalcInfo.getValue(), true);
        }
        
    },{
        iconCls: 'icon-user-add',
        text: 'Sum selecteds',
        handler: function(){
            var sum = 0;
            var s = gridMoveInfo.getSelectionModel().getSelections();
            for(var i = 0, r; r = s[i]; i++){
                sum += r.get('value');
            }
            Ext.Msg.alert('Sum of values is R$ ' + Ext.util.Format.number(sum, '0,0.00'));
        }
    },    
   	{
        iconCls: 'icon-user-add',
        text: 'Avg selecteds',
        handler: function(){
            var sum = 0;
            var count = 0;
            var s = gridMoveInfo.getSelectionModel().getSelections();
            for(var i = 0, r; r = s[i]; i++){
                sum += r.get('value');
                count++;
            }
            Ext.Msg.alert('Average of values is R$ ' + Ext.util.Format.number((count != 0 ? sum/count : 0), '0,0.00'));
        }
    }],

        frame: true,
        width: 800,
        height: 450,
//        clicksToEdit: 1,
        collapsible: true,
        animCollapse: false,
        trackMouseOver: false,
        //enableColumnMove: false,
        title: 'Sponsored Projects',
        iconCls: 'icon-grid'
    });
    
    var panelMoveInfo = new Ext.Panel({
    	layout: 'fit',
    	id: 'panelMoveInfo',
    	title: 'Moves info',
        autoScroll: true,
        items: [gridMoveInfo]
    });
    
    function loadPanelMoveInfo(month, dateType) {
    	
	$('#monthToCalcInfo').bind('keyup', function(e) {
		if (e.keyCode == 13) {
			loadPanelMoveInfo(monthToCalcInfo.getValue(), comboDateType.getValue());
		}
	});
    	setInitialValueInfo(comboDateType, dateType);
    	monthToCalcInfo.setValue(month);
		waitWin.show();
		Ext.Ajax.request( {
			url : 'move/setMonth.action',
			params: {month: month, dateType: dateType},
			success : function(result) {
				storeMoveInfo.load({
		    		callback: function() {
		    			waitWin.hide();
		    			console.log('afterload storeMove');
		    		},
		    		failure: function() {
		    			Ext.Msg.alert('ERROR', 'An error ocurr');
		    		}
		    	});		
			},
			failure : function() {
				Ext.Msg.alert('ERROR', 'An error ocurr');
			}
		});
    }
