//CollectiveBuy
var CollectiveBuy = Ext.data.Record.create([
	{name: 'id'},
    {name: 'name', type: 'string'},
    {name: 'place', type: 'string'},
    {name: 'dateOfBuy', type: 'string'},
    {name: 'startDate', type: 'string'},
    {name: 'endDate', type: 'string'},
    {name: 'value', type: 'float'},
    {name: 'originalValue', type: 'float'},
    {name: 'canUseDays', type: 'string'},
    {name: 'used', type: 'bool'},
    {name: 'printed', type: 'bool'}
]);

//Proxy http / methods Spring Controller
var proxyCollectiveBuy = new Ext.data.HttpProxy({
    api: {
        read : 'collectiveBuy/view.action',
        create : 'collectiveBuy/create.action',
        update: 'collectiveBuy/update.action',
        destroy: 'collectiveBuy/delete.action'
    }
});

//Json reader
var readerCollectiveBuy = new Ext.data.JsonReader({
        totalProperty: 'total',
        successProperty: 'success',
        idProperty: 'id',
        root: 'data',
        messageProperty: 'message'  // <-- New "messageProperty" meta-data
    }, 
    CollectiveBuy
);

// The new DataWriter component.
var writerCollectiveBuy = new Ext.data.JsonWriter({
    encode: true,
    writeAllFields: true
});

// Typical Store collecting the Proxy, Reader and Writer together.
var storeCollectiveBuy = new Ext.data.Store({
    id: 'user',
    proxy: proxyCollectiveBuy,
    reader: readerCollectiveBuy,
    writer: writerCollectiveBuy,  // <-- plug a DataWriter into the store just as you would a Reader
    autoSave: false,
    remoteSort: true,
    listeners: {
		beforeload: function(){
			console.log('beforeload storeCollectiveBuy');
		},
		load: function(){
			console.log('load storeCollectiveBuy');
		},
		beforesave: function(){
			console.log('beforesave storeCollectiveBuy');
		},
		save: function(){
			console.log('save storeCollectiveBuy');
		}
	}
});


//Editor
var editorCollectiveBuy = new Ext.ux.grid.RowEditor({
    saveText: 'Update'
});

//Renderer for value
var rendererValueForCollectiveBuy = function(value, metaData, record, rowIndex, colIndex, store) {
	var money = Ext.util.Format.number(value, '0,0.00');	
	return ' $ ' + money;
};

//Renderer for Used
var rendererUsedForCollectiveBuy = function(value, metaData, record, rowIndex, colIndex, store) {
	var ret = '';
	if(record.get('value') != 0.0) {
    	ret = value == true ? 
    			'YES' 
    			: 'NO';	    	
	}
	return ret;
};

//Renderer for Printed
var rendererPrintedForCollectiveBuy = function(value, metaData, record, rowIndex, colIndex, store) {
	var ret = '';
	if(record.get('value') != 0.0) {
    	ret = value == true ? 
    			'YES' 
    			: 'NO';	    	
	}
	return ret;
};

//Columns
var colModelCollectiveBuy = new Ext.grid.ColumnModel([
    {header: "NAME", width: 200, sortable: true, dataIndex: 'name',
    	editor: {xtype: 'textfield', allowBlank: false}
    },
    {header: "VALUE", width: 100, sortable: true, dataIndex: 'value', 
    	renderer: rendererValueForCollectiveBuy,
    	editor: {xtype: 'textfield', allowBlank: false}
    },
    {header: "ORIGINAL VALUE", width: 100, sortable: true, dataIndex: 'originalValue', 
    	renderer: rendererValueForCollectiveBuy,
    	editor: {xtype: 'textfield', allowBlank: false}
    },
    {header: "DATE OF BUY", width: 100, sortable: true, dataIndex: 'dateOfBuy',
         renderer: Ext.util.Format.dateRenderer('Y/M/d'),
         editor: new Ext.form.DateField ({allowBlank: true, format: 'Y/M/d'})
    },  
    {header: "START DATE", width: 100, sortable: true, dataIndex: 'startDate',
         renderer: Ext.util.Format.dateRenderer('Y/M/d'),
         editor: new Ext.form.DateField ({allowBlank: false, format: 'Y/M/d'})
    },
    {header: "END DATE", width: 100, sortable: true, dataIndex: 'endDate',
         renderer: Ext.util.Format.dateRenderer('Y/M/d'),
         editor: new Ext.form.DateField ({allowBlank: false, format: 'Y/M/d'})
    },  
    {header: "PLACE", width: 150, sortable: true, dataIndex: 'place',
    	editor: {xtype: 'textfield'}
    }, 
    {header: "WHEN CAN USE ?", width: 150, sortable: true, dataIndex: 'canUseDays',
    	editor: {xtype: 'textfield'}
    }, 
    {header: "USED ?", width: 50, sortable: true, dataIndex: 'used', 
    	editable: true, align: 'center',
    	renderer: rendererUsedForCollectiveBuy,
    	editor: {xtype: 'checkbox'}
    },
    {header: "PRINTED ?", width: 50, sortable: true, dataIndex: 'printed', 
    	editable: true, align: 'center',
    	renderer: rendererPrintedForCollectiveBuy,
    	editor: {xtype: 'checkbox'}
    }
]);

function n(v){
	return Ext.util.Format.number(v, '0,0.00');
}

// Toolbar
var tbarCollectiveBuy = new Ext.Toolbar([{
    iconCls: 'icon-user-add',
    text: 'Add CollectiveBuy',
    handler: function(){
			var e = new CollectiveBuy({
				name : 'New collectiveBuy',
				value : '0.0',
				originalValue : '0.0',
				used : false,
				printed : false
			});
			
			editorCollectiveBuy.stopEditing();
			storeCollectiveBuy.insert(0, e);
			gridCollectiveBuy.getView().refresh();
			gridCollectiveBuy.getSelectionModel().selectRow(0);
			editorCollectiveBuy.startEditing(0);
		}
   	},
   	{
        iconCls: 'icon-user-delete',
        text: 'Remove CollectiveBuy',
        handler: function(){
            editorCollectiveBuy.stopEditing();
            var s = gridCollectiveBuy.getSelectionModel().getSelections();
            for(var i = 0, r; r = s[i]; i++){
                storeCollectiveBuy.remove(r);
            }
        }
    },
    {
        iconCls: 'icon-user-save',
        text: 'Save All Modifications',
        handler: function(){
            storeCollectiveBuy.save();
        }
    },    
   	{
        iconCls: 'icon-user-add',
        text: 'Create new using selected',
        handler: function(){
            editorCollectiveBuy.stopEditing();
            var s = gridCollectiveBuy.getSelectionModel().getSelections();
            if(s.length > 0) {
            	var cb = s[0];
            	var e = new CollectiveBuy({
					name: cb.get('name'),
					place: cb.get('place'),
					dateOfBuy: cb.get('dateOfBuy'),
					startDate: cb.get('startDate'),
					endDate: cb.get('endDate'),
					value: cb.get('value'),
					originalValue: cb.get('originalValue'),
					canUseDays: cb.get('canUseDays'),
					used: cb.get('used'),
					printed: cb.get('printed')			
				});
				editorCollectiveBuy.stopEditing();
				storeCollectiveBuy.insert(0, e);
				gridCollectiveBuy.getView().refresh();
				gridCollectiveBuy.getSelectionModel().selectRow(0);
				editorCollectiveBuy.startEditing(0);
			}            
        }
    },    
   	{
        iconCls: 'icon-user-add',
        text: 'Sum values selecteds',
        handler: function(){
            editorCollectiveBuy.stopEditing();
            var sum = 0;
            var s = gridCollectiveBuy.getSelectionModel().getSelections();
            for(var i = 0, r; r = s[i]; i++){
                sum += r.get('value');
            }
            Ext.Msg.alert('Sum of values is R$ ' + Ext.util.Format.number(sum, '0,0.00'));
        }
    },    
   	{
        iconCls: 'icon-user-add',
        text: 'Sum save selecteds',
        handler: function(){
            editorCollectiveBuy.stopEditing();
            var sum = 0;
            var sumOriginal = 0;
            var s = gridCollectiveBuy.getSelectionModel().getSelections();
            for(var i = 0, r; r = s[i]; i++){
                sum += r.get('value');
                sumOriginal += r.get('originalValue');
            }
            Ext.Msg.alert('Sum of values is R$ ' + Ext.util.Format.number((sumOriginal - sum), '0,0.00'));
        }
    },    
   	{
        iconCls: 'icon-user-add',
        text: 'Mark as used (selecteds)',
        handler: function(){
            editorCollectiveBuy.stopEditing();
            var s = gridCollectiveBuy.getSelectionModel().getSelections();
            for(var i = 0, r; r = s[i]; i++){
                r.set('used', true);
            }
        }
    }  ,    
   	{
        iconCls: 'icon-user-add',
        text: 'Mark as printed (selecteds)',
        handler: function(){
            editorCollectiveBuy.stopEditing();
            var s = gridCollectiveBuy.getSelectionModel().getSelections();
            for(var i = 0, r; r = s[i]; i++){
                r.set('printed', true);
            }
        }
    }   
]);

//paging bar on the bottom
paging = new Ext.PagingToolbar({
    pageSize: 25,
    store: storeCollectiveBuy,
    displayInfo: true,
    displayMsg: 'Displaying collectiveBuys {0} - {1} of {2}',
    emptyMsg: "No collectiveBuys to display",
    items:[
        '-' 
        /*,{
        pressed: true,
        enableToggle:true,
        text: 'Show Preview',
        cls: 'x-btn-text-icon details',
        toggleHandler: function(btn, pressed){
            var view = grid.getView();
            view.showPreview = pressed;
            view.refresh();
        }
    }*/]
});

// create grid
var gridCollectiveBuy = new Ext.grid.GridPanel({
    layout: 'fit',
	frame: true,
    autoWidth: true,
    height: 300,
    plugins: [editorCollectiveBuy, Ext.ux.grid.DataDrop],
    store: storeCollectiveBuy,
    colModel: colModelCollectiveBuy,
	tbar: tbarCollectiveBuy,
	bbar: paging
});


var panelCollectiveBuy = new Ext.Panel({
	layout: 'fit',
	id: 'panelCollectiveBuy',
	title: 'CollectiveBuys',
    autoScroll: true,
    items: [gridCollectiveBuy]
});

function loadStoreCollectiveBuy() {
	waitWin.show();
	storeCollectiveBuy.load({
		params:{start:0, limit:25},
		callback: function() {
			
			waitWin.hide();
			console.log('afterload storeCollectiveBuy');
		},
		failure: function() {
			Ext.Msg.alert('ERROR', 'An error ocurr');
		}
	});
}

function loadPanelCollectiveBuy() {
	
	waitWin.show();
	loadStoreCollectiveBuy();
};
