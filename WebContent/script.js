function writeSave(){
	
	var wform = document.writeform;
	
	if(wform.writer.value==""){
		alert("�̸��� �Է��ϼ���");
		wform.writer.focus();
		return false;
	}
	if(wform.subject.value==""){
		alert("������ �Է��ϼ���");
		wform.subject.focus();
		return false;
	}
	if(wform.content.value==""){
		alert("������ �Է��ϼ���");
		wform.content.focus();
		return false;
	}
	if(wform.passwd.value==""){
		alert("��ȣ�� �Է��ϼ���");
		wform.passwd.focus();
		return false;
	}
	
}