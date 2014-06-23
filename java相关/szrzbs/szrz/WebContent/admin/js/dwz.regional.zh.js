/**
 * @author ZhangHuihua@msn.com
 */
(function($){
	// jQuery validate
	$.extend($.validator.messages, {
		required: "�����ֶ�",
		remote: "���������ֶ�",
		email: "��������ȷ��ʽ�ĵ����ʼ�",
		url: "������Ϸ�����ַ",
		date: "������Ϸ�������",
		dateISO: "������Ϸ������� (ISO).",
		number: "������Ϸ�������",
		digits: "ֻ����������",
		creditcard: "������Ϸ������ÿ���",
		equalTo: "���ٴ�������ͬ��ֵ",
		accept: "������ӵ�кϷ���׺�����ַ���",
		maxlength: $.validator.format("��������� {0} ���ַ���"),
		minlength: $.validator.format("���������� {0} ���ַ���"),
		rangelength: $.validator.format("���Ƚ��� {0} �� {1} ֮����ַ���"),
		range: $.validator.format("������һ������ {0} �� {1} ֮���ֵ"),
		max: $.validator.format("������һ�����Ϊ {0} ��ֵ"),
		min: $.validator.format("������һ����СΪ {0} ��ֵ"),
		
		alphanumeric: "��ĸ�����֡��»���",
		lettersonly: "��������ĸ",
		phone: "���֡��ո�����"
	});
	
	// DWZ regional
	$.setRegional("datepicker", {
		dayNames: ['��', 'һ', '��', '��', '��', '��', '��'],
		monthNames: ['һ��', '����', '����', '����', '����', '����', '����', '����', '����', 'ʮ��', 'ʮһ��', 'ʮ����']
	});
	$.setRegional("alertMsg", {
		title:{error:"����", info:"��ʾ", warn:"����", correct:"�ɹ�", confirm:"ȷ����ʾ"},
		butMsg:{ok:"ȷ��", yes:"��", no:"��", cancel:"ȡ��"}
	});
})(jQuery);