package kr.or.ddit.dao;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.vo.ProductVO;

public class ProductRepository {
	// 싱글톤 객체
	private static ProductRepository dao;
	
	public static ProductRepository getInstance() {
		if(dao==null) dao = new ProductRepository();
		return dao;
	}
	
	private List<ProductVO> listOfProducts = new ArrayList<ProductVO>();
	
	// 기본 생성자 3개의 상품 정보를 설정
	private ProductRepository() {
		ProductVO phone = new ProductVO("P1234", "iPhone 15s", 1250000);
		phone.setDescription("iPhone 15 · A16 Bionic 칩 5코어 GPU 탑재 · 첨단 듀얼 카메라 시스템. 48MP 메인 카메라 2배 망원 지원 울트라 와이드 카메라 · 최대 26시간 동영상 재생 ");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.jpg");
		
		ProductVO notebook = new ProductVO("P1235", "LG Gram", 2000000);
		notebook.setDescription("최대 22시간의 배터리 성능이 선사하는 궁극의 프로급 휴대성");
		notebook.setCategory("NoteBook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Old");
		notebook.setFilename("P1235.jpg");
		
		ProductVO tablet = new ProductVO("P1236", "갤럭시 탭 S9 Ultra", 1700000);
		tablet.setDescription("디스플레이 369.9 mm 다이나믹 아몰레드 2X · 내구성 IP68 · 프로세서 스냅드래곤8 2세대");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Refurbished");
		tablet.setFilename("P1236.jpg");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	// ProductVO 객체 타입의 변수 listOfProducts에 저장된 모든 상품 목록을 가져옴
	public List<ProductVO> getAllProducts(){
		return listOfProducts;
	}
	
	// 상품 상세 보기
	// listOfProducts 변수에 저장된 3개 (이상)의 상품 목록 중
	// 선택한 상품의 아이디와 일치하는 상품 정보를 가져옴
	public ProductVO getProductById(String productId) {
		for(ProductVO vo : listOfProducts) {
			String id = vo.getProductId();
			if(id.equals(productId)) {
				return vo;
			}
		}
		return null;
	};
	
	// 상품 등록(무엇을 어디에 추가)
	public void addProduct(ProductVO vo) {
		listOfProducts.add(vo);
	};
}
