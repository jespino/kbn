class Projects
    constructor: () ->

class Taskboard
    constructor: ($scope) ->
        $scope.states = [
            { _id: "123", name: "To do" }
            { _id: "456", name: "Doing" }
            { _id: "789", name: "Done" }
        ]
        $scope.cards = {}
        $scope.cards["123"] = [{ subject: "Card 1" }, { subject: "Card 2" }]
        $scope.cards["456"] = [{ subject: "Card 3" }, { subject: "Card 4" }]
        $scope.cards["789"] = [{ subject: "Card 5" }, { subject: "Card 6" }]

class Login
    constructor: () ->

class Http404
    constructor: () ->

module = angular.module('kbn.controllers', [])
module.controller('Projects', [Projects])
module.controller('Taskboard', ['$scope', Taskboard])
module.controller('Login', [Login])
module.controller('Http404', [Http404])
