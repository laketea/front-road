/**
 * app.js
 * Copyright (c) 2013 Youngfriend Inc.
 * All rights reserved.
 */
 var app =angular.module('app', [],function(){
    console.log('app module');
});
app.controller('AppCtrl', ['$scope','serviceTest','$q', function AppCtrl($scope,serTest,$q) {

   var defer = $q.defer();

    var $promise = defer.promise;

//    $promise.then(function(value){
//        console.log(value);
//    });
//
//    defer.resolve('test')
    var funcs = function(){
        console.log('123');
    };



    var def = $q.when($promise,funcs);

    defer.resolve('fuck');

    $scope.area ="test";

}]);

app.factory('testFactory',function(){
    console.log('testFactory run');
    return '12312';
})

app.run(['testFactory',function(testFactory){

    console.log('this the run fn');
    console.log('you can knoew testFactory is:'+testFactory);
}]);

app.service('serviceTest',function(){
    console.log('serviceTest');
    this.test = 'test';
})

var ff =angular.module('test-other', [],function(){
    console.log('test-other module');
});

app.directive('fileType',function(){

    return {
        restrict:'E',
        template:'<div class="FFFFF{{text}}" fied="{{text}}">123123123{{text}}</div>',
        scope: {
            model: '=',
            attr: '=',
            value: '='
        },
        compile:function(){
            console.log('compile');
            return function(scope){
                scope.text = 'fuck';
                console.log('link');
            }
        }

    }
});


