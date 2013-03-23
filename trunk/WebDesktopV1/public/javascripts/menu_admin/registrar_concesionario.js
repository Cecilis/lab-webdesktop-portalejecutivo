  //Calcular las posiciones x,y segun la resolucion del monitor del cliente para el tabpanel por ser un layout absolute
   var posx = 0;
   var posy = 0;
   var factorw = 0.001;
   var factorh = 0.10;
   //1024x768
   if (screen.width==1024 && screen.height==768)
   {
    factorw = 0.025;
    factorh = 0.10;
   }
   //1280x800
   if (screen.width==1280 && screen.height==800)
   {
    factorw = 0.080;
    factorh = 0.10;
   }
   //1280x1024
   if (screen.width==1280 && screen.height==1024)
   {
    factorw = 0.020;
    factorh = 0.005;
   }
posx = parseInt(screen.width * factorw);
posy = parseInt(screen.height * factorh);

Ext.require([
	         	'Ext.tree.*',
	         	'Ext.data.*',
	         	'Ext.tip.*',
				'Ext.container.Viewport',
    			'Ext.container.ButtonGroup',
    			'Ext.panel.Panel'
	         ]);

//Definicion del Modelo
Ext.define('Estados', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'int'},
            {name: 'nombre', type: 'varchar'}
           ],
           proxy: {
            type: 'ajax',
            url : 'menu_admin/generardatacombosestados'
           }
});

//Definicion del Data Store
var estadoStore = Ext.create('Ext.data.Store', {
    model: 'Estados',
    autoLoad: true,
});

Ext.define('VentanaConcesionarioAdmin', {
    extend: 'Ext.window.Window',

    height: 480,
	width: 614,
	x: 380,
	y: 150,
    layout: {
        type: 'absolute'
    },
    bodyBorder: true,
    collapsible: true,
    title: 'Registrar Concesionario',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'tabpanel',
                    activeTab: 0,
                    items: [
                        {
                            xtype: 'form',
                            height: 340,
                            autoRender : false,
                            id : 'formaularioconcesionario',                            
                            layout: {
                                type: 'absolute'
                            },
                            bodyPadding : 10,
                            title: 'Datos Concesionario',
                            items: [
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 30,
                                    width: 410,
                                    id : 'rif',
                                    msgTarget : 'under',
									blankText : 'Este campo es requerido',
									enableKeyEvents : true,
									minLength : 1,
									emptyText : 'R.I.F. del Concesionario',
                                    fieldLabel: 'Rif'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 310,
                                    y: 130,
                                    width: 270,
                                    id : 'telefono',
                                    msgTarget : 'under',
									blankText : 'Este campo es requerido',
									enableKeyEvents : true,
									minLength : 1,
									emptyText : 'Teléfono del Concesionario',
                                    fieldLabel: 'Teléfono'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 80,
                                    width: 410,
                                    id: 'nombre',
                                    msgTarget : 'under',
									blankText : 'Este campo es requerido',
									enableKeyEvents : true,
									minLength : 1,
									emptyText : 'Nombre del Concesionario',
                                    fieldLabel: 'Nombre'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 130,
                                    width: 280,
                                    id : 'correo',
                                    msgTarget : 'under',
									blankText : 'Este campo es requerido',
									enableKeyEvents : true,
									minLength : 1,
									emptyText : 'Correo del Concesionario',
                                    fieldLabel: 'Correo'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 240,
                                    width: 560,
                                    id : 'direccion',
                                    msgTarget : 'under',
									blankText : 'Este campo es requerido',
									enableKeyEvents : true,
									minLength : 1,
									emptyText : 'Dirección del Concesionario',
                                    fieldLabel: 'Dirección'
                                },
                                {
                                    xtype: 'combobox',
                                    store: estadoStore,
                                    x: 20,
                                    y: 180,
                                    width: 280,
                                    id : 'cmb_estado',
                                    valueField: 'id',
					                displayField: 'nombre',   
					                queryMode: 'remote',
					                typeAhead: true,
					                emptyText:'Seleccionar',
					                triggerAction: 'all',
					                selecOnFocus: true,
                                    fieldLabel: 'Estado',
                                    listeners: {
						                load: function(store, options) {
						                      var combo = Ext.getCmp('cmb_estado');
						                      combo.setValue(combo.getValue()); 
						                      // enviar_nombreciudad();
						                      // alert('pase');
						             } }
                                    
                                    
                                },
                                {
                                    xtype: 'combobox',
                                    x: 310,
                                    y: 180,
                                    width: 270,
                                    id : 'cmb_ciudad',
                                    fieldLabel: 'Ciudad'
                                },
                                {
                                    xtype: 'combobox',
                                    x: 20,
                                    y: 290,
                                    width: 280,
                                    id : 'cmb_marca',
                                    fieldLabel: 'Marca Asociada'
                                }
                            ]
                        },
                        {
                            xtype: 'form',
                            height: 340,
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Datos del Usuario',
                            items: [
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 30,
                                    width: 300,
                                    id: 'nombre_usuario',
                                    msgTarget : 'under',
									blankText : 'Este campo es requerido',
									enableKeyEvents : true,
									minLength : 1,
									emptyText : 'Login del usuario',
                                    fieldLabel: 'Nombre de Usuario'
                                },
                                {
                                    xtype: 'label',
                                    x: 20,
                                    y: 90,
                                    height: 20,
                                    width: 110,
                                    id : 'rol_usuario',
                                    text: 'Rol del Usuario:'
                                },
                                {
                                    xtype: 'label',
                                    x: 130,
                                    y: 90,
                                    height: 40,
                                    width: 160,
                                    id: 'concesionario',
                                    text: 'Concesionario'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 130,
                                    width: 300,
                                    id: 'contrasena',
                                    msgTarget : 'under',
									blankText : 'Este campo es requerido',
									enableKeyEvents : true,
									minLength : 1,
									emptyText : 'Contraseña del Usuario ',
									inputType: 'password',
                                    fieldLabel: 'Contraseña'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 180,
                                    width: 300,
                                    id: 'contrasena2',
                                    msgTarget : 'under',
									blankText : 'Este campo es requerido',
									enableKeyEvents : true,
									minLength : 1,
									emptyText : 'Contraseña del Usuario ',
									inputType: 'password',
                                    fieldLabel: 'Confirmar Contraseña'
                                },
                                {
                                    xtype: 'button',
                                    x: 490,
                                    y: 260,
                                    text : 'Guardar',
									icon: 'images/grabar.png',
									tooltip : 'Registrar una Datos del Concesionario',
									id : 'btnregistrar',
                                },
                                {
                                    xtype: 'button',
                                    x: 400,
                                    y: 260,
                                    text : 'Limpiar',
									icon: 'images/limpiar.png',
									tooltip : 'Limpiar Campos',
									id : 'btnlimpiar'
                                },
                                 {
                                    xtype: 'button',
                                    x: 300,
                                    y: 260,
                                    text : 'Eliminar',
									icon: 'images/eliminar.png',
									tooltip : 'Eliminar Concesionario',
									id : 'btneliminar'
                                }
                            ]
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});

// function enviar_nombreciudad () {
	// var nombre_estado = Ext.getCmp('cmb_estado').getValue();
  	// Ext.Ajax.request({
		// url : 'menu_admin/buscar_estadoid',
		// //Enviando los parametros a la pagina servidora
		// params : {
			// nombre : nombre_estado
		// },
		// //Retorno exitoso de la pagina servidora a traves del formato JSON
		// success : function(resultado, request) {
			// datos = Ext.JSON.decode(resultado.responseText);
		// },
		// //No hay retorno de la pagina servidora
		// failure : function() {
			// Ext.Msg.alert("Error", "Servidor no conectado");
		// }
	// });
// }

              		