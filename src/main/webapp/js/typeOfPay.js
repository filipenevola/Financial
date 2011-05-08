
//TypeOfPay
var TypeOfPay = Ext.data.Record.create([
	{name: 'id'},
    {name: 'name', type: 'string'}
]);

//Proxy http / methods Spring Controller
var proxyTypeOfPay = new Ext.data.HttpProxy({
    api: {
        read : 'typeOfPay/view.action',
        create : 'typeOfPay/create.action',
        update: 'typeOfPay/update.action',
        destroy: 'typeOfPay/delete.action'
    }
});

//Json reader
var readerTypeOfPay = new Ext.data.JsonReader({
        totalProperty: 'total',
        successProperty: 'success',
        idProperty: 'id',
        root: 'data',
        messageProperty: 'message'  // <-- New "messageProperty" meta-data
	},
	TypeOfPay
);

// The new DataWriter component.
var writerTypeOfPay = new Ext.data.JsonWriter({
    encode: true,
    writeAllFields: true
});

// Typical Store collecting the Proxy, Reader and Writer together.
var storeTypeOfPay = new Ext.data.Store({
    id: 'user',
    proxy: proxyTypeOfPay,
    reader: readerTypeOfPay,
    writer: writerTypeOfPay,  // <-- plug a DataWriter into the store just as you would a Reader
    autoSave: false,
    listeners: {
		beforeload: function(){
			console.log('beforeload storeTypeOfPay');
		},
		load: function(){
			console.log('load storeTypeOfPay');
		},
		beforesave: function(){
			console.log('beforesave storeTypeOfPay');
		},
		save: function(){
			console.log('save storeTypeOfPay');
    		typesOfPayForComboMove.load();
		}
	}
});    

//Editor
var editorTypeOfPay = new Ext.ux.grid.RowEditor({
    saveText: 'Update'
});

//Columns
var colModelTypeOfPay = new Ext.grid.ColumnModel([
    {header: "NAME", width: 170, sortable: true, dataIndex: 'name',
    	editor: {xtype: 'textfield', allowBlank: false}
    }
]);

//Toolbar
var tbarTypeOfPay = new Ext.Toolbar([{
        iconCls: 'icon-user-add',
        text: 'Add Type of Pay',
        handler: function(){
            var e = new TypeOfPay({
                name: 'New TypeOfPay'
            });
            editorTypeOfPay.stopEditing();
            storeTypeOfPay.insert(0, e);
            gridTypeOfPay.getView().refresh();
            gridTypeOfPay.getSelectionModel().selectRow(0);
            editorTypeOfPay.startEditing(0);
        }
    },
    {
        iconCls: 'icon-user-delete',
        text: 'Remove Type of Pay',
        handler: function(){
            editorTypeOfPay.stopEditing();
            var s = gridTypeOfPay.getSelectionModel().getSelections();
            for(var i = 0, r; r = s[i]; i++){
                storeTypeOfPay.remove(r);
            }
        }
    },
    {
        iconCls: 'icon-user-save',
        text: 'Save All Modifications',
        handler: function(){    
            storeTypeOfPay.save();
        }
    }
]);

// create grid
var gridTypeOfPay = new Ext.grid.GridPanel({
    layout: 'fit',
	frame: true,
    height: 300,
    autoWidth: true,
    plugins: [editorTypeOfPay, Ext.ux.grid.DataDrop],
    store: storeTypeOfPay,
    colModel: colModelTypeOfPay,
	tbar: tbarTypeOfPay
});

var panelTypeOfPay = new Ext.Panel({
	layout: 'fit',
	id: 'panelTypeOfPay',
    title: 'Types of Pay',
    autoScroll: true,
    items: [gridTypeOfPay]
});

function loadPanelTypeOfPay() {
	waitWin.show();
	storeTypeOfPay.load({
        callback: function(){
			waitWin.hide();
			console.log('afterload storeTypeOfPay');
        }
    });
};