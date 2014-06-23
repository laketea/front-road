function XmlDom() {
	if (window.ActiveXObject) {
		try {
			var oXmlDom = new ActiveXObject("Microsoft.XMLDOM");
			oXmlDom.async = false;
			return oXmlDom;

		} catch (oError) {
			oError.reason;
		}
		throw new Error("MSXML is not installed on you system.");
	} else if (document.implementation
			&& document.implementation.createDocument) {

		var oXmlDom = document.implementation.createDocument("", "", null);

		oXmlDom.addEventListener("load", function() {
			this.__changeReadyState__();
		}, false);

		/**
		 * 设置为同步模式，使其在调用 load 方法完成对xml文档的读入后在继续进行其他操作<br/> 如果设置为异步模式，则在使用
		 * oXmlDom 对象前首先判断xml文档是否已经加载完成。<br/> xml文档加载完成的标志是：<br/> 1、在 IE 中
		 * oXmlDom 对象的 readyState 属性等于4时； 2、在 Mozilla 中 oXmlDom 对象的 readyState
		 * 属性等于 'complete' 时;
		 */
		oXmlDom.async = false;

		return oXmlDom;
	} else {
		throw new Error("Your browser doesn't support an XML DOM object.");
	}
}
// Mozilla
if (typeof (Document) != 'undefined') {
	Document.prototype.onreadystatechange = null;
	Document.prototype.__changeReadyState__ = function() {
		if (typeof this.onreadystatechange == 'function') {
			this.onreadystatechange();
		}
	};
	Document.prototype.loadXML = function(sXml) {
		var oParser = new DOMParser();
		var oXmlDom = oParser.parseFromString(sXml, "text/xml");

		while (this.firstChild) {
			this.removeChild(this.firstChild);
		}
		for ( var i = 0; i < oXmlDom.childNodes.length; i++) {
			var oNewNode = this.importNode(oXmlDom.childNodes[i], true);
			this.appendChild(oNewNode);
		}
	};

	// 为节点定义xml获取函数，使其节点可以直接使用方法.xml
	// __defineGetter__方法只在Mozilla中定义
	Node.prototype.__defineGetter__("xml", function() {
		var oSerializer = new XMLSerializer();
		return oSerializer.serializeToString(this, "text/xml");
	});

	/**
	 * 查找匹配XPath表达式的节点（Mozilla实现selectNodes方法；IE自带该方法）
	 * 
	 * @param sXPath
	 *            XPAHT表达式
	 * @return 节点集合数组 Array<Element>
	 */
	Element.prototype.selectNodes = function(sXPath) {
		var oEvaluator = new XPathEvaluator();
		var oResult = oEvaluator.evaluate(sXPath, this, null,
				XPathResult.ORDERED_NODE_ITERATOR_TYPE, null);
		var aNodes = new Array();
		if (oResult != null) {
			var oElement = oResult.iterateNext();
			while (oElement) {
				aNodes.push(oElement);
				oElement = oResult.iterateNext();
			}
		}
		return aNodes;
	};
	/**
	 * 查找第一个匹配XPath表达式的节点（Mozilla实现selectSingleNode方法；IE自带该方法）
	 * 
	 * @param sXPath
	 *            XPAHT表达式
	 * @return 节点元素对象 instanceof Element is true
	 */
	Element.prototype.selectSingleNode = function(sXPath) {
		var oEvaluator = new XPathEvaluator();
		var oResult = oEvaluator.evaluate(sXPath, this, null,
				XPathResult.FIRST_ORDERED_NODE_TYPE, null);
		if (oResult != null) {
			return oResult.singleNodeValue;
		} else {
			return null;
		}
	};
	/**
	 * 统计匹配指定模式的节点个数（该方法仅限于Mozilla）
	 * 
	 * @param sXPath
	 *            XPAHT表达式
	 * @return 返回匹配节点个数。如没有匹配则返回0
	 */
	Element.prototype.count = function(sXPath) {
		var __count = 0;
		sXPath = "count(" + sXPath + ")";
		var oEvaluator = new XPathEvaluator();
		var oResult = oEvaluator.evaluate(sXPath, this, null,
				XPathResult.NUMBER_TYPE, null);
		if (oResult) {
			__count = oResult.numberValue;
		}
		return __count;
	};
	/**
	 * 判断指定XPath表达式是否有匹配节点（该方法仅限于Mozilla）
	 * 
	 * @param sXPath
	 *            XPAHT表达式
	 * @return true|false
	 */
	Element.prototype.isMatch = function(sXPath) {
		var oEvaluator = new XPathEvaluator();
		var oResult = oEvaluator.evaluate(sXPath, this, null,
				XPathResult.BOOLEAN_TYPE, null);
		return oResult.booleanValue;
	};
	// IE 实现的XPath不支持谓语表达式中带有last()|position()
}