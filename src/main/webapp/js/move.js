
//List of categories for combobox
var categoriesForComboMove = new Ext.data.Store({
	proxy: new Ext.data.HttpProxy({
		url: 'category/view.action'
	}),
	reader: new Ext.data.JsonReader({
			root:'data'
		},
		[{name: 'id'},
		 {name: 'name'},
		 {name: 'pay', type: 'boolean'}
		]
	),
    listeners: {
		beforeload: function(){
			console.log('beforeload categoriesForComboMove');
		}
	}
});

//List of types of pay for combobox
var typesOfPayForComboMove = new Ext.data.Store({
	proxy: new Ext.data.HttpProxy({
		url: 'typeOfPay/view.action'
	}),
	reader: new Ext.data.JsonReader({
			root:'data'
		},
		[{name: 'id'},
		 {name: 'name'}
		]
	),
    listeners: {
		beforeload: function(){
			console.log('beforeload typesOfPayForComboMove');
		}
	}
});

//Move
var Move = Ext.data.Record.create([
	{name: 'id'},
    {name: 'name', type: 'string'},
    {name: 'place', type: 'string'},
    {name: 'typeOfPayId', type: 'int'},
    {name: 'dateOfMove', type: 'string', dateFormat: 'Y/M/d'},
    {name: 'dateOfPay', type: 'string', dateFormat: 'Y/M/d'},
    {name: 'value', type: 'float'},
    {name: 'categoryId', type: 'int'},
    {name: 'sendNotification', type: 'bool'}
]);

//Proxy http / methods Spring Controller
var proxyMove = new Ext.data.HttpProxy({
    api: {
        read : 'move/view.action',
        create : 'move/create.action',
        update: 'move/update.action',
        destroy: 'move/delete.action'
    }
});

//Json reader
var readerMove = new Ext.data.JsonReader({
        totalProperty: 'total',
        successProperty: 'success',
        idProperty: 'id',
        root: 'data',
        messageProperty: 'message'  // <-- New "messageProperty" meta-data
    }, 
    Move
);

// The new DataWriter component.
var writerMove = new Ext.data.JsonWriter({
    encode: true,
    writeAllFields: true
});

// Typical Store collecting the Proxy, Reader and Writer together.
var storeMove = new Ext.data.Store({
    id: 'user',
    proxy: proxyMove,
    reader: readerMove,
    writer: writerMove,  // <-- plug a DataWriter into the store just as you would a Reader
    autoSave: false,
    remoteSort: true,
    listeners: {
		beforeload: function(){
			console.log('beforeload storeMove');
		},
		load: function(){
			console.log('load storeMove');
		},
		beforesave: function(){
			console.log('beforesave storeMove');
		},
		save: function(){
			console.log('save storeMove');
		}
	}
});

//Editor
var editorMove = new Ext.ux.grid.RowEditor({
    saveText: 'Update'
});

//Combo of categories
var comboCategories = new Ext.form.ComboBox({
	valueField: 'id', 
	mode: 'local',
	typeAhead: true,
	store: categoriesForComboMove,
	displayField: 'name',
	anchor: '100%',
	lazyRender: true,
	forceSelection: true, 
	triggerAction: 'all', 
	allowBlank: false,
    emptyText: 'select ...',
	selectOnFocus: true
});

//Combo of types of pay
var comboTypesOfPay = new Ext.form.ComboBox({
	valueField: 'id', 
	mode: 'local',
	typeAhead: true,
	store: typesOfPayForComboMove,
	displayField: 'name',
	anchor: '100%',
	lazyRender: true,
	forceSelection: true, 
	triggerAction: 'all', 
	allowBlank: false,
    emptyText: 'select ...',
	selectOnFocus: true
});

//Renderer of category
var rendererCategoryForMove = function(val) {
	var ret = '';
	if (val) {
		ret = categoriesForComboMove.getById(val).get('name');
	} 
	return ret;
};

//Renderer of types of pay
var rendererTypesOfPayForMove = function(val) {
	var ret = '';
	if (val) {
    	ret = typesOfPayForComboMove.getById(val).get('name');
	}
	return ret;
};

//Renderer for value
var rendererValueForMove = function(value, metaData, record, rowIndex, colIndex, store) {
	var money = Ext.util.Format.number(value, '0,0.00');
	
	if(money != 0.0) {
    	var color = categoriesForComboMove.getById(record.get('categoryId')).get('pay') == true ? 
    			'red' 
    			: 'green';	    	

    	var signal = color == 'red' ? 
    			'-' 
    			: '+';
    	
    	return '<font color="' + color + 
    			'"> ' + signal + ' $ ' + money + '</font>';
	}
	return money;
};

//Renderer for pay
var rendererPayForMove = function(value, metaData, record, rowIndex, colIndex, store) {
	var ret = '';
	if(record.get('value') != 0.0) {
    	ret = categoriesForComboMove.getById(value).get('pay') == true ? 
    			'YES' 
    			: 'NO';	    	
	}
	return ret;
};

//Columns
var colModelMove = new Ext.grid.ColumnModel([
	{header: "DATE OF MOVE", width: 100, sortable: true, dataIndex: 'dateOfMove',
		renderer: Ext.util.Format.dateRenderer('Y/M/d'),
	    editor: new Ext.form.DateField ({allowBlank: false, format: 'Y/M/d'})
	},
    {header: "NAME", width: 200, sortable: true, dataIndex: 'name',
    	editor: {xtype: 'textfield', allowBlank: false}
    },
    {header: "VALUE", width: 100, sortable: true, dataIndex: 'value', 
    	renderer: rendererValueForMove,
    	editor: {xtype: 'textfield', allowBlank: false}
    },
    {header: "CATEGORY", width: 120, sortable: true, dataIndex: 'categoryId',
    	renderer: rendererCategoryForMove,
    	editor: comboCategories
    },        
    {header: "DATE OF PAY", width: 100, sortable: true, dataIndex: 'dateOfPay',
         renderer: Ext.util.Format.dateRenderer('Y/M/d'),
         editor: new Ext.form.DateField ({allowBlank: false, format: 'Y/M/d'})
    },
    {header: "TYPE OF PAY", width: 120, sortable: true, dataIndex: 'typeOfPayId',
    	renderer: rendererTypesOfPayForMove,
    	editor: comboTypesOfPay
    },
    {header: "PLACE", width: 150, sortable: true, dataIndex: 'place',
    	editor: {xtype: 'textfield'}
    },
    {header: "NOTIFY?", width: 150, sortable: true, dataIndex: 'sendNotification',
    	editor: {xtype: 'checkbox'}
    },
    {header: "PAY ?", width: 50, sortable: true, dataIndex: 'categoryId', 
    	editable: false, align: 'center',
    	renderer: rendererPayForMove,
    	editor: {xtype: 'checkbox'}
    }
]);

function n(v){
	return Ext.util.Format.number(v, '0,0.00');
}

function setInitialValue(cmb, value) {
	cmb.setValue(value);
} 
var comboField = new Ext.form.ComboBox({
 	valueField: 'field',
	store: ['name','place','dateOfPay','dateOfMove','category'],
	triggerAction: 'all',
	width: 100
});

function filterResults() {
	var field = comboField.getValue();
    var value = Ext.getCmp('valueField').getValue();
    Ext.Ajax.request({
    	url: 'move/setField.action',
    	params: {field: field, value: value},
    	success: function() {
    		loadStoreMove();
    	},
    	failure: function() {
    		alert('erro');
    	}
    	
    });
}

function cleanFilter(){
    Ext.Ajax.request({
    	url: 'move/setField.action',
    	params: {field: null, value: null},
    	success: function() {
    		loadStoreMove();
    	},
    	failure: function() {
    		alert('erro');
    	}
    	
    });
}
// Toolbar
var tbarMove = new Ext.Toolbar([{
    iconCls: 'icon-user-add',
    text: 'Add Move',
    handler: function(){
            var e = new Move({
                name: 'New move',
                value: '0.0',
                place: '',
                typeOfPayId: '',
                dateOfPay: new Date(),
                dateOfMove: new Date(),
                categoryId: '',
                sendNotification: true
            });
            editorMove.stopEditing();
            storeMove.insert(0, e);
            gridMove.getView().refresh();
            gridMove.getSelectionModel().selectRow(0);
            editorMove.startEditing(0);
        }
   	},
   	{
        iconCls: 'icon-user-delete',
        text: 'Remove Move',
        handler: function(){
            editorMove.stopEditing();
            var s = gridMove.getSelectionModel().getSelections();
            for(var i = 0, r; r = s[i]; i++){
                storeMove.remove(r);
            }
        }
    },
    {
        iconCls: 'icon-user-save',
        text: 'Save All Modifications',
        handler: function(){
            storeMove.save();
        }
    },    
   	{
        iconCls: 'icon-user-add',
        text: 'Create new using selected',
        handler: function(){
				editorMove.stopEditing();
             var s = gridMove.getSelectionModel().getSelections();
            if(s.length > 0) {
            	var cb = s[0];
            	var e = new Move({
					name: cb.get('name'),
					place: cb.get('place'),
					typeOfPayId: cb.get('typeOfPayId'),
					dateOfMove: cb.get('dateOfMove'),
					dateOfPay: cb.get('dateOfPay'),
					value: cb.get('value'),
					categoryId: cb.get('categoryId'),
					sendNotification: cb.get('sendNotification')
				});
				editorMove.stopEditing();
	            storeMove.insert(0, e);
	            gridMove.getView().refresh();
	            gridMove.getSelectionModel().selectRow(0);
	            editorMove.startEditing(0);
			}            
        }
    },    
   	{
        iconCls: 'icon-user-add',
        text: 'Sum selecteds',
        handler: function(){
            editorMove.stopEditing();
            var sum = 0;
            var s = gridMove.getSelectionModel().getSelections();
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
            editorMove.stopEditing();
            var sum = 0;
            var count = 0;
            var s = gridMove.getSelectionModel().getSelections();
            for(var i = 0, r; r = s[i]; i++){
                sum += r.get('value');
                count++;
            }
            Ext.Msg.alert('Average of values is R$ ' + Ext.util.Format.number((count != 0 ? sum/count : 0), '0,0.00'));
        }
    },{
    	text: 'Field'
    },
     comboField,
     {
     	xtype: 'textfield',
     	id: 'valueField',
     	name: 'valueField'
     },
     
     {
     	 iconCls: 'icon-user-add',
        text: 'Filter',
        handler: filterResults
     },
     {
     	 iconCls: 'icon-user-add',
        text: 'Clean',
        handler: cleanFilter
     }
     
]);

//paging bar on the bottom
paging = new Ext.PagingToolbar({
    pageSize: 25,
    store: storeMove,
    displayInfo: true,
    displayMsg: 'Displaying moves {0} - {1} of {2}',
    emptyMsg: "No moves to display",
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
var gridMove = new Ext.grid.GridPanel({
    layout: 'fit',
	frame: true,
    height: 300,
    autoWidth: true,
    plugins: [editorMove, Ext.ux.grid.DataDrop],
    store: storeMove,
    colModel: colModelMove,
	tbar: tbarMove,
	bbar: paging
});


var panelMove = new Ext.Panel({
	layout: 'fit',
	id: 'panelMove',
	title: 'Moves',
    autoScroll: true,
    items: [gridMove]
});

function loadStoreMove() {
	waitWin.show();
	storeMove.load({
		params:{start:0, limit:25},
		callback: function() {
			
			waitWin.hide();
			console.log('afterload storeMove');
		},
		failure: function() {
			Ext.Msg.alert('ERROR', 'An error ocurr');
		}
	});
}

function loadPanelMove() {
	
	/*
	while(month != 12 || year != 2009) {
		var it = month + '/' + year;
		months[it] = monthsLet[month] + '/' + year;
		month--;
		if(month == 0) {
			year--;
			month = 12;
		}
	}
	*/
	cleanFilter();
	$('#valueField').bind('keyup', function(e) {
		if (e.keyCode == 13) {
			filterResults();
		}
	});
	waitWin.show();
	//Load all data from database
	//Load categories for combobox
	categoriesForComboMove.load({
        callback: function(){
			if (categoriesForComboMove.getCount() == 0) {
				console.log('afterload categoriesForComboMove');
				progress.hide();
				Ext.Msg.alert('Categories', 'First insert categories');
			} else {
				//Load types of pay for combobox
				typesOfPayForComboMove.load({
			        callback: function(){
						if (typesOfPayForComboMove.getCount() == 0) {
							console.log('afterload typesOfPayForComboMove');
							progress.hide();
							Ext.Msg.alert('Types of Pay', 'First insert type os pays');
						} else {
							loadStoreMove();							
						}
					}
				});
			}
		}
	});
};
