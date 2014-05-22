/**
 * app.js
 * Copyright (c) 2013 Youngfriend Inc.
 * All rights reserved.
 */
 var app =angular.module('app', [],function(){
    console.log('app module');
});
app.controller('AppCtrl', ['serviceTest', function AppCtrl(serTest) {

   console.log('init');

    console.log('kkkk');

    console.log('use service:'+serTest.test);

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


angluar.bootsrtap(

)
