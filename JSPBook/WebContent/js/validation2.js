/**
 * 
 */

function CheckAddProduct(){
	let form = document.newProduct;
	
	let id = form.productId.value;
	let name = form.pname.value;
	let price = form.unitPrice.value;
	let stock = form.unitsInStock.value;
	
	//JSON
	let data = {
		"productId" : id,
		"pname" : name,
		"unitPrice" : price,
		"unitsInStock" : stock
	}
	
	//상품 아이디 체크. 
	//1) 첫글자는 P.  2) 숫자를 조합하여 5~12자까지 입력 가능
	let regExpId = /^P\d{4,11}$/;
	
	if(!regExpId.test(id)){
		alert("[상품코드]\nP와 숫자를 조합하여 5~12까지 입력하세요");
		form.productId.select();
		return;
	}

	//상품명 체크
	//4~12자까지 입력 가능
	//ex)name.value : 삼성갤럭시S22
	// \s : 스페이스(공백) 또한 포함
	let regExpName = /^[a-zA-Z가-힣0-9ㄱ-ㅎㅏ-ㅣ\s]{4,12}$/;
	if(!regExpName.test(name)){
		alert("[상품명]\n 4~12자이내로 작성해주세요");
		form.pname.select();
		return;
	}

	//상품 가격 체크
	//숫자만 입력 가능
	//ex) unitPrice.value : 1200000
	let regExpPrice = /^[0-9]+$/;
	if(!regExpPrice.test(price)){
		alert("[가격]\n숫자만 입력가능합니다");
		form.unitPrice.select();
		return;
	}

	//재고 수 체크
	//숫자만 입력 가능
	//isNaN : 이거숫자니? 
	let regExpStock = /^[0-9]+$/;
	
	if(!regExpStock.test(stock)){
		alert("[재고 수]\n숫자만 입력 가능합니다");
		form.unitsInStock.select();
		return;
	}
	
	form.submit();
}