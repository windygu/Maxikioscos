(function(){

	angular.module('maxikioscosApp')
	.constant('SERVICE_CONSTANTS', (function () {	
		var protocolService = "http://";
		var api= "/api/";
		var port= ":8080";
		var urlMasterService = 'http://192.168.0.12:51557/';
		
		return {
			URL_MASTER_SERVICE: urlMasterService,
			PROTOCOL_SERVICE: protocolService,
			PORT: port,
			API: api,
			MAXIKIOSCOS: urlMasterService + 'MaxiKioscosService.svc/GetMaxiKioscos',
			LOGIN: urlMasterService + 'MaxiKioscosService.svc/Login',
			LOGOFF: urlMasterService + 'MaxiKioscosService.svc/LogOff',
			RUBROS_LIST : api + 'Rubro/Get',
			MARCAS_LIST : api + 'Provider/Get',
			MOTIVOS_LIST : api + 'Motivo/Get',
			STOCK_CONTROL: api + 'stockcontrol/Get',
			STOCK_CONTROL_DETALLE: api + 'stockcontrol/GetObtenerDetalle',
			STOCK_CONTROL_CERRAR: api + 'stockcontrol/PostCerrar',
			PRODUCTS_BY_CODE: api + 'product/GetByCode',
			STOCK_CONTROL_DINAMICO_CERRAR: api + 'stockcontrol/PostDinamicoCerrar'

		};
	})());
})();