Ext.onReady(function() {
	Ext.QuickTips.init();
	// List of categories for combobox
	var categoriesForComboMove = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : 'category/viewFromForm.action'
		}),
		reader : new Ext.data.JsonReader({
			root : 'data'
		}, [ {
			name : 'id'
		}, {
			name : 'name'
		}, {
			name : 'pay',
			type : 'boolean'
		} ]),
		listeners : {
			beforeload : function() {
				console.log('beforeload categoriesForComboMove');
			}
		}
	});

	// List of types of pay for combobox
	var typesOfPayForComboMove = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : 'typeOfPay/viewFromForm.action'
		}),
		reader : new Ext.data.JsonReader({
			root : 'data'
		}, [ {
			name : 'id'
		}, {
			name : 'name'
		} ]),
		listeners : {
			beforeload : function() {
				console.log('beforeload typesOfPayForComboMove');
			}
		}
	});

	// Combo of categories
	var comboCategories = new Ext.form.ComboBox({
		fieldLabel : 'Category',
		hiddenName : 'category',
		valueField : 'id',
		mode : 'local',
		typeAhead : true,
		store : categoriesForComboMove,
		displayField : 'name',
		anchor : '100%',
		lazyRender : true,
		forceSelection : true,
		triggerAction : 'all',
		allowBlank : false,
		emptyText : 'select ...',
		selectOnFocus : true
	});

	// Combo of types of pay
	var comboTypesOfPay = new Ext.form.ComboBox({
		fieldLabel : 'Type',
		hiddenName : 'typeOfPay',
		valueField : 'id',
		mode : 'local',
		typeAhead : true,
		store : typesOfPayForComboMove,
		displayField : 'name',
		anchor : '100%',
		lazyRender : true,
		forceSelection : true,
		triggerAction : 'all',
		allowBlank : false,
		emptyText : 'select ...',
		selectOnFocus : true
	});

	var form = new Ext.form.FormPanel({ // (1)
		renderTo : Ext.getBody(), // (2)
		url : 'move/createFromForm.action',
		frame : true,
		title : 'New Move',
		width : 300,
		items : [ new Ext.form.DateField({
			fieldLabel : 'Date Move',
			name : 'dateOfMove',
			allowBlank : false,
			format : 'Y/M/d'
		}), {
			fieldLabel : 'Name',
			name : 'name',
			allowBlank : false,
			xtype : 'textfield'
		}, {
			fieldLabel : 'Value',
			name : 'value',
			allowBlank : false,
			xtype : 'numberfield'
		}, comboCategories, new Ext.form.DateField({
			fieldLabel : 'Date Pay',
			name : 'dateOfPay',
			allowBlank : false,
			format : 'Y/M/d'
		}), comboTypesOfPay, {
			fieldLabel : 'Place',
			name : 'place',
			xtype : 'textfield'
		} ],
		buttons : [ {
			text : 'Save',
			formBind : true,
			handler : function() {
				form.getForm().submit({
					method : 'POST',
					waitTitle : 'Connecting',
					waitMsg : 'login...',

					success : function() {
//						Ext.Msg.alert('Status', 'Successful!');
						alert('ok');
						window.location = 'l.jsp';
					},

					failure : function(form, action) {
						Ext.Msg.alert('Failed!', 'Failed!');
					}
				});
			}
		} ]
	});

	waitWin.show();
	// Load all data from database
	// Load categories for combobox
	categoriesForComboMove.load({
		callback : function() {
			if (categoriesForComboMove.getCount() == 0) {
				console.log('afterload categoriesForComboMove');
				progress.hide();
				Ext.Msg.alert('Categories', 'First insert categories');
			} else {
				// Load types of pay for combobox
				typesOfPayForComboMove.load({
					callback : function() {
						if (typesOfPayForComboMove.getCount() == 0) {
							console.log('afterload typesOfPayForComboMove');
							progress.hide();
							Ext.Msg.alert('Types of Pay',
									'First insert type os pays');
						} else {

							waitWin.hide();
							console.log('afterload storeMove');

						}
					}
				});
			}
		}
	});
});