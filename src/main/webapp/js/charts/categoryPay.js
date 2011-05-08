// Add the additional 'advanced' VTypes
Ext.apply(Ext.form.VTypes, {
    daterange : function(val, field) {
        var date = field.parseDate(val);

        if(!date){
            return false;
        }
        if (field.startDateField && (!this.dateRangeMax || (date.getTime() != this.dateRangeMax.getTime()))) {
            var start = Ext.getCmp(field.startDateField);
            start.setMaxValue(date);
            start.validate();
            this.dateRangeMax = date;
        }
        else if (field.endDateField && (!this.dateRangeMin || (date.getTime() != this.dateRangeMin.getTime()))) {
            var end = Ext.getCmp(field.endDateField);
            end.setMinValue(date);
            end.validate();
            this.dateRangeMin = date;
        }
        /*
         * Always return true since we're only using this vtype to set the
         * min/max allowed values (these are tested for after the vtype test)
         */
        return true;
    }
});

//List of CategoryPay
var storeCategoryPay = new Ext.data.Store({
	proxy: new Ext.data.HttpProxy({
		url: 'chart/categoryPay.action'
	}),
	reader: new Ext.data.JsonReader({
			root:'data'
		},
		[
		 {name: 'category'},
		 {name: 'shortCategory'},
		 {name: 'total'},
		 {name: 'pay'}			
		]
	),
    listeners: {
		beforeload: function(){
			console.log('beforeload storeCategoryPay');
		},
		load: function(){
			console.log('load storeCategoryPay');
		},
		beforesave: function(){
			console.log('beforesave storeCategoryPay');
		},
		save: function(){
			console.log('save storeCategory');
		}
	}
});

var chartCategoryPay = new Ext.chart.ColumnChart({
    store: storeCategoryPay,
    xField: 'shortCategory',
    yAxis: new Ext.chart.NumericAxis({
        displayName: 'Category',
        labelRenderer : Ext.util.Format.numberRenderer('0,0')
    }),
    tipRenderer : function(chart, record, index, series){
        if (series.yField == 'pay') {
            return 'Planned $ ' + Ext.util.Format.number(record.data.pay, '0.0') + ' in ' + record.data.category;
        } else {
            return 'Spent $' + Ext.util.Format.number(record.data.total, '0.0') + ' in ' + record.data.category;
        }
    },
    chartStyle: {
        padding: 30,
        animationEnabled: true,
        font: {
            name: 'Tahoma',
            color: 0x444444,
            size: 11
        },
        dataTip: {
            padding: 30,
            border: {
                color: 0x99bbe8,
                size:1
            },
            background: {
                color: 0xDAE7F6,
                alpha: .9
            },
            font: {
                name: 'Tahoma',
                color: 0x15428B,
                size: 10,
                bold: true
            }
        },
        xAxis: {
            color: 0x69aBc8,
            majorTicks: {color: 0x69aBc8, length: 4},
            minorTicks: {color: 0x69aBc8, length: 2},
            majorGridLines: {size: 1, color: 0xeeeeee}
        },
        yAxis: {
            color: 0x69aBc8,
            majorTicks: {color: 0x69aBc8, length: 4},
            minorTicks: {color: 0x69aBc8, length: 2},
            majorGridLines: {size: 1, color: 0xdfe8f6}
        }
    },
    series: [{
        type: 'column',
        displayName: 'Pay',
        yField: 'pay',
        style: {
            image:'bar.gif',
            mode: 'stretch',
            color:0x99BBE8
        }
    },{
        type:'line',
        displayName: 'Total',
        yField: 'total',
        style: {
            color: 0x15428B
        }
    }]
});

var panelDateRangeCategoryPay = new Ext.FormPanel({
  labelWidth: 125,
  frame: true,
  title: 'Date Range',
  url: 'chart/setDateRange.action', 
  bodyStyle:'padding:5px 5px 0',
  autoHeight: true,
  autoWidth: true,
  defaults: {width: 175},
  defaultType: 'datefield',
  items: [
      {
        fieldLabel: 'Start Date',
        name: 'startdt',
        id: 'startdt',
        dateFormat: 'Y/M/d',
        vtype: 'daterange',
        endDateField: 'enddt' // id of the end date field
      },{
        fieldLabel: 'End Date',
        name: 'enddt',
        id: 'enddt',
        dateFormat: 'Y/M/d',
        vtype: 'daterange',
        startDateField: 'startdt' // id of the start date field
      }
  ],
  buttonAlign: 'left',
  buttons: [{
	  text:'Load chart',
      handler: function() {
	  	panelDateRangeCategoryPay.getForm().submit({ 
              method: 'POST', 
              waitTitle: 'Connecting', 
              waitMsg: 'retriving data...', 
	 
              success: function(){                    
		  		storeCategoryPay.load({
		  	        callback: function(){
		  				console.log('afterload storeCategoryPay');
		  	        }
		  	    });
              },

              failure: function(form, action){ 
              		Ext.Msg.alert('Status', 'error!');
                  if(action.failureType == 'server'){ 
                      obj = Ext.util.JSON.decode(action.response.responseText); 
                      Ext.Msg.alert('Error!', obj.errors.reason); 
                  }else{ 
                      Ext.Msg.alert('Warning!', 'Authentication server is unreachable : ' + action.response.responseText); 
                  } 
              }
          }); 
  	  }
  }] 
});

var panelCategoryPay = new Ext.Panel({
    title: 'Pay per Category (just with Move\'s)',
    frame: true,
    height: 300,
    layout: 'fit',
    items: [chartCategoryPay]
});

var panelChartCategoryPay = new Ext.Panel({
	id: 'panelChartCategoryPay',
	title: 'Chart ExtJS',
    split: true,
    layout: 'fit',
    items: [panelDateRangeCategoryPay, panelCategoryPay]
});

function loadPanelChartCategoryPay() {
	waitWin.show();
	storeCategoryPay.load({
        callback: function(){
			waitWin.hide();
			console.log('afterload storeCategoryPay');
        }
    });
};