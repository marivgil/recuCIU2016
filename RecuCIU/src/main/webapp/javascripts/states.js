controlGastos.config(function($stateProvider, $urlRouterProvider){

    $urlRouterProvider.otherwise('/');

    $stateProvider

        .state('login', {
            url: "",
            templateUrl: "views/login.html",
            controller: 'GastosController'
            /*
            resolve: {
                resolveResponse: function($stateParams, controlGastosService) {
                    return controlGastosService.login($stateParams.nombre, $stateParams.contrasenia);
                }
            }
*/
        })

        .state('registracion', {
            url: "/registracion",
            templateUrl: "views/registracion.html",
            controller: "GastosController",
            /*
            resolve: {
                resolveResponse: function($stateParams, controlGastosService) {
                    return controlGastosService.registracion($stateParams.nombre, $stateParams.contrasenia);}
            }
            */
        })

        .state('gastos', {
            url: "/gastos",
            templateUrl: "views/gastosContainer.html",
            controller: "GastosController",
            /*
            resolve: {
                resolveResponse: function($stateParams, controlGastosService) {
                    return controlGastosService.registracion($stateParams.nombre, $stateParams.contrasenia);}
            }
            */
        })
});
