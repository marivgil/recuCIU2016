controlGastos.config(function($stateProvider, $urlRouterProvider){

    $urlRouterProvider.otherwise('/');

    $stateProvider

        .state('login', {
            url: "",
            templateUrl: "views/login.html",
            controller: 'LoginController'

        })

        .state('registracion', {
            url: "/registracion",
            templateUrl: "views/registracion.html",
            controller: "LoginController",
        })

        .state('gastos', {
            url: "/gastos",
            templateUrl: "views/gastosContainer.html",
            controller: "GastosController",
        })
});
