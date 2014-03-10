config = ($routeProvider) ->
    $routeProvider.when('/projects', {templateUrl: 'partials/projects.html', controller: "Projects as ctrl"})
    $routeProvider.when('/taskboard', {templateUrl: 'partials/taskboard.html', controller: "Taskboard as ctrl"})
    $routeProvider.when('/login', {templateUrl: 'partials/login.html', controller: "Login as ctrl"})
    $routeProvider.when('/404', {templateUrl: 'partials/404.html', controller: "Http404 as ctrl"})
    $routeProvider.otherwise({redirectTo: '/404'})

modules = [
    'ngRoute',
    'kbn.controllers',
    'kbn.directives'
]

init = () ->

angular.module('kbn', modules)
       .config(['$routeProvider', config])
       .run(init)
