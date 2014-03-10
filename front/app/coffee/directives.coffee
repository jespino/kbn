KbnSortableDirective = ->
    link: (scope, element, attrs) ->
        onAdd = scope.$eval(attrs.gmSortableOnAdd) or () ->
        onRemove = scope.$eval(attrs.gmSortableOnRemove) or () ->
        onUpdate = scope.$eval(attrs.gmSortableOnUpdate) or () ->
        selector = attrs.gmSortableSelector

        getItemsList = () ->
            _.map element.find(selector), (item) ->
                [$(item), $(item).index()]

        new Sortable element[0], {
            group: attrs.gmSortable
            draggable: selector

            onUpdate: (event) ->
                $log.debug "GmSortableDirective.onUpdate"
                onUpdate($(event.item), getItemsList())

            onAdd: (event) ->
                $log.debug "GmSortableDirective.onAdd"
                onAdd($(event.item), getItemsList())

            onRemove: (event) ->
                $log.debug "GmSortableDirective.onRemove"
                onRemove($(event.item), getItemsList())
        }

module = angular.module('kbn.directives', [])
module.directive('KbnSortable', KbnSortableDirective)
