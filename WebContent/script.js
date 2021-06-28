//insert, update
function writeSave(){
	
	var wform = document.writeform;
	
	if(wform.writer.value==""){
		alert("이름을 입력하세요");
		wform.writer.focus();
		return false;
	}
	if(wform.subject.value==""){
		alert("제목을 입력하세요");
		wform.subject.focus();
		return false;
	}
	if(wform.content.value==""){
		alert("내용을 입력하세요");
		wform.content.focus();
		return false;
	}
	if(wform.passwd.value==""){
		alert("비밀번호를 입력하세요");
		wform.passwd.focus();
		return false;
	}
}

//delete
function deleteSave(){
	if(document.delform.passwd.value == ""){
		alert("비밀번호를 입력하세요");
		document.delform.passwd.focus();
		return false;
	}
}

//search
function searchSave(){
	if(document.searchForm.find.value == "0"){
		alert("검색항목을 선택하세요");
		document.searchForm.find.focus();
		return false;
	}
	if(document.searchForm.keyword.value == ""){
		alert("검색어를 입력하세요");
		document.searchForm.keyword.focus();
		return false;
	}
}