backbone-relational.js


一。简介：
	b-rz主要提供backbone模型之间1-1,1-多，多-1关系的维护。通过使用relations属性来定义。
	relative，必须最少定义 type，key，relatedModel，type可用的类型为:Backbone.HasOne,Backbone.HasMany
	
二。主要功能如下：
		1）双向关联。通过事件的方式来大道想关联模型的changes。
		2）通过includeInJSON 参数来控制关联的模型如何序列号。
		3）Automatically convert nested objects in a model's attributes into model instances using the createModels option.
			通过createModels 参数，自动的转换模型属性里的对象到模型的实例。
		4）通过fetchRelated方法，延迟回复一组相关的模型
		5）通过collectionType 来判定一对多的情况下，子属性collections的类型。
		
		事件：add,remove,reset,change
		
三。主要API
	主要分为属性，实例方法，以及静态方法
	属性:
		relations,subModelTypes,subModelTypeAttribute
	实例方法：
		getRelation,getRelations,fetchRelated,set,toJSON
	静态方法：
		setup,build,findOrCreate
	
四。relations属性
	relatedModel,key,type 必须
	key：
		string，属性名
	relatedModel:
		string/relationalModel:相关的模型
	type:
		string/Backbone,HasOne/HasMany
		如果是HasOne，则reverseRealation的type，默认是HasMany（一对多），也可以设置成HasOne（一对一）
		如果是HasMany，则reverseRealation的type,只能是HasOne(多对一），暂时不支持多对对。
		如果要实现多对多，使用一个中间的model即可。
	includeInJSON：
		boolean/string/string[]  默认是true
		如果是boolean类型：ture，序列化时，包含相关model的全部属性。如果false，不包含相关模型的属性
		如果是string：则序列化时，序列化相关模型的单个属性
		如果是string[]:则以此类推啊
	autoFetch：
		boolean/object 默认false
		如果这个属性设置为true,当一个模型实例化相关的模型使用fetchRelated自动获取到。
		该属性的值也可以是一个对象。在这种情况下,对象被传递给fetchRelated作为选项参数。
		autoFetch独立于其他“诱惑”操作
	collectionTyperelation
		string/backbone.collection type
		定义hasmany情况下的，属性的 collection类型。
	collectionKey
		string/boolean 默认true
		当关系为hasMany，时，子collection，可能有一个到当前model的引用，那个这个引用属性名就是 collectionKey
		如果为true,则默认为引用为默认key
		如果为false，则collection不会创建这个引用。
		如果为string，则使用collectionKey做为引用
	coolectionOptions
		hash/function
		当关系为hasmany时，子collection初始化时 传递给collection的参数
	createModels
		boolean
		指定是否从嵌套对象创建模型
	keySource
		string
		当根据string来反序列化生成关联model时，根据什么属性做为数据
	keySource
		string
		当根据string来反序列化生成关联model时，根据什么属性做为数据
	keyDestination
		string
		相关模型 序列化到 主模型的什么属性。
	parse
		boolean  默认false
	reverseRelation
		--
五。subModelTypes属性
	object
	大概意思 就是 可以指定model，同时有哪些子属性，但是不是相关的model的属性
	subModelTypeAttribute
	
	
六。事件。
	这里的事件都是双向的。
	1.add ：add:<key> →function(addedModel<Backbone.Model>, related<Backbone.Collection>)
		例如：  ourHouse.on('add:occupants', function (model, coll) {})
			add 是对 many那一方的监听。
	2.remove：remove:<key> →function(removedModel<Backbone.Model>, related<Backbone.Collection>)
	由于事件是双向的，那么在many那段的model设置 one，也会触发one那段的事件
	
	3.change :change:<key> →function(model<Backbone.Model>, related<Backbone.Model|Backbone.Collection>)
	
	add-remove只在 多的那方，存在add，remove时有效，
	一对一的关联更改只触发change
	如果是方向导致的change，则不会触发 顶部的change事件
		
		
	


