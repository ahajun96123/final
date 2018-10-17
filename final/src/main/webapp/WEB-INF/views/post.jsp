<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HoneyPot</title>
<link rel="shortcut icon" href="resources/img/honeypot.jpg">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link rel="stylesheet" href="css/bootstrap-select.css">
<link rel="stylesheet" href="plugins/summernote.css">
<script src="plugins/summernote.js"></script>
<script src="plugins/lang/summernote-ko-KR.js"></script>


<script type="text/javascript"></script>
</head>
<body>
	<script type="text/javascript">
		var which = "${which}";

		$(document).ready(function() {
			$('#summernote').summernote({
				height : 300,
				minHeight : null,
				maxHeight : null,
				focus : true,
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						for (var i = files.length - 1; i >= 0; i--) {
							sendFile(files[i], this);
						}
					}
				}
			});
		});

		function sendFile(file, el) {
			var form_data = new FormData();
			form_data.append('file', file);
			$
					.ajax({
						data : form_data,
						type : "POST",
						url : 'img',
						cache : false,
						contentType : false,
						enctype : 'multipart/form-data',
						processData : false,
						success : function(url) {
							$(el).summernote('editor.insertImage', url);
							$('#imageBoard > ul')
									.append(
											'<li><img src="'+url+'" width="480" height="auto"/></li>');
						}
					});
		}

		function postForm() {
			if (which == "음식" || which == "영화") {
				var ThumbCheck = document.getElementById("file").value;
				if (ThumbCheck == "" || ThumbCheck == null) {
					alert("썸네일을 선택해주세요.")
				}else{
					$('textarea[name="bContent"]').val(
							$('#summernote').summernote('code'));
					document.getElementById("writeForm").submit();
				}
			} else {
				$('textarea[name="bContent"]').val(
						$('#summernote').summernote('code'));
				document.getElementById("writeForm").submit();
			}
		}
	</script>


	<div class="container">
		<h1>글 작성</h1>
		<form action="write" method="post" id="writeForm"
			enctype="multipart/form-data">
			<input type="hidden" name="mapu" id="mapu" value="">
			<input type="hidden" name="mapk" id="mapk" value="">
			<table class="table table-bordered">
				<c:choose>
					<c:when test="${which eq '음식'}">
						<tr>
							<th>음식종류</th>
							<td><select class="form-control" name="bCategory">
									<option selected value="한식">한식</option>
									<option value="일식">일식</option>
									<option value="중식">중식</option>
									<option value="양식">양식</option>
									<option value="음식기타">기타</option>
							</select></td>
						</tr>
					</c:when>
					<c:when test="${which eq '영화'}">
						<tr>
							<th>영화장르</th>
							<td><select class="form-control" name="bCategory">
									<option selected value="액션">액션</option>
									<option value="모험">모험</option>
									<option value="판타지">판타지</option>
									<option value="SF">SF</option>
									<option value="스릴러">스릴러</option>
									<option value="로맨스">로맨스</option>
									<option value="드라마">드라마</option>
									<option value="가족">가족</option>
									<option value="공포">공포</option>
									<option value="뮤지컬">뮤지컬</option>
									<option value="스포츠">스포츠</option>
									<option value="미스터리">미스터리</option>
									<option value="추리">추리</option>
									<option value="다큐">다큐</option>
									<option value="역사">역사</option>
									<option value="애니메이션">애니메이션</option>
									<option value="영화기타">기타</option>
							</select></td>
						</tr>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="bCategory" value="지름">
					</c:otherwise>
				</c:choose>
				<tr>
					<th>제목</th>
					<td><input type="text" placeholder="제목을 입력하세요."
						name="bSubject" class="form-control" /></td>
				</tr>
				<c:choose>
					<c:when test="${which eq '지름'}">
						<tr>
							<th>URL</th>
							<td><input type="text" placeholder="링크를 입력하세요." name="bUrl"
								class="form-control" /> <input type="hidden"
								value="kantin2.jpg" name="bThumbname"></td>

						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<th>썸네일</th>
							<td><input type="hidden" value="http://" name="bUrl"
								class="form-control" /> <input type="file" id="file"
								class="from-control" name="bThumb"></td>
						</tr>
					</c:otherwise>
				</c:choose>
				<tr>
					<th>내용</th>
					<td><textarea name="bContent" style="display: none;"></textarea>
						<div id="summernote">지역 & 출처 :</div></td>
				</tr>
				<tr>
					<th>태그</th>
					<td><input type="text" placeholder="#태그를 입력하세요." name="bTag"
						class="form-control" value="#" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<div style="margin-right: 10px; float: right">
							<input class="btn btn-warning" value="등록 " type="button"
								onclick="postForm()"> <input type="hidden"
								value="${which}" name="bWhich"> <input type="hidden"
								value="${sessionScope.id }" name="id"> <input
								type="hidden" value="0.0" name="bGrade">
						</div>
						<div style="margin-right: 10px; float: right">
							<input class="btn btn-warning" type="reset" onclick="reset()">
						</div>
						<div style="margin-right: 10px; float: right">
							<a class="btn btn-warning" type="button"
								href="boardList?which=${which }">목록</a>
						</div>
					</td>
				</tr>
			</table>
		</form>
		<c:if test="${which eq '음식'}">
			<%@include file="./map.jsp"%>
		</c:if>
		<div id="imageBoard">	
			<ul>
			</ul>
		</div>
	</div>
</body>
</html>