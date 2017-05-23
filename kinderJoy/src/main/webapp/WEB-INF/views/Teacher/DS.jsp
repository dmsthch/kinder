<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>

    <link href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css' rel='stylesheet'/>
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.10/angular.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    
    <style>
        #container {
            margin-top: 20px;
        }

        #container .ui-droppable { }

        ul { margin: 0; }
        hr { margin: 5px 0; }
        .btn-block { padding-left: 5px; padding-right: 5px; }

        .selectable .ui-selecting { background: #FECA40; }
        .selectable .ui-selected { background: #F39814; color: white; }

        .badge.badge-drag { position: absolute; top: -7px; right: -7px; }

        i.move {cursor: move;}

    </style>

</head>
<body>
<c:if test="${teacherString != null}">
값있음
</c:if>
<c:if test="${teacherString == null}">
값없
</c:if>

<div ng-app='App' id="container" class='row-fluid' ng-controller='dndCtrl' ui-selectable-drag-drop ng-cloak>
    <div class="span1"></div>

    <div class="span5 well">
        <span class="label label-info">{{someArrays.list1.length}} Jobs</span>
        <hr>
        <ul id="selectable" ui-drop-listener='dropListener' data-model='someArrays.list1' class="selectable" ng-model="someArrays.list1" ui-selectable="{{selectableConfig}}" >
            <li ui-draggable ng-repeat='item in someArrays.list1' data-index='{{$index}}' data-object="{{item}}" class='btn btn-info btn-block'>
                <i class="icon-move pull-left move"></i> {{item.name}}
                <span class="label label-success pull-right">{{item.id}}</span>
            </li>
        </ul>
          
    </div>
    
    <div class="span5 well">
        <span class="label label-info">{{someArrays.list2.length}} Jobs</span>
        <hr>
        <ul id="selectable" ui-drop-listener='dropListener' data-model='someArrays.list2' class="selectable" ng-model="someArrays.list2" ui-selectable="{{selectableConfig}}" >
            <li ui-draggable ng-repeat='item in someArrays.list2' data-index='{{$index}}' data-object="{{item}}" class='btn btn-info btn-block'>
                <i class="icon-move pull-left move"></i> {{item.name}}
                <span class="label label-success pull-right">{{item.id}}</span>
            </li>
        </ul>
          
    </div>
    
        <div class="span5 well">
        <span class="label label-info">{{someArrays.list3.length}} Jobs</span>
        <hr>
        <ul id="selectable" ui-drop-listener='dropListener' data-model='someArrays.list3' class="selectable" ng-model="someArrays.list3" ui-selectable="{{selectableConfig}}" >
            <li ui-draggable ng-repeat='item in someArrays.list3' data-index='{{$index}}' data-object="{{item}}" class='btn btn-info btn-block'>
                <i class="icon-move pull-left move"></i> {{item.name}}
                <span class="label label-success pull-right">{{item.id}}</span>
            </li>
        </ul>
          
    </div>
    
    <div class="span5 well">
        <input type="text" ng-model="nameFilter" class="span8" placeholder="name filter">
        <input type="text" ng-model="idFilter" class="span4" placeholder="id filter">

        <div style="margin-bottom: 5px;">
            Select:
            <button class="btn btn-mini btn-success" ng-click="select('all')">All</button>
            <button class="btn btn-mini btn-danger" ng-click="select('none')">None</button>
        </div>

        <ul id="selectable" ui-drop-listener='dropListener' data-model='someArrays.list0' class="selectable" ng-model="selectedJobs" ui-selectable="{{selectableConfig}}" >
            <li ui-draggable ng-repeat='item in someArrays.list0 | name_filter:nameFilter | id_filter:idFilter' data-index='{{$index}}' data-object="{{item}}" class='btn btn-info btn-block'>
                <i class="icon-move pull-left move"></i> {{item.name}}
                <span class="label label-success pull-right">{{item.id}}</span>
            </li>
        </ul>
    </div>

    <div class="span1"></div>
</div>


<script>
    (function () {
    	
    	var childString = "${childString}";
    	var teacherString = "${teacherString}";
    	
    	for(var i=0; i<teacherString; i++){
    	console.log(teacherString)
    	}
    	
    	console.log(childString)
        var app = angular.module('App', []);

        app.controller('dndCtrl', ['$scope', 'someArrays', function ($scope, someArrays) {

            someArrays.then(function (result) {
                $scope.someArrays = result.someArrays;
            });

            // @TODO This isn't working
            $scope.selectableConfig = {
                filter: "li"
            };

            $scope.dropListener = function (eDraggable, eDroppable) {

                var isDropForbidden = function (aTarget, item) {
                    return false;
                };

                var onDropRejected = function (error) {
                    alert('Operation not permitted: ' + error.reason);
                };

                var onDropComplete = function (aSrc, eSrc, items) {
                    // drop complete, clear selected and filters
                    $scope.selected = [];
                    $scope.idFilter = null, $scope.nameFilter = null;
                    console.log('moved "' + items.length + ' jobs from ' + aSrc +  ' to ' + eSrc);
                };

                var eSrc = eDraggable.parent();
                var sSrc = eSrc.data('model');
                var sTarget = eDroppable.data('model');

                if (sSrc != sTarget) {
                    $scope.$apply(function () {
                        var aSrc = $scope.$eval(sSrc);
                        var aTarget = $scope.$eval(sTarget);
                        var items = [];
                        var error = false;

                        // if nothing has been selected but a job has been dragged add to selected list for processing
                        if($scope.selected.length <= 0) {
                            $scope.selected.push(eDraggable.data('object'));
                        }

                        var i = $scope.selected.length;
                        while(i--)
                        {
                            var item = $scope.selected[i];
                            // check item isn't forbidden.
                            if(error = isDropForbidden(aTarget, item))
                                break;

                            // building array of valid items to move
                            items.push(item);
                        }

                        if (error) {
                            onDropRejected(error);
                        } else {
                            // loop through valid items, push to target and splice from source
                            var i = items.length;
                            while(i--)
                            {
                                // push item onto target
                                aTarget.push(items[i]);
                                // loop through source items and spice when object found
                                for(var j = aSrc.length - 1; j >= 0; j--) {
                                    if(angular.equals(aSrc[j], items[i])) {
                                        aSrc.splice(j, 1);
                                        break;
                                    }
                                }
                            }
                            // move is complete
                            onDropComplete(sSrc, sTarget, items);
                        }
                    });
                }
            };
        }]);

    app.value('uiSelectableConfig',{})
       .directive('uiSelectable', ['uiSelectableConfig',  function (uiSelectableConfig) {
        return {
            //restrict:'A',
            require: ['ngModel','^uiSelectableDragDrop'],
            link:function (scope, element, attrs, ctrlArr) {
                var ngModel = ctrlArr[0];
                var uiSelectableDragDropCtrl = ctrlArr[1];

                function combineCallbacks(first,second){
                    if( second && (typeof second === "function") ){
                        return function(e,ui){
                            first(e,ui);
                            second(e,ui);
                        };
                    }
                    return first;
                }

                var opts = { filter: 'li' };

                var callbacks = {
                    selected: null,
                    selecting: null,
                    start: null,
                    stop: null,
                    unselected: null,
                    unselecting: null
                };

                angular.extend(opts, uiSelectableConfig);

                if (ngModel) {
                    ngModel.$render = function() {
                        element.selectable( "refresh" );
                    };
                    callbacks.selected = function(e, ui) {
                        var obj = scope.$eval(ui.selected.getAttribute('data-object'));
                        uiSelectableDragDropCtrl.addSelected(obj);
                    };
                    callbacks.stop = function(e, ui) {
                        console.log(uiSelectableDragDropCtrl.getSelected().length + ' selected items');
                        console.log(uiSelectableDragDropCtrl.getSelected());
                    };
                    callbacks.unselected = function(e, ui) {
                        var obj = scope.$eval(ui.unselected.getAttribute('data-object'));
                        uiSelectableDragDropCtrl.removeSelected(obj);
                    };
                }

                angular.forEach(callbacks, function(value, key ){
                    opts[key] = combineCallbacks(value, opts[key]);
                });

                element.selectable(opts);
            }
        };
    }]);

    app.directive('uiDraggable', function () {
        return {
            restrict:'A',
            require: '^uiSelectableDragDrop',
            link:function (scope, element, attrs, uiSelectableDragDropCtrl) {
                element.draggable({
                    revert:true,
                    handle: "i",
                    start: function() {
                        // if element being dragged has been selected append item counter
                        // otherwise we are dragging a single item
                        if(uiSelectableDragDropCtrl.isSelected(element.data('object'))
                                && uiSelectableDragDropCtrl.getSelected().length > 0)
                            element.append("<span id='num_selected' class='badge badge-inverse badge-drag'>"
                                    + uiSelectableDragDropCtrl.getSelected().length
                                    + "</span>");
                            element.css('z-index','1000');
                    },
                    stop: function() {
                        element.find('#num_selected').remove();
                        element.css('z-index','');
                    }
                });
            }
        };
    });

    app.directive('uiDropListener', function () {
        return {
            restrict:'A',
            require: '^uiSelectableDragDrop',
            link:function (scope, eDroppable, attrs, uiSelectableDragDropCtrl) {
                eDroppable.droppable({
                    drop:function (event, ui) {
                        var fnDropListener = scope.$eval(attrs.uiDropListener);
                        if (fnDropListener && angular.isFunction(fnDropListener)) {
                            var eDraggable = angular.element(ui.draggable);
                            fnDropListener(eDraggable, eDroppable, event, ui);
                        }
                    }
                });
            }
        };
    });

    app.directive('uiSelectableDragDrop', function () {
        return {
            controller: function($scope, $element, $attrs, $transclude) {
                $scope.selected = [];
                var that = this;

                this.addSelected = function(obj) {
                    if(!angular.isArray( $scope.selected ))
                        $scope.selected = [];

                    // check obj doesn't exist already
                    // happens when clicking the same item as unselected isn't called.
                    // ngModel.selected should only have one item
                    var i = $scope.selected.length;
                    while(i--) {
                        if(angular.equals(obj, $scope.selected[i]))
                            return;
                    }
                    $scope.selected.push(obj);
                };
                this.removeSelected = function(obj) {
                    var i = $scope.selected.length;
                    while(i--) {
                        if(angular.equals(obj, $scope.selected[i]))
                            break;
                    }
                    $scope.selected.splice(i,1);
                };
                this.removeAll = function() {
                    $scope.selected = [];
                };
                this.getSelected = function() {
                    if(!angular.isArray( $scope.selected ))
                        return [];

                    return $scope.selected;
                };
                this.isSelected = function(obj) {
                    var i = $scope.selected.length;
                    while(i--) {
                        if(angular.equals(obj, $scope.selected[i]))
                            return true;
                    }
                    return false;
                }

                $scope.select = function (selections) {
                    if(typeof selections === 'string') {
                        if(selections === 'all') {
                            var elSelectable = angular.element('.selectable li').addClass('ui-selected');

                            angular.forEach(elSelectable, function(value,key) {
                                var obj = $scope.$eval(value.getAttribute('data-object'));
                                that.addSelected(obj);
                            });
                        } else if (selections === 'none') {
                            angular.element('.selectable li').removeClass('ui-selected');
                            that.removeAll();
                        }
                    }
                }
            }
        };
    });
	
    app.factory('someArrays', ['$q', '$timeout', function ($q, $timeout) {
        var deferred = $q.defer();

        $timeout(function () {
            deferred.resolve({
            	
            	someArrays:{
            	
                    list0:
                    	
                    [
                    	<c:forEach var='t' items='${takeTeacher}'>
                        {name:'${t.teacherName}', id:'${t.teacherNo}'},
                        </c:forEach>
                    	
                    ]
                    
            	,
            		list1:
                    [
						<c:forEach var='c' items='${takeClass}'>
                    	
                    	<c:if test="${c.classAge == 3}">
                        {name:'${c.className}' ,id:'${c.classAge}'},
                        </c:if>
                        
                        </c:forEach>
                    ]
            	,
            		list2:
            		[
            			
						<c:forEach var='c' items='${takeClass}'>
                    	
                    	<c:if test="${c.classAge == 4}">
                        {name:'${c.className}' ,id:'${c.classAge}'},
                        </c:if>
                        
                        </c:forEach>
            			
            		]
            	,
            		list3:
            		[
            			
						<c:forEach var='c' items='${takeClass}'>
                    	
                    	<c:if test="${c.classAge == 5}">
                        {name:'${c.className}' ,id:'${c.classAge}'},
                        </c:if>
                        
                        </c:forEach>
            			
            		]
                }
            });
        }, 50);
        return deferred.promise;
    }]);

    app.filter('name_filter', function(){
        return function(items, nameFilter){
            if(!nameFilter)
                return items;

            var arrayToReturn = [];
            for (var i = 0; i < items.length; i++){
                if (items[i].name.indexOf(nameFilter) !== -1) {
                    //items[i]['orgIndex'] = i;
                    arrayToReturn.push(items[i]);
                }
            }
            return arrayToReturn;
        };
    });

    app.filter('id_filter', function(){
        return function(items, idFilter){
            if(!idFilter)
                return items;

            var arrayToReturn = [];
            for (var i = 0; i < items.length; i++){
                if (items[i].id.toString().indexOf(idFilter) !== -1) {
                    arrayToReturn.push(items[i]);
                }
            }
            return arrayToReturn;
        };
    });

})();
</script>

</body>
</html>