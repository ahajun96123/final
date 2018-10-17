<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Write something else you want</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link rel="stylesheet" href="plugins/summernote.css">
<script src="plugins/summernote.js"></script>
<script src="plugins/lang/summernote-ko-KR.js"></script>


<script type="text/javascript">
	
</script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#summernote').summernote({
				height : 300,
				minHeight : null,
				maxHeight : null,
				focus : true,
				toolbar: [
				    // [groupName, [list of button]]
					['style', ['style']],
  					['font', ['bold', 'italic', 'underline', 'clear']],
					['fontname', ['fontname']],
  					['color', ['color']],
  					['para', ['ul', 'ol', 'paragraph']],
  					['height', ['height']],
  					['table', ['table']],
  					['insert', ['link','hr','video']],
  					['view', ['fullscreen', 'codeview']]
				  ],
				callbacks : {
					callbacks : {
						onImageUpload : function(files, editor, welEditable) {
							sendFile(files[0], this);

						}
					}
				}
			});
		});

		function sendFile(file, editor) {
			// 파일 전송을 위한 폼생성
			data = new FormData();
			data.append("uploadFile", file);
			$.ajax({ // ajax를 통해 파일 업로드 처리
				data : data,
				type : "POST",
				url : "./imageUpload.jsp",
				cache : false,
				contentType : false,
				processData : false,
				success : function(data) { // 처리가 성공할 경우
					// 에디터에 이미지 출력
					$(editor).summernote('editor.insertImage', data.url);
				}
			});
		}

		function postForm() {
			$('textarea[name="bContent"]').val(
					$('#summernote').summernote('code'));
		}
	</script>


	<div class="container">
		<h1>글 수정</h1>
		<form action="boardModify" method="post" onsubmit="postForm()">
			<table class="table table-bordered">
				<c:choose>
					<c:when test="${modify.bWhich eq '음식'}">
						<tr>
							<th>음식종류</th>
							<td><select name="bCategory">
									<option value="한식">한식</option>
									<option value="일식">일식</option>
									<option value="중식">중식</option>
									<option value="양식">양식</option>
									<option value="음식기타">기타</option>
							</select></td>
						</tr>
					</c:when>
					<c:when test="${modify.bWhich eq '영화'}">
						<tr>
							<th>영화장르</th>
							<td><select name="bCategory">
									<option value="액션">액션</option>
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
				</c:choose>
				<tr>
					<th>제목</th>
					<td><input type="text" value="${modify.bSubject}"
						name="bSubject" class="form-control" /></td>
				</tr>
				<c:choose>
					<c:when test="${modify.bWhich eq '지름'}">
						<tr>
							<th>URL</th>
							<td><input type="text" placeholder="링크를 입력하세요." name="bUrl"
								class="form-control" /></td>
						</tr>
					</c:when>
					<c:otherwise>
						<input type="hidden" value="http://" name="bUrl"
							class="form-control" />
					</c:otherwise>
				</c:choose>
				<tr>
					<th>내용</th>
					<td><textarea name="bContent" style="display: none;"></textarea>
						<div id="summernote">${modify.bContent}</div></td>
				</tr>
				<tr>
					<th>태그</th>
					<td><input type="text" name="bTag" class="form-control"
						value="${modify.bTag}" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<div style="margin-right: 10px; float: right">
							<input class="btn btn-warning" value="수정 " type="submit">
							<input class="hidden" name="bNum" value="${modify.bNum}">
						</div>
						<div style="margin-right: 10px; float: right">
							<input class="btn btn-warning" type="reset" onclick="reset()">
						</div>
						<div style="margin-right: 10px; float: right">
							<a class="btn btn-warning" type="button" href="history.back()">취소</a>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
