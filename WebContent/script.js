//insert, update
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
		alert("��й�ȣ�� �Է��ϼ���");
		wform.passwd.focus();
		return false;
	}
}

//delete
function deleteSave(){
	if(document.delform.passwd.value == ""){
		alert("��й�ȣ�� �Է��ϼ���");
		document.delform.passwd.focus();
		return false;
	}
}

//search
function searchSave(){
	if(document.searchForm.find.value == "0"){
		alert("�˻��׸��� �����ϼ���");
		document.searchForm.find.focus();
		return false;
	}
	if(document.searchForm.keyword.value == ""){
		alert("�˻�� �Է��ϼ���");
		document.searchForm.keyword.focus();
		return false;
	}
}