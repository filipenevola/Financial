
//Investiment
var Investiment = Ext.data.Record.create([
	{name: 'id'},
    {name: 'dateOfInvestiment', type: 'string', dateFormat: 'Y/M/d'},
    {name: 'value', type: 'float'}
]);

//Proxy http / methods Spring Controller
var proxyInvestiment = new Ext.data.HttpProxy({
    api: {
        read : 'investiment/view.action',
        create : 'investiment/create.action',
        update: 'investiment/update.action',
        destroy: 'investiment/delete.action'
    }
});

//Json reader
var readerInvestiment = new Ext.data.JsonReader({
        totalProperty: 'total',
        successProperty: 'success',
        idProperty: 'id',
        root: 'data',
        messageProperty: 'message'  // <-- New "messageProperty" meta-data
    }, 
    Investiment
);

// The new DataWriter component.
var writerInvestiment = new Ext.data.JsonWriter({
    encode: true,
    writeAllFields: true
});

// Typical Store collecting the Proxy, Reader and Writer together.
var storeInvestiment = new Ext.data.Store({
    id: 'user',
    proxy: proxyInvestiment,
    reader: readerInvestiment,
    writer: writerInvestiment,  // <-- plug a DataWriter into the store just as you would a Reader
    autoSave: false,
    listeners: {
		beforeload: function(){
			console.log('beforeload storeInvestiment');
		},
		load: function(){
			console.log('load storeInvestiment');
		},
		beforesave: function(){
			console.log('beforesave storeInvestiment');
		},
		save: function(){
			console.log('save storeInvestiment');
		}
	}
});

//Editor
var editorInvestiment = new Ext.ux.grid.RowEditor({
    saveText: 'Update'
});

//Renderer for value
var rendererValueForInvestiment = function(value, metaData, record, rowIndex, colIndex, store) {
	var money = Ext.util.Format.number(value, '0,0.00');
	
	if(money != 0.0) {
    	var color = 'green';	    	

    	var signal = '+';
    	
    	return '<font color="' + color + 
    			'"> ' + signal + ' $ ' + money + '</font>';
	}
	return money;
};

//Columns
var colModelInvestiment = new Ext.grid.ColumnModel([
	
    {header: "VALUE", width: 100, sortable: true, dataIndex: 'value', 
    	renderer: rendererValueForInvestiment,
    	editor: {xtype: 'textfield', allowBlank: false}
    },        
    {header: "DATE OF INVESTIMENT", width: 100, sortable: true, dataIndex: 'dateOfInvestiment',
         renderer: Ext.util.Format.dateRenderer('Y/M/d'),
         editor: new Ext.form.DateField ({allowBlank: false, format: 'Y/M/d'})
    }
]);

//Toolbar
var tbarInvestiment = new Ext.Toolbar([{
    iconCls: 'icon-user-add',
    text: 'Add Investiment',
    handler: function(){
            var e = new Investiment({
                value: '0.0',
                dateOfInvestiment: new Date()
            });
            editorInvestiment.stopEditing();
            storeInvestiment.insert(0, e);
            gridInvestiment.getView().refresh();
            gridInvestiment.getSelectionModel().selectRow(0);
            editorInvestiment.startEditing(0);
        }
   	},
   	{
        iconCls: 'icon-user-delete',
        text: 'Remove Investiment',
        handler: function(){
            editorInvestiment.stopEditing();
            var s = gridInvestiment.getSelectionModel().getSelections();
            for(var i = 0, r; r = s[i]; i++){
                storeInvestiment.remove(r);
            }
        }
    },
    {
        iconCls: 'icon-user-save',
        text: 'Save All Modifications',
        handler: function(){
            storeInvestiment.save();
        }
    },    
   	{
        iconCls: 'icon-user-add',
        text: 'Sum values selecteds',
        handler: function(){
            editorInvestiment.stopEditing();
            var sum = 0;
            var s = gridInvestiment.getSelectionModel().getSelections();
            for(var i = 0, r; r = s[i]; i++){
                sum += r.get('value');
            }
            Ext.Msg.alert('Sum of values is R$ ' + Ext.util.Format.number(sum, '0,0.00'));
        }
    }
]);

// create grid
var gridInvestiment = new Ext.grid.GridPanel({
    layout: 'fit',
	frame: true,
    autoHeight: true,
    autoWidth: true,
    plugins: [editorInvestiment, Ext.ux.grid.DataDrop],
    store: storeInvestiment,
    colModel: colModelInvestiment,
	tbar: tbarInvestiment
});


var panelInvestiment = new Ext.Panel({
	layout: 'fit',
	id: 'panelInvestiment',
	title: 'Investiments',
    autoScroll: true,
    items: [gridInvestiment]
});

function loadPanelInvestiment() {
	waitWin.show();
	//Load all data from database
	storeInvestiment.load({
		callback: function() {
			waitWin.hide();
			console.log('afterload storeInvestiment');
		},
		failure: function() {
			Ext.Msg.alert('ERROR', 'An error ocurr');
		}
	});	
};
