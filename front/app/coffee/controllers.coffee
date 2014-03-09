class Projects
    constructor: () ->

class Taskboard
    constructor: () ->

class Login
    constructor: () ->

class Http404
    constructor: () ->

module = angular.module('kbn.controllers', [])
module.controller('Projects', [Projects])
module.controller('Taskboard', [Taskboard])
module.controller('Login', [Login])
module.controller('Http404', [Http404])
