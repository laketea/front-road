angular开发误区.md
整理下项目开发中angular使用误区

1.$timeout and $interval
使用$timeout与$interval替代 setTimeout与setInterval
原因：$timeout与$interval功能更强大，可通过传入参数控制是否调用脏值检测,返回结果支持promise模式，且更易于测试。
http://docs.angularjs.cn/api/ng/service/$timeout
http://docs.angularjs.cn/api/ng/service/$interval

//不推荐
var config = {};
 setTimeout(function() {
     scope.$apply(function(){
     	config = resetConfig();
     })
 }, 1000);

//推荐
 var promise = $timeout(function(){
 	//不需要$apply,默认会在代码执行完成后，调用脏值检测
 	return resetConfig();
 },1000);

 promise.then(function(config){
 	//$timeout支持成功后，将返回内部函数执行的结果
 })


2.http interceptor
http拦截器应该注册为系统的服务，注册拦截器的只需要使用对于的服务名称即可
原因：方便测试

//不推荐
angular.module('tb.common')
        .config(function($httpProvider) {
        	$httpProvider.interceptors.push(serverErrorResponseHttpInterceptor);
        });

 function serverErrorResponseHttpInterceptor($q, $rootScope, $location, $translate, $log) {
 	return {
 		responseError:function(){
 			...
 		}
 	}

 }

//推荐
angular.module("app", ['pascalprecht.translate', 'home'])
        .config(function($httpProvider) {
            $httpProvider.interceptors.push("requestHttpInterceptor");
        })
        .factory("requestHttpInterceptor", function requestHttpInterceptor() {
            return {
                'request': function(config) {
                }
            }
        });

4.directives scope
指令应该尽量隔离scope，通过配置指令的scope参数以及dom属性来传递数据
原因：避免污染父级scope，避免同一个scope环境下多个指令直接scope及变量冲突

//不推荐
<div tb-tester-model tester-id="vm.testerId"></div>

function tbTestersModal($modal) {
         return {
             restrict: 'A',
             compile: function(element, attributes) {
                 return function(scope, element, attributes) {
                 	var testerId = attributes.testerId;
                 	//仅通过dom属性传递，获取的是变量的名称，需要通过$eval来解析对于的值
                 	testerId = scope.$eval(vm.testerId);
                 };
             }
        }
}

//推荐
<div tb-tester-model tester-id="vm.testerId"></div>
function tbTestersModal($modal) {
         return {
             restrict: 'A',
             //scope有三种配置方式
             //scope：true，创建了一个新的scope，而且当前scope原型继承于父结点
             //scope：false，指令内部的scope就是指令外部的scope，默认情况就是false,
             //scope：{},创建一个新的scope，并且不继承父亲scope，通过配置{}对象的key，values来设置传递的数据
             scope:{
             	//value属性的三种配置方式：= ,@ ,&
             	testerId:'=testerId'
         	 },
             compile: function(element, attributes) {
                 return function(scope, element, attributes) {
                 	//可直接使用
                 	scope.testerId;
                 };
             }
        }
}

5.filter
尽量使用angular内置的filter（number，date，lowercase等），部分通用数据处理可改为filter的方式实现（filter可在js以及template中使用）
原因：方便代码复用以及测试

//不推荐
{{ points.toFixed(2)}}
//推荐
{{ points | number:2}}

//创建filter
angular.module("MyApp", [])
    .filter("MyFilter", function () { 
    return function (beforeFilter) {
    	//去除小数末尾的0
        return beforeFilter.replace(/\.?0+$/, '')
    }
})

$q
推荐使用$q构造函数创建promise对象，这样代码更简洁。
处理多层prmose时，推荐使用链式写法，尽量避免promise嵌套。

//不推荐
function getDeviceId(){

	var deferred = $q.defer();
	var promise = deferred.promise;

	cordova.exe("DEVICE",function(data){
		promise.resolve(data);
	},function(data){
		promise.inject(data);
	});

	return promise;
}

//推荐
function getDeviceId(){
	//$q(func)返回一个新的promise，
	return $q(function(resolve,reject){
		//resolve，reject分别为成功/失败的回调函数
		cordova.exe("DEVICE",resolve,reject);
	});

};


//不推荐
function getDevice(){
	return $http.getPhone().then(function(data){
		return $http.getUser(data.id).then(function(user){
			return $http.getDevice(user.id);
		})
	})
}

//推荐
function getDevice(){
	return $http.getPhone().then(function(data){
		return $http.getUser(data.id);
	}).then(function(user){
		return $http.getDevice(user.id);
	});
}

ngModel $formatters与$parsers
使用ngModel的时候，如果需要做通用的数据转换，可以使用$formatters与$parsers来处理
原因：方便代码复用与测试
<input  class="birthday-input" type="date" ng-model="vm.profile.birthday" birthday-input ng-change="vm.onProfileChange('birthday')">
function birthdayInput() {
        return {
            restrict: 'A',
            require: '?ngModel',
            link: function(scope, iElement, iAttrs, ngModelCtrl) {
                ngModelCtrl.$formatters.push(function(modelValue) {
                    return modelValue ? new Date(modelValue * 1000) : modelValue;
                });
                ngModelCtrl.$parsers.push(function(viewValue) {
                    return (new Date(viewValue)).getTime() / 1000;
                });
            }
        };
    }




5.controller
controller与service 的职责区分


