<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
      <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body">
          <div class="row">
            <div class="col-12 col-sm-6">
            <c:set var="prod" value="${buyer.prodVoList[0]}"/>
              <h3 class="d-inline-block d-sm-none">${prod.prodName}</h3>
              <div class="col-12">
              	<c:if test="${prod.fgvo.fileDetailVoList==null}">
                	<img src="/resources/images/noimage.jpg" class="product-image" alt="Product Image">
              	</c:if>
              	<c:if test="${prod.fgvo.fileDetailVoList!=null}">
                	<img src="${prod.fgvo.fileDetailVoList[0].fileSaveLocate}" class="product-image" alt="Product Image">
              	</c:if>
              </div>
              <div class="col-12 product-image-thumbs">
              	<c:forEach var="img" items="${prod.fgvo.fileDetailVoList}">
                <div class="product-image-thumb" ><img src="${img.fileSaveLocate}" alt="Product Image" style="width: 100px"></div>
              	</c:forEach>
              	
              </div>
            </div>
            <div class="col-12 col-sm-6">
              <h3 class="my-3">${prod.prodName}</h3>
              <p>${buyer.buyerName}</p>

              <hr>
              ${prod.prodOutline}
<!--               <h4>Available Colors</h4> -->
<!--               <div class="btn-group btn-group-toggle" data-toggle="buttons"> -->
<!--                 <label class="btn btn-default text-center active"> -->
<!--                   <input type="radio" name="color_option" id="color_option_a1" autocomplete="off" checked> -->
<!--                   Green -->
<!--                   <br> -->
<!--                   <i class="fas fa-circle fa-2x text-green"></i> -->
<!--                 </label> -->
<!--                 <label class="btn btn-default text-center"> -->
<!--                   <input type="radio" name="color_option" id="color_option_a2" autocomplete="off"> -->
<!--                   Blue -->
<!--                   <br> -->
<!--                   <i class="fas fa-circle fa-2x text-blue"></i> -->
<!--                 </label> -->
<!--                 <label class="btn btn-default text-center"> -->
<!--                   <input type="radio" name="color_option" id="color_option_a3" autocomplete="off"> -->
<!--                   Purple -->
<!--                   <br> -->
<!--                   <i class="fas fa-circle fa-2x text-purple"></i> -->
<!--                 </label> -->
<!--                 <label class="btn btn-default text-center"> -->
<!--                   <input type="radio" name="color_option" id="color_option_a4" autocomplete="off"> -->
<!--                   Red -->
<!--                   <br> -->
<!--                   <i class="fas fa-circle fa-2x text-red"></i> -->
<!--                 </label> -->
<!--                 <label class="btn btn-default text-center"> -->
<!--                   <input type="radio" name="color_option" id="color_option_a5" autocomplete="off"> -->
<!--                   Orange -->
<!--                   <br> -->
<!--                   <i class="fas fa-circle fa-2x text-orange"></i> -->
<!--                 </label> -->
<!--               </div> -->

<!--               <h4 class="mt-3">Size <small>Please select one</small></h4> -->
<!--               <div class="btn-group btn-group-toggle" data-toggle="buttons"> -->
<!--                 <label class="btn btn-default text-center"> -->
<!--                   <input type="radio" name="color_option" id="color_option_b1" autocomplete="off"> -->
<!--                   <span class="text-xl">S</span> -->
<!--                   <br> -->
<!--                   Small -->
<!--                 </label> -->
<!--                 <label class="btn btn-default text-center"> -->
<!--                   <input type="radio" name="color_option" id="color_option_b2" autocomplete="off"> -->
<!--                   <span class="text-xl">M</span> -->
<!--                   <br> -->
<!--                   Medium -->
<!--                 </label> -->
<!--                 <label class="btn btn-default text-center"> -->
<!--                   <input type="radio" name="color_option" id="color_option_b3" autocomplete="off"> -->
<!--                   <span class="text-xl">L</span> -->
<!--                   <br> -->
<!--                   Large -->
<!--                 </label> -->
<!--                 <label class="btn btn-default text-center"> -->
<!--                   <input type="radio" name="color_option" id="color_option_b4" autocomplete="off"> -->
<!--                   <span class="text-xl">XL</span> -->
<!--                   <br> -->
<!--                   Xtra-Large -->
<!--                 </label> -->
<!--               </div> -->

              <div class="bg-gray py-2 px-3 mt-4">
                <h2 class="mb-0">
                  <fmt:formatNumber value="${prod.prodSale}" pattern="#,###" type="number"/> 원
                </h2>
              </div>

<!--               <div class="mt-4"> -->
<!--                 <div class="btn btn-primary btn-lg btn-flat"> -->
<!--                   <i class="fas fa-cart-plus fa-lg mr-2"></i> -->
<!--                   Add to Cart -->
<!--                 </div> -->

<!--                 <div class="btn btn-default btn-lg btn-flat"> -->
<!--                   <i class="fas fa-heart fa-lg mr-2"></i> -->
<!--                   Add to Wishlist -->
<!--                 </div> -->
<!--               </div> -->
			
				<button type="button" class="btn btn-primary btn-flat" onclick="javascript:location.href='/prod/edit?prodId=${prod.prodId}'" >
					수정
				</button>
				
				<button type="button" class="btn btn-danger btn-flat" id="del">
					삭제
				</button>
				<button type="button" onclick="javascript:location.href='/prod/list'" class="btn btn-default btn-lg btn-flat">
					목록으로 돌아가기
				</button>

              <div class="mt-4 product-share">
                <a href="#" class="text-gray">
                  <i class="fab fa-facebook-square fa-2x"></i>
                </a>
                <a href="#" class="text-gray">
                  <i class="fab fa-twitter-square fa-2x"></i>
                </a>
                <a href="#" class="text-gray">
                  <i class="fas fa-envelope-square fa-2x"></i>
                </a>
                <a href="#" class="text-gray">
                  <i class="fas fa-rss-square fa-2x"></i>
                </a>
              </div>

            </div>
          </div>
          <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">Description</a>
                <a class="nav-item nav-link" id="product-comments-tab" data-toggle="tab" href="#product-comments" role="tab" aria-controls="product-comments" aria-selected="false">Comments</a>
                <a class="nav-item nav-link" id="product-rating-tab" data-toggle="tab" href="#product-rating" role="tab" aria-controls="product-rating" aria-selected="false">Rating</a>
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent">
              <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"> 
              	${prod.prodDetail}
              </div>
              <div class="tab-pane fade" id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab"> Vivamus rhoncus nisl sed venenatis luctus. Sed condimentum risus ut tortor feugiat laoreet. Suspendisse potenti. Donec et finibus sem, ut commodo lectus. Cras eget neque dignissim, placerat orci interdum, venenatis odio. Nulla turpis elit, consequat eu eros ac, consectetur fringilla urna. Duis gravida ex pulvinar mauris ornare, eget porttitor enim vulputate. Mauris hendrerit, massa nec aliquam cursus, ex elit euismod lorem, vehicula rhoncus nisl dui sit amet eros. Nulla turpis lorem, dignissim a sapien eget, ultrices venenatis dolor. Curabitur vel turpis at magna elementum hendrerit vel id dui. Curabitur a ex ullamcorper, ornare velit vel, tincidunt ipsum. </div>
              <div class="tab-pane fade" id="product-rating" role="tabpanel" aria-labelledby="product-rating-tab"> Cras ut ipsum ornare, aliquam ipsum non, posuere elit. In hac habitasse platea dictumst. Aenean elementum leo augue, id fermentum risus efficitur vel. Nulla iaculis malesuada scelerisque. Praesent vel ipsum felis. Ut molestie, purus aliquam placerat sollicitudin, mi ligula euismod neque, non bibendum nibh neque et erat. Etiam dignissim aliquam ligula, aliquet feugiat nibh rhoncus ut. Aliquam efficitur lacinia lacinia. Morbi ac molestie lectus, vitae hendrerit nisl. Nullam metus odio, malesuada in vehicula at, consectetur nec justo. Quisque suscipit odio velit, at accumsan urna vestibulum a. Proin dictum, urna ut varius consectetur, sapien justo porta lectus, at mollis nisi orci et nulla. Donec pellentesque tortor vel nisl commodo ullamcorper. Donec varius massa at semper posuere. Integer finibus orci vitae vehicula placerat. </div>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
      
 <script>
  $(document).ready(function() {
    $('.product-image-thumb').on('click', function () {
      var $image_element = $(this).find('img')
      $('.product-image').prop('src', $image_element.attr('src'))
      $('.product-image-thumb.active').removeClass('active')
      $(this).addClass('active')
    })
  })
  
  $('#del').on('click',function(){
	  if(confirm("정말 삭제하시겠습니까?")){
		  location.href="/prod/delete?prodId=${prod.prodId}";
	  }
  })
</script>