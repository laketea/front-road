/**
 * 读xml文件
 * 
 * @returns {object.<Document>}
 */
function loadxml() {
	var oXmlDom = XmlDom();
	if (typeof (oXmlDom.load) == 'undefined') {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("POST", "area.xml", true);
		//xmlhttp.setRequestHeader('Content-Type', 'application/xml');
		xmlhttp.send(null);
		oXmlDom = xmlhttp.responseXML;
	} else {
		oXmlDom.load("area.xml");
	}
	return oXmlDom;
}
/**
 * html select 标签类
 * 
 * @param {string}
 *            sId 标签id
 * @param {string}
 *            sName 标签 name
 * @param {string}
 *            sVal 标签值
 * @constructor
 * @returns {HtmlSelect}
 */
function HtmlSelect(sId, sName, sVal) {
	this.id = sId;
	this.name = sName;
	this.val = sVal;
	this.select = this.createSelect_();
}
/**
 * 创建select元素
 * @private
 * @returns {Element} select element
 */
HtmlSelect.prototype.createSelect_ = function() {
	var oSelect = document.createElement("select");
	oSelect.setAttribute("id", this.id);
	oSelect.setAttribute("name", this.name);
	return  oSelect;
};
/**
 * 创建并添加 option 元素
 * 
 * @param {string}
 *            sVal option 元素 value
 * @param {string}
 *            sText option 元素 显示值
 * @returns {Element} option element
 */
HtmlSelect.prototype.addOption = function(sVal, sText) {
	/**
	 * 创建option方法1<br/>
	 * 使用该方法IE6\FF下，默认selected不会出现错位
	 */
	var option = document.createElement("option");
	option.appendChild(document.createTextNode(sText));
	option.setAttribute('value', sVal);
	if (this.val && sVal == this.val) {
		option.setAttribute('selected', 'selected');
	}

	this.select.appendChild(option);

	/**
	 * 创建option方法2<br/>
	 * 使用该方法IE6下，默认selected会出现错位
	 */

//	var option = null;
//	if (this.val && sVal == this.val) {
//		option = new Option(sText, sVal, true, true);
//	} else {
//		option = new Option(sText, sVal, false, false);
//	}
//	try {
//		this.select.add(option, null); // standards compliant
//	} catch (ex) {
//		this.select.add(option); // IE only
//	}
	
	/**
	 * 创建option方法2<br/>
	 * 使用该方法IE6下，默认selected会出现错位
	 */
//	var option = document.createElement("option");
//	option.value = sVal;
//	option.text = sText;
//	if (this.val && sVal == this.val) {
//		option.setAttribute('selected', 'true');
//	}
//	//this.select.appendChild(option);IE6下此时不可用appendChild添加
//	try {
//		this.select.add(option, null); // standards compliant
//	} catch (ex) {
//		this.select.add(option); // IE only
//	}
};
/**
 * 清除 select 元素下所有的 option 元素
 * 
 */
HtmlSelect.prototype.cleanOptions = function() {
	if (this.select && this.select.options.length != 0) {
		for ( var i = this.select.options.length - 1; i >= 0; i--) {
			this.select.remove(this.select.options[i]);
		}
	}
};

/**
 * 显示select标签在页面中
 * 
 * @param {string}
 *            offset select元素父节点id
 */
HtmlSelect.prototype.showHtml = function(offset) {
	var op = document.getElementById(offset);
	op.appendChild(this.select);
};
/**
 * 省市地区联动菜单类
 * 
 * @param {string}
 *            sOffset 位置
 * @param {string}
 *            sName 菜单名
 * @param {string}
 *            sVal 菜单值
 * @constructor
 * @returns {ProvinceAndCityLink}
 */
function ProvinceAndCityLink(sOffset, sName, sVal) {
	this.xml = loadxml();
	this.offset = sOffset;
	this.id = "id_" + (new Date()).getTime();
	this.name = sName;
	this.val = sVal;
	/**
	 * @type {HtmlSelect}
	 */
	this.htmlSelect = new HtmlSelect(this.id, this.name, this.val);
}
/**
 * 初始化数据并显示在页面指定元素中
 * 
 * @param {string}
 *            xPath xPath表达式
 */
ProvinceAndCityLink.prototype.init = function(xPath) {
	var xmlData = this.xml.documentElement.selectNodes(xPath);
	if (!this.val && xmlData[0]) {// 如果没有默认值，则将第一个元素设置为默认值
		this.val = xmlData[0].getAttribute("name");
		this.htmlSelect.val = this.val;
	}
	for ( var i = 0; i < xmlData.length; i++) {
		this.htmlSelect.addOption(xmlData[i].getAttribute("name"),
				xmlData[i].getAttribute("name"));
	}
	this.htmlSelect.showHtml(this.offset);
};
/**
 * 联动菜单onchange事件
 * 
 * @param {string}
 *            xPath 新数据 xPath 表达式
 * @returns
 */
ProvinceAndCityLink.prototype.change = function(xPath) {
	var oLink = ProvinceAndCityLink["link_" + this.id];// 获取onchange方法的绑定对象
	oLink.htmlSelect.cleanOptions();

	var sXpath = oLink.xPath.replace("&var", this.value);// 替换xPath中的变量部分
	var xmlData = oLink.xml.documentElement.selectNodes(sXpath);
	for ( var i = 0; i < xmlData.length; i++) {
		oLink.htmlSelect.addOption(xmlData[i].getAttribute("name"),
				xmlData[i].getAttribute("name"));
	}

	var oLinkedLink = ProvinceAndCityLink["link_" + oLink.id];// 获取被绑定对象onchange绑定的对象
	if (oLinkedLink) {
		oLinkedLink.htmlSelect.cleanOptions();
		var data = xmlData[0].childNodes;
		for ( var j = 0; j < data.length; j++) {
			if (data[j].nodeType == 1) {// ELEMENT_NODE
				oLinkedLink.htmlSelect.addOption(data[j]
						.getAttribute("name"), data[j].getAttribute("name"));
			}
		}
	}
};
/**
 * 省份下拉对象
 * 
 * @param {string}
 *            sOffset 显示位置
 * @param {string}
 *            sName 变量名
 * @param {string}
 *            sVal 变量值
 * @constructor
 * @extends {ProvinceAndCityLink}
 * @returns {Province}
 */
function Province(sOffset, sName, sVal) {
	ProvinceAndCityLink.call(this, sOffset, sName, sVal);
	this.xPath = "//province";
	this.init(this.xPath);
}
Province.prototype = new ProvinceAndCityLink();

/**
 * 省市联动
 * 
 * @param {City}
 *            oCity 联动市对象
 */
Province.prototype.linkCity = function(oCity) {
	oCity.xPath = "//province[@name='&var']/city";
	ProvinceAndCityLink["link_" + this.id] = oCity;// 指定当前province绑定的city
	this.htmlSelect.select.onchange = this.change;
	if (this.val) {
		var sXpath = oCity.xPath.replace("&var", this.val);
		oCity.init(sXpath);
	}
};
/**
 * 市下拉对象
 * 
 * @param {string}
 *            sOffset 显示位置
 * @param {string}
 *            sName 变量名
 * @param {string}
 *            sVal 变量值
 * @param {boolean|undefined|null}
 *            isInit
 *            <ul>
 *            是否初始数据。默认为false。
 *            <li>如果只是构造单独的市下拉菜单，则需要设置该变量为true</li>
 *            <li>如果是构造联动菜单，则需要将该变量设置为false</li>
 *            </ul>
 * @constructor
 * @extends {ProvinceAndCityLink}
 * @returns {City}
 */
function City(sOffset, sName, sVal, isInit) {
	ProvinceAndCityLink.call(this, sOffset, sName, sVal);
	this.xPath = "//city";
	if (isInit) {
		this.init(this.xPath);
	}
}
City.prototype = new ProvinceAndCityLink();
/**
 * 市区联动
 * 
 * @param {Area}
 *            oArea 区对象
 */
City.prototype.linkArea = function(oArea) {
	oArea.xPath = "//city[@name='&var']/country";
	ProvinceAndCityLink["link_" + this.id] = oArea;// // 指定当前city绑定的area
	this.htmlSelect.select.onchange = this.change;
	if (this.val) {
		oArea.htmlSelect.cleanOptions();
		var sXpath = oArea.xPath.replace("&var", this.val);
		oArea.init(sXpath);
	}
};
/**
 * 地区下拉对象
 * 
 * @param {string}
 *            sOffset 显示位置
 * @param {string}
 *            sName 变量名
 * @param {string}
 *            sVal 变量值
 * @param {boolean|undefined|null}
 *            isInit
 *            <ul>
 *            是否初始数据。默认为false。
 *            <li>如果只是构造单独地区下拉菜单，则需要设置该变量为true</li>
 *            <li>如果是构造联动菜单，则需要将该变量设置为false</li>
 *            </ul>
 * @constructor
 * @extends {ProvinceAndCityLink}
 * @returns {Area}
 */
function Area(sOffset, sName, sVal, isInit) {
	ProvinceAndCityLink.call(this, sOffset, sName, sVal);
	this.xPath = "//country";
	if (isInit) {
		this.init(this.xPath);
	}
}
Area.prototype = new ProvinceAndCityLink();
