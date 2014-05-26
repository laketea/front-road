/**
 * app.js
 * Copyright (c) 2013 Youngfriend Inc.
 * All rights reserved.
 */
 var app =angular.module('app', [],function(){
    console.log('app module');
});
app.controller('AppCtrl', ['serviceTest','$q', function AppCtrl(serTest,$q) {

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


