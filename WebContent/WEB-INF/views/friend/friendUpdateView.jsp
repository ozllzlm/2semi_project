<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자취는 꿀친 글쓰기</title>

<!-- header -->
<%@ include file="/WEB-INF/views/common/menubar.jsp"%>

<!-- 썸머노트 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<!-- 글씨체 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">


<style>
@charset "UTF-8";

.forth_menu {
color: rgb(135, 211, 124);
}
body {
	font-family: 'Noto Sans KR', sans-serif;
}

.container {
	width: 1280px;
	margin: auto;
	margin-bottom: 3%;
}

/* 이미지 영역 */
.imagearea {
	/* 	background-color: gray; */
	margin-top: 5%;
	height: 450px;
	width: 100%;
	display: inline-flex;
}

.image_area {
	border: 1px solid black;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
}

.image_area img {
	width: 100%;
	object-fit: cover;
	justify-content: center;
	align-items: center;
}


#image_area1 {
	float: left;
	height: 450px;
	width: 47%;
}

.files {
	display: none;
}

.subarea {
	margin-left: 3%;
	height: 450px;
	width: 50%;
	flex-wrap: wrap;
	posiion: relative;
}

#image_area2 {
	height: 210px;
	width: 300px;
	float: right;
}

#image_area3 {
	height: 210px;
	width: 300px;
}

#image_area4 {
	height: 210px;
	width: 300px;
	margin-top: 30px;
}

#image_area5 {
	height: 210px;
	width: 300px;
	float: right;
	margin-top: -210px;
}

.container_writer {
	top-margin: 5%;
}

.title {
	width: 1280px;
	margin: auto;
	margin-bottom: 3%;
}

#counter {
	margin-left: 95%;
	font-size: 25px;
	font-style: border;
}

.maintitle {
	border-top: none;
	border-right: none;
	border-left: none;
	border-bottom: 1px solid;
	/* 	border-color: rgb(213, 213, 213);
	border-width: 1px; */
	width: 1280px;
	height: 40px;
	font-size: 30px;
	font-weight: bolder;
	/* color: rgb(116, 116, 116); */
	margin-top: 100px;
}

#locationtext {
	position: flex;
	font-weight: bolder;
	font-size: 20px;
	justify-content: center;
	float: left;
}

#select {
	height: 40px;
	width: 200px; /* 너비설정 */
	border: 1px solid #999; /* 테두리 설정 */
	font-size: 18px;
	margin-left: 150px;
}

#phonetext {
	position: flex;
	font-weight: bolder;
	font-size: 20px;
	margin-top: 40px;
}

#gender {
	position: relative;
	font-weight: bolder;
	font-size: 20px;
	margin-top: 40px;
}

.genderradio {
	position: relative;
	font-weight: bolder;
	font-size: 20px;
	margin-top: -60px;
	margin-left: 185px;
}

#phoneNum {
	position: relative;
	width: 200px;
	height: 40px;
	border: 1px solid #999;
	top: -55px;
	font-size: 18px;
	margin-left: 185px;
}

/* 토글 */
.toggle {
	margin-top: 2%;
	border: 1px solid;
}

.toggle a {
	display: block;
	padding: 15px 22px;
	cursor: pointer;
	width: 100%;
	transition: .4s ease;
	font-weight: bolder;
	font-size: 20px;
}

.toggle a:hover {
	transform: scale(1.01);
}

.toggle a.triggerToggle {
	border: 1px #999;
	color: #333;
	text-decoration: none;
}

.target {
	padding: 1em 2em 2em;
	font-weight: 700;
	box-sizing: border-box;
	display: boeder;
	width: 100%;
	margin: 0 auto;
	color: #333;
}

.textarea {
	font-size: 30px;
	margin-top: 1%;
}

.cancelbutton {
	width: 120px;
	height: 40px;
	margin-top: 3%;
	float: right;
	border: none;
	background-color: rgb(213, 213, 213);
}

.cancelbutton:hover {
	background-color: #FF2424;
	border: none;
}

.cancelbutton:active {
	position: relative;
	top: 1px;
}

.previewbutton {
	width: 120px;
	height: 40px;
	margin-top: 3%;
	border: none;
	background-color: rgb(213, 213, 213);
}

.previewbutton:hover {
	background-color: rgb(135, 211, 124);
	border: none;
}

.previewbutton:active {
	position: relative;
	top: 1px;
}

.enrollbutton {
	width: 120px;
	height: 40px;
	margin-top: 3%;
	float: right;
	border: none;
	background-color: rgb(213, 213, 213);
	margin-left: 1%;
}

.enrollbutton:hover {
	background-color: rgb(135, 211, 124);
	border: none;
}

.enrollbutton:active {
	position: relative;
	top: 1px;
}

.star {
	width: 50px;
}

.toggledown {
	width: 30px;
	float: right;
	margin-top: 10px;
}

.toggleup {
	width: 30px;
	float: right;
	margin-top: 10px;
}
</style>
</head>


<body>

	<form method="post" enctype="multipart/form-data"
		action="${ contextPath }/friend/update">
		<input type="hidden" name="bid" value="${ board.bid }">
		<c:forEach items="${ board.friendPhotoList }" var="photo">
			<input type="hidden" name="changeName" value="${ photo.changeName }">
		</c:forEach>
		<div class="container">

			<br>
			<div class="wirter">

				<!-- 토글 슬라이드 다운 -->
				<!-- 글 작성 방법 -->
				<div class="toggle">
					<a href="#" class="triggerToggle"> <img class="star"
						src="${contextPath}/resources/images/star.png">글 작성 방법 <img
						class="toggledown" src="${contextPath}/resources/images/down.png">
						<img class="toggleup" src="${contextPath}/resources/images/up.png">
					</a>
					<div class="target">
						주의사항
						<ul>
							<li>*는 필수입력입니다</li>
							<li>비속어, 욕설은 금지입니다.</li>
							<li>상대방을 위헙하는 언행이나 기분을 상하게 하는 태도는 하지 않도록 합니다.</li>
							<li>사진에 과도한 노출등 불쾌함을 줄 수있는 사진은 안됩니다.</li>
							<li>명함, 이름표, 학생증등 개인정보가 노출되지 않도록 주의하세요.</li>
						</ul>
					</div>
				</div>

				<!-- 기본 정보 입력 -->
				<div class="toggle">
					<a href="#" class="triggerToggle"> <img class="star"
						src="${contextPath}/resources/images/check.png">기본 정보 입력
					</a>

					<div class="target">
						<p id="locationtext">지역</p>
						<select id="select" name="category">
							<option value="31"
								<c:if test="${ board.cid == 31 }">selected</c:if>>홍대</option>
							<option value="32"
								<c:if test="${ board.cid == 32 }">selected</c:if>>강남</option>
							<option value="33"
								<c:if test="${ board.cid == 33 }">selected</c:if>>종로</option>
							<option value="34"
								<c:if test="${ board.cid == 34 }">selected</c:if>>잠실</option>
							<option value="35"
								<c:if test="${ board.cid == 35 }">selected</c:if>>부천</option>
							<option value="36"
								<c:if test="${ board.cid == 36 }">selected</c:if>>인천</option>
							<option value="37"
								<c:if test="${ board.cid == 37 }">selected</c:if>>전주</option>
							<option value="38"
								<c:if test="${ board.cid == 38 }">selected</c:if>>부산</option>
							<option value="39"
								<c:if test="${ board.cid == 39 }">selected</c:if>>제주도</option>
						</select>

						<p id="gender">성별</p>
						<div class="genderradio">
							<input type="radio" id="female" name="gender" value="F"
								<c:if test="${ board.gender == 'F' }">checked</c:if>> 
							<label for="female">여자</label>&nbsp;&nbsp;
								<input type="radio" id="male" name="gender" value="M"
									<c:if test="${ board.gender == 'M' }">checked</c:if>>
							<label for="male">남자</label>&nbsp;&nbsp;
								<input type="radio" id="male" name="gender" value="N"
									<c:if test="${ board.gender == 'N' }">checked</c:if>>
							<label for="none">비공개</label>
						</div>

					</div>
				</div>

				<!-- 이미지 영역 -->
				<div class="imagearea">
					<!-- 메인 이미지 -->
					<div class="image_area" id="image_area1">
						<img
							src="${ contextPath }${ board.friendPhotoList.get(0).filePath }${ board.friendPhotoList.get(0).changeName }">
					</div>

					<div class="subarea">
						<!-- 서브이미지 -->
						<div class="image_area" id="image_area2" value="서브이미지1">
							<c:if test="${ board.friendPhotoList.size() > 2 }">
								<img
									src="${ contextPath }${ board.friendPhotoList.get(2).filePath }${ board.friendPhotoList.get(2).changeName }">
							</c:if>
						</div>
						<div class="image_area" id="image_area3" value="서브이미지2">
							<c:if test="${ board.friendPhotoList.size() > 1 }">
								<img
									src="${ contextPath }${ board.friendPhotoList.get(1).filePath }${ board.friendPhotoList.get(1).changeName }">
							</c:if>
						</div>
						<div class="image_area" id="image_area4" value="서브이미지3">
							<c:if test="${ board.friendPhotoList.size() > 3 }">
								<img
									src="${ contextPath }${ board.friendPhotoList.get(3).filePath }${ board.friendPhotoList.get(3).changeName }">
							</c:if>
						</div>
						<div class="image_area" id="image_area5" value="서브이미지4">
							<c:if test="${ board.friendPhotoList.size() > 4 }">
								<img
									src="${ contextPath }${ board.friendPhotoList.get(4).filePath }${ board.friendPhotoList.get(4).changeName }">
							</c:if>
						</div>
					</div>
				</div>

				<!-- 파일업로드 -->
				<div class="files">
					<!-- 메인 -->
					<input type="file" name="thumbnail" class="imgUpload" id="thumbnail" accept="image/jpeg,image.png">
					<!-- 서브 -->
					<input type="file" name="contentImg1" class="imgUpload" accept="image/jpeg,image.png">
					<input type="file" name="contentImg2" class="imgUpload" accept="image/jpeg,image.png">
					<input type="file" name="contentImg3" class="imgUpload" accept="image/jpeg,image.png">
					<input type="file" name="contentImg4" class="imgUpload" accept="image/jpeg,image.png">
				</div>
			</div>
		</div>

		<div class="title">
			<input type="text" name="title" class="maintitle"
				value="${ board.btitle }" maxlength="30" required>
			<p>
				<span id="counter">0</span>/30
			</p>

			<textarea id="summernote2" class="textarea" name="content">${ board.bcontent }</textarea>



			<button type="submit" class="enrollbutton">수정하기</button>
			<button type="button" class="cancelbutton">취소</button>
		</div>


	</form>
	<script>
	//toggle slide
	$(".triggerToggle").click(function(){
		console.log($(this));
	      if($(this).next("div").css("display") == "none"){
	         // $("div.triggerToggle").slideUp();
	         // $(this).next("div").slideDown();
	         $(this).next("div").show();
	      } else {
	        //$(this).next("div").slideUp();
	        $(this).next("div").hide();
	      }
	});	

    $(document).ready(function(){
 	   //key up 눌렀을때
        $("input").keyup(function(){
             // 현재 요소의 값의 길이 알기
             let inputLength = $(this).val().length;
             $("#counter").text(inputLength);

             let remain = 30 - inputLength;

             if(remain >= 0)
                 $("#counter").css("color", "black");
             else
                 $("#counter").css("color", "red");
        });       
	});
    

</script>




	<script>
    document.querySelectorAll(".image_area").forEach(item => item.addEventListener('click', fileUploadOpen));
    document.querySelectorAll(".imgUpload").forEach(item => item.addEventListener('change', preview));
   
    function fileUploadOpen(){
        let index = Array.from(document.querySelectorAll(".image_area")).indexOf(this); 
        document.querySelectorAll(".imgUpload")[index].click();
    }

    function preview(){
         if (this.files && this.files[0]) {
            let index = Array.from(document.querySelectorAll(".imgUpload")).indexOf(this); 
            let reader = new FileReader();
            reader.readAsDataURL(this.files[0]);
            reader.onload = function () {
                document.querySelectorAll(".preview")[index].innerHTML = "<img src=" + reader.result + ">";
            }
        }
    }
    
    
</script>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script
		src="<%=request.getContextPath()%>/resources/js/summernote_func.js"></script>
	<script src="${ contextPath }/resources/js/imagePreview.js"></script>
</body>

<!-- footer -->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>