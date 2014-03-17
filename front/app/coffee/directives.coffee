KbnSortableDirective = ($log, $rootScope) ->
    scope: true
    link: (scope, element, attrs) ->
        onAdd = scope.$eval(attrs.kbnSortableOnAdd) or angular.noop
        onRemove = scope.$eval(attrs.kbnSortableOnRemove) or angular.noop
        onUpdate = scope.$eval(attrs.kbnSortableOnUpdate) or angular.noop
        itemName = attrs.kbnSortableItemName or "item"
        selector = attrs.kbnSortableSelector

        new Sortable element[0], {
            group: attrs.kbnSortable
            draggable: selector

            onUpdate: (event) ->
                $log.debug "KbnSortableDirective.onUpdate"
                orderedItems = _.sortBy element.find(selector), (item) -> angular.element(item).index()
                items = _.map orderedItems, (item) -> angular.element(item).scope()[itemName]
                onUpdate(items, scope)

            onAdd: (event) ->
                $log.debug "KbnSortableDirective.onAdd"
                item = angular.element(event.item)
                onAdd(item.scope()[itemName], item.index(), scope)

            onRemove: (event) ->
                $log.debug "KbnSortableDirective.onRemove"
                item = angular.element(event.item)
                onRemove(item.scope()[itemName], scope)
        }
module = angular.module('kbn.directives', [])
module.directive('kbnSortable', KbnSortableDirective)

