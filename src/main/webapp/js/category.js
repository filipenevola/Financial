//Category
var Category = Ext.data.Record.create([
	{name: 'id'},
    {name: 'name', type: 'string'},
    {name: 'value',type: 'float'},
    {name: 'pay',type: 'boolean'},
    {name: 'notificationList',type: 'string'}
]);

//Proxy http / methods Spring Controller
var proxyCategory = new Ext.data.HttpProxy({
    api: {
        read : 'category/view.action',
        create : 'category/create.action',
        update: 'category/update.action',
        destroy: 'category/delete.action'
    }
});

//Json reader
var readerCategory = new Ext.data.JsonReader({
        totalProperty: 'total',
        successProperty: 'success',
        idProperty: 'id',
        root: 'data',
        messageProperty: 'message'  // <-- New "messageProperty" meta-data
	},
	Category
);

// The new DataWriter component.
var writerCategory = new Ext.data.JsonWriter({
    encode: true,
    writeAllFields: true
});

// Typical Store collecting the Proxy, Reader and Writer together.
var storeCategory = new Ext.data.Store({
    id: 'user',
    proxy: proxyCategory,
    reader: readerCategory,
    writer: writerCategory,  // <-- plug a DataWriter into the store just as you would a Reader
    autoSave: false,
    listeners: {
		beforeload: function(){
			console.log('beforeload storeCategory');
		},
		load: function(){
			console.log('load storeCategory');
		},
		beforesave: function(){
			console.log('beforesave storeCategory');
		},
		save: function(){
			console.log('save storeCategory');
            categoriesForComboMove.load();
		}
	}
});

//Editor
var editorCategory = new Ext.ux.grid.RowEditor({
    saveText: 'Update'
});

//Columns
var colModelCategory = new Ext.grid.ColumnModel([
    {header: "NAME", width: 170, sortable: true, dataIndex: 'name',
    	editor: {xtype: 'textfield', allowBlank: false}
    },
    {header: "VALUE", width: 170, sortable: true, dataIndex: 'value', 
    	renderer: 'usMoney',
    	editor: {xtype: 'textfield', allowBlank: false}
    },
    {header: "PAY", width: 170, sortable: true, dataIndex: 'pay',
    	editor: {xtype: 'checkbox'}
    },
    {header: "EMAILS(;)", width: 170, sortable: true, dataIndex: 'notificationList',
    	editor: {xtype: 'textfield', allowBlank: false}
    }
]);

//Toolbar
var tbarCategory = new Ext.Toolbar([{
        iconCls: 'icon-user-add',
        text: 'Add Category',
        handler: function(){
            var e = new Category({
                name: 'New Category',
                value: '0.0',
                pay: true
            });
            editorCategory.stopEditing();
            storeCategory.insert(0, e);
            gridCategory.getView().refresh();
            gridCategory.getSelectionModel().selectRow(0);
            editorCategory.startEditing(0);
        }
    },
    {
        iconCls: 'icon-user-delete',
        text: 'Remove Category',
        handler: function(){
    	editorCategory.stopEditing();
            var s = gridCategory.getSelectionModel().getSelections();
            for(var i = 0, r; r = s[i]; i++){
                storeCategory.remove(r);
            }
        }
    },
    {
        iconCls: 'icon-user-save',
        text: 'Save All Modifications',
        handler: function() {
            storeCategory.save();
        }	        
    }
]);

// create grid
var gridCategory = new Ext.grid.GridPanel({
    layout: 'fit',
	frame: true,
    height: 300,
    autoWidth: true,
    plugins: [editorCategory, Ext.ux.grid.DataDrop],
    store: storeCategory,
    colModel: colModelCategory,
	tbar: tbarCategory
});

var panelCategory = new Ext.Panel({
	layout: 'fit',
	id: 'panelCategory',
	title: 'Categories',
    autoScroll: true,
    items: [gridCategory]
});

function loadPanelCategory() {

	waitWin.show();
	storeCategory.load({
        callback: function(){
			waitWin.hide();
			console.log('afterload storeCategory');
        }
    });
};
