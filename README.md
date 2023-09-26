# pick



***
#### git add .
#### git status => 본인들이 추가한거 들어있는지 확인
####
-------------------------------------------------------------------------------------------
####       modified:   .settings/org.eclipse.wst.common.component-> 얘는 아마 없었던걸로 기억 그냥 무시해도 됨
####       modified:   .settings/org.eclipse.wst.common.project.facet.core.xml
####      이런거 있으면 프로젝트에 settings 들어가서 저파일 들어가서 1.8 인거 11로 바꿔주기  
--------------------------------------------------------------------------------------------
####
#### git commit -m "커밋메세지"
#### git pull origin main
#### git push origin 각자 이름
#### --> 만약 push 안되면 
####     git push origin +이름
***

# Project Witch's Pick(Alcohol Recipe)
## Contents

1. Project 목표
2. Project 팀원 및 소개
3. Program 기능 설명
4. Program 개발 환경 및 사용 언어
5. Program 개선 사항
---
## 1. Project 목표
> 일상에서 우리는 끊임없는 스트레스에 직면하며 살아갑니다. 이 스트레스로 지친 우리에게, 샤워 후 한 모금의 술은 마치 스트레스가 일시적으로나마 줄어드는 느낌을 느끼곤 합니다. 이러한 순간을 더 특별하게 만들고자, 저희는 Witch's Pick 프로젝트를 기획하였습니다.
<br><br>
Project Witch's Pick은 단순한 술을 넘어, 다양한 재료의 조합으로 마법을 쓴 것처럼 맛있는 칵테일들을 소개합니다.   
홈페이지에 수록된 다양한 칵테일 레시피는 위스키, 브랜디, 진, 럼, 보드카, 데킬라를 베이스로 분류되어 있으며, 순수한 맛을 즐기는 맥주나 와인은 'Base Alcohol'로 별도 구분하여 분류했습니다. 
또한 사용자들끼리 자신 만의 칵테일레시피를 공유할 수 있도록 '나만의 레시피' 게시판을 구현했으며 마음에 드는 레시피를 저장할 수 있도록 찜 기능도 활성화했습니다.   
칵테일 제조를 위해서는 다양한 재료가 필요한데, 이러한 재료들을 편리하게 구매할 수 있도록 상점 기능도 구현하였습니다.   
Project Witch's Pick에서 만든 프로그램은 사람들에게 이용하기 편리하다고 생각한 기능들을 최대한 구현할 수 있도록 노력했습니다. 저희가 구현한 기능들이 사람들에게 많은 도움을 주었으면 좋겠습니다. 
---
## 2. Project 팀원 및 소개

### 권준오
- 캌테일 종류 및 레시피 보여주기 구현
- mainPage 구현
- (alcohole_review, base_alcohole, recipe, reciped_alcohole, alcohole_category, liked) 테이블 구현 및 사용
### 김다빈
- 프로그램 전체적인 디자인
- 프로젝트 정리 및 ppt 작성
- '나만의 레시피' 게시판 구현
- (board, JJIM) 테이블 구현 및 사용
### 김종민
- 회원정보관리 / 로그인 / 로그아웃 구현
- (member) 테이블 구현 및 사용
### 김태규
- Store 상품 나열 및 상세 상품 보여주기
- (product, product_display, product_review) 테이블 구현 및 사용
### 서승현
- 프로그램 전체적인 디자인
- git 책임자
- MyPage(마음에 든 게시물, 내가 쓴 게시물) 구현
- '나만의 레시피' 게시판 검색 기능 및 댓글 기능 구현
- (member, reply) 테이블 구현 및 사용
### 이동범
- 프로젝트 정리 및 Readme.md 작성
- TopMenu, footer, 주문하기, 상세 주문 내역 구현
- (cart, product_order, product, product_display) 테이블 구현 및 사용
---
## 3. Program 기능 설명

## 1) 회원 정보 관리
### ○ 회원 가입 / 수정 / 탈퇴
- 회원 가입   
-&nbsp;아이디 입력 시 ajax로 실시간 중복 검사 실시   
-&nbsp;위와 동일한 방식으로 닉네임 중복 검사   
-&nbsp;daum에서 제공하는 공개 api로 우편번호 검색   
-&nbsp;allCheck() 함수에서 조건 탐색, 만족 시 '회원가입' 버튼 활성화

<p style="text-align: center;">중복 검사 ajax</p>
<pre>
    $.ajax({
        url: "/member/idCheck",
        type: "post",
        dataType: "json",
        data: {"m_id": inputID},
        success: function(data) {
            ...
            allCheck();
        },
        error: function(data) {
            ...
        }
    });
</pre>

<p style="text-align: center;" id="zipcode">우편번호 검색 Api</p>
<pre>
&lt;script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"/&gt;
&lt;script&gt;
    function daumZipCode() {
        ...
    }
&lt;/script&gt;
</pre>

- 회원 정보 수정   
-&nbsp;기본 양식 입력은 회원 가입과 동일   

- 회원 탈퇴   
-&nbsp;회원 정보 수정 창에서 회원 탈퇴 버튼 클릭 시 데이터베이스에서 회원 삭제

<p style="text-align: center;">회원 탈퇴 시, 회원 관련 정보 모두 삭제(Query)</p>
<pre>
    ALTER table {TABLE}
    ADD CONSTRAINT {FOREIGN KEY_NAME} FOREIGN KEY(m_id) REFERENCES member(m_id)
    ON DELETE CASCADE;
</pre>

### ○ 로그인 / 로그아웃
1.&nbsp;로그인 성공시 해당 회원에게 Session을 부여   
2.&nbsp;로그아웃 시 부여된 Session 회수   
3.&nbsp;카카오, 네이버, 구글 로그인 api로 간편 로그인 화면 출력

<p style="text-align: center;">Session 부여</p>
<pre>
public ModelAndView login(@ModelAttribute("member") MemberDTO member, ...) throws Exception {
    ...
    HttpSession session = request.getSession();
    session.setAttribute("member", memberDTO);
    ...
}
</pre>

<p style="text-align: center;">Session 회수</p>
<pre>
session.invalidate();
</pre>

<p style="text-align: center;">Login Api</p>
<pre>
<p style="text-align: center;">Kakao Api</p>
&lt;script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js" integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"/&gt;
&lt;script&gt;Kakao.init('8ebd75cf75f3f5574a71e06fbbc387a9');&lt;/script&gt;
<hr>
<p style="text-align: center;">Naver Api</p>
&lt;script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"&gt;
<hr>
<p style="text-align: center;">Google Api</p>
&lt;meta name ="google-signin-client_id" content="1020197686297-vdpv23o5pbik0rml0is9e4oqv3jl2j6n.apps.googleusercontent.com"&gt;
&lt;script src="https://apis.google.com/js/platform.js?onload=init" async defer/&gt;
</pre>

### ○ 아이디 / 비밀번호 찾기
1.&nbsp;아이디 찾기
- 휴대폰 번호로 아이디 찾기
> 입력한 이름과 전화번호가 데이터베이스에 존재하면 랜덤으로 생성된 6자리 인증번호를 팝업 창으로 알림    
=> 입력한 인증번호 일치 시 해당 회원의 아이디 출력
- 닉네임으로 아이디 찾기
> 입력한 이름과 닉네임이 데이터베이스에 존재하면 랜덤으로 생성된 6자리 인증번호를 팝업 창으로 알림   
=> 입력한 인증번호 일치 시 해당 회원의 아이디 출력
  
2.&nbsp;비밀번호 찾기
> 입력한 아이디와 전화번호가 데이터베이스에 존재하면 랜덤으로 생성된 6자리 인증번호를 팝업 창으로 알림 <br>
=> 입력한 인증번호 일치 시 해당 회원의 비밀번호 출력

<p style="text-align: center;">인증번호 Random 생성</p>
<pre>
$.ajax({
    url: '...',
    type: '...',
    dataType: 'json',
    data: JSON.stringify({
        ...
    }),
    success: function(data) {
        if (data === 1) {
            confirmCode = Math.floor(Math.random() * 900000) + 100000;
            alert("인증번호는 " + confirmCode + "입니다.");
        } else {
            alert("아이디와 전화번호가 일치하지 않습니다.");
        }
    },
    error: function(error) {
        console.error('Error:', error);
    }
});
</pre>

--- 

## 2) 회원의 게시물 관리
### ○ 마음에 든 게시물 보여주기
1.&nbsp;기본 레시피와 '나만의 레시피'로 분류   
2.&nbsp;레시피를 클릭 시 상세 레시피로 연결

### ○ 내가 쓴 게시물 보여주기
1.&nbsp;내가 쓴 개시물을 찜한 개수를 포함하여 간략히 출력   
2.&nbsp;레시피를 클릭 시 상세 레시피로 연결

---

## 3) 종류에 따른 칵테일이나 술 목록 나열
### ○ 섞지 않은 술 목록
1.&nbsp;선택 상자에서 찾고 싶은 술의 종류를 선택하면 그 종류에 해당하는 술만 출력   
2.&nbsp;검색 창에 정확한 술의 이름을 입력 후 검색하면 그 이름이 들어가는 술을 모두 출력   
>ps) 선택과 검색 중복 가능

3.&nbsp;목록에 있는 물품 클릭 시 상품 상세 페이지로 이동

<p style="text-align: center;">원하는 술 목록 출력</p>
<pre>
// 이전에 선택한 값을 선택 박스 안에 호출
// Controller를 거쳐 조건이 바뀐 페이지에서도 선택 박스에서 조건을 확인 가능
if(selectJong !== "") {
    jong.val(selectJong).change();
}
</pre>
<pre>
&lt;!-- 검색한 술 목록 페이징 --&gt;
&lt;select id="selectbase" parameterType="BaseSoleSearchCriteria" resultType="BaseSoleDTO"&gt;
    &lt;![CDATA[
        select *
        from (...)
        where rwm between (#{page} -1) * #{perPageNum} + 1 and #{perPageNum} * #{page}
    ]]&gt;
    &lt;include refid="base"/&gt;
&lt;/select&gt;
<br>
&lt;!-- 검색한 술의 총 개수 --&gt;
&lt;select id="basecount" parameterType="BaseSoleSearchCriteria" resultType="int"&gt;
    &lt;![CDATA[
        select count(*)
        from base_alcohole
        where 1=1
    ]]&gt;
    &lt;include refid="base"/&gt;
&lt;/select&gt;
<br>
&lt;!-- 검색 조건 --&gt;
&lt;sql id="base"&gt;
    ...
&lt;/sql&gt;
</pre>

### ○ 다양한 종류의 칵테일 목록
1.&nbsp;선택 상자에서 찾고 싶은 조건을 선택하면 그 종류에 해당하는 칵테일만 출력   
2.&nbsp;검색 창에 정확한 칵테일의 이름을 입력 후 검색하면 그 이름이 들어가는 칵테일을 모두 출력   
>ps) 선택과 검색 중복 가능

3.&nbsp;목록에 있는 칵테일을 클릭하면 해당하는 칵테일 레시피와 리뷰 페이지로 이동
> 섞지 않은 술 목록과 같은 방식으로 선택과 검색 실행

### ○ 칵테일 레시피 / 칵테일 리뷰 페이지
1.&nbsp;한 종류의 칵테일 레시피 및 정보 출력   
2.&nbsp;해당 칵테일이 마음에 들면 즐겨찾기 가능  
3.&nbsp;ajax를 이용한 리뷰 탭 페이징 구현   
(버튼을 클릭하여 새로 고침 진행 시 default로 재료 정보 항목이 출력되는 불편함 수정)<br>
4.&nbsp;로그인을 했을 경우에만 즐겨찾기 및 리뷰 작성 가능

<p style="text-align: center;">즐겨찾기 기능</p>
<pre>
&lt;div align="right" class="right"&gt;
    &lt;span class="noliked" id="mark"&gt;★&lt;/span&gt;
&lt;/div&gt;
<br>
&lt;!-- 즐겨찾기 버튼을 클릭했을 경우 --&gt;
&lt;!-- 즐겨찾기 활성화 / 비활성화 --&gt;

    $.ajax({
        url: "...",
        type: "GET",
        dataType: "text",
        data: {"..."},
        success: function() {
            // 활성화
            $("#mark").removeClass("noliked").addClass("liked");

            // 비활성화
            $("#mark").removeClass("liked").addClass("noliked");
        },
        error: function(error) {
            console.error("error : " + error);
            alert("실패");
        }
    });
</pre>

<p id="review" style="text-align: center;">Review Paging</p>
<pre>

    function loadReviews(pageNum) {
        $.ajax({
            url: "...",
            type: "GET",
            dataType: "json",
            data: {"..."},
            success: function (data) {
                // 페이지를 누를때 기존 내용을 지우고 
                $(".ajaxDiv").empty();

                // 새 페이지의 내용을 채움
                $.each(data.reviewList, function (index, review) {
                    var reviewHtml = '...';
                    $(".reviewDiv").append(reviewHtml);
                });
            },
            error: function (xhr, status, error) {
                console.error("AJAX Error:", error);
            }
        });
    }

    loadReviews(${page});

    $(".paging-list").click(function () {
        // 'data-' 속성에서 페이지 번호 가져오기
        var pageNum = $(this).data("page");
        loadReviews(pageNum);
    });
</pre>

<p style="text-align: center;">Need for Login</p>
<pre>
    if("${member.m_id}" == null || "${member.m_id}" == '') {
        alert("로그인하셔야 작성할 수 있습니다.");
        var actionParam = "/sole/soleDetail?recipe_code=" + "${recipe.recipe_code}" + "&page=" + page;
        location.href = "/member/login?action=" + actionParam;
    }
</pre>

### ○ 칵테일 리뷰 작성
1.&nbsp;별점 및 이미지 업로드 기능   
2.&nbsp;욕설 필터 기능   
3.&nbsp;리뷰 작성 후 이전 페이지로 넘어가는 이벤트를 발생시켰을 경우,   
리뷰 작성 페이지로 넘어가지 않고 칵테일 목록 페이지로 이동   


<pre>
<p style="text-align: center;" id="imgUpload">Image UpLoad</p>
    private static final String IMAGE_REPO = "C:\\**";

	// review image 등록
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		
		String image = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			
			MultipartFile mFile = multipartRequest.getFile(fileName);
			
			image = mFile.getOriginalFilename();
			
			File file = new File(IMAGE_REPO + "\\" + "temp" + "\\" + image);
			if(mFile.getSize() != 0) {
                // 파일을 올릴 경로에 파일이 존재하지 않는다면
				if(!file.exists()) {
                    // 경로에 해당하는 디렉토리를 생성한다.
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + image)); 
				}
			}
		}
		return image;
	} 

</pre>

<p style="text-align: center;">욕설 검열 코드</p>

<pre>
// new org.json.JSONArray 사용 준비(pom.xml)
&lt;dependency&gt;
    &lt;groupId&gt;org.json&lt;/groupId&gt;
    &lt;artifactId&gt;json&lt;/artifactId&gt;
    &lt;version&gt;20210307&lt;/version&gt; 
    &lt;!-- JSON 라이브러리 버전 --&gt;
&lt;/dependency&gt;
</pre>

<pre id="badWord">
&lt;%@ page import="org.json.JSONArray" %&gt;
&lt;%@ page import="com.edu.pillter.Yoksul"%&gt;
&lt;%
    // 욕설필터 가져오기
	String [] yokArray = Yoksul.yoksul;
%&gt;
</pre>   

<pre>
// 욕설필터 가져오기
var yok  = &lt;%= new org.json.JSONArray(yokArray).toString() %&gt;;
    
    // 리뷰 쓸 때 내용에 값이 없으면 submit 불가
    $("#reviewSubmit").click(function() {
        var contentValue = $("#reviewContent").val();
        if(!contentValue || contentValue.trim() === "") {
            alert("내용을 작성해야 합니다.");
        } else {
            var content = $("#reviewContent").val();
            for (var i = 0; i < yok.length; i++) {
                if (content.includes(yok[i])) { 
                    alert("비속어는 사용할 수 없습니다.");
                    return;
                }
            }
            $("#reviewForm").submit();
        }
    });
</pre>

<p style="text-align: center;">리뷰 중복 작성 방지 코드</p>
<pre>
// 창이 보여질 때, 캐시를 통한 이동인지 확인 또는 뒤로가기 버튼으로 이동한 건지 확인
    window.onpageshow = function(event) {
    	if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
        	alert("이미 리뷰를 작성하셨습니다.");
        	var backUrl = "/sole/sole?alcohole_category=" + ${category};
        	window.location.href = backUrl;    
        }
    }
</pre>

---

## 4) 나만의 레시피 게시판
### ○ 게시물 나열하기
1.&nbsp;검색 조건에 따른 게시물 출력

<p style="text-align: center;">원하는 레시피 출력</p>
<pre>
    &lt;!-- 게시글 목록 가져오기 (Paging)--&gt;
	&lt;select id="boardListPaging" parameterType="..." resultType="..." resultMap="articlesResult"&gt;
	&lt;![CDATA[
	select * from (
	    select * from (
	        select rownum as recNum, ... ,  jjim_cnt
	        from (
	            select b.board_id, ... , 
	            	(select count(*) from reply where b_id= b.board_id) AS reply_count, (select count(*) from jjim where board_id = b.board_id) as jjim_cnt
	            from board b, member m
	            where b.m_id = m.m_id
	            order by board_id desc)
    ]]&gt;
        &lt;!-- 검색조건이 있는 경우 --&gt;  
        &lt;if test="keyword != null and keyword != ''"&gt;
			WHERE title like '%'||#{keyword}||'%'
		&lt;/if&gt;
	&lt;![CDATA[
		))
	WHERE recNum BETWEEN (#{page} - 1) * #{perPageNum} + 1 AND #{page} * #{perPageNum} 
	]]&gt;
	&lt;/select&gt;
</pre>

### ○ 게시물 상세보기 / 게시물 수정 및 작성하기
1.&nbsp;해당 게시물이 마음에 들면 "찜"하기 가능   
2.&nbsp;댓글 기능   
3.&nbsp;자신이 쓴 글의 수정/삭제 가능   
4.&nbsp;게시글 작성 또는 수정 시 이미지 업로드 가능   
5.&nbsp;'네이버 스마트 에디션 api'을 사용하여 
보다 다양한 스타일의 글꼴로 레시피 수정 및 작성  

<p style="text-align: center;">찜 기능</p>
<pre>
    &lt;!-- 찜 버튼을 클릭했을 경우 --&gt;
    &lt;!-- 찜 활성화 --&gt;
    function jjimOK(){
        $.ajax({
            type: "get",
            url: "/board/jjimOK",
            dataType: "json",
            data: {...},
            success: function(data){
                alert("찜 완료");
                $('.bi').removeClass('bi-heart').addClass('bi-heart-fill');
                location.reload();
            },
            error: function(data){
                alert("오류");
            }
        });
    }

    &lt;!-- 찜 비활성화 --&gt;
    function jjimNO(){
        $.ajax({
            type: "get",
            url: "/board/jjimNO",
            dataType: "json",
            data: {...},
            success: function(data){
                alert("찜 취소");
                $('.bi').removeClass('bi-heart-fill').addClass('bi-heart');
                location.reload();
            },
            error: function(data){
                alert("오류");
            }
        });
    }
</pre>

<pre>
    <p style="text-align: center;"><a href="#imgUpload">Image Upload</a></p>

    // 썸네일
    String fileRealName = thupload(multiRequest);
    // 본문 이미지
    String safeFile = uploadMulti(multiRequest);
    articleMap.put("thumbnail", fileRealName);
    articleMap.put("image", safeFile);

    // 썸네일과 원본 이미지 저장 후 처리할 html
    String	message;
    // 리턴할 응답 객체
    ResponseEntity resEnt = null;

    // 응답 객체를 utf-8형태로 리턴
    HttpHeaders responseHeaders = new HttpHeaders();
    responseHeaders.add("Content-type", "text/html;charset=UTF-8");
    
    try {        
        message	 = "&lt;script&gt;";
        message	+= "alert('새로운 글을 추가하였습니다.');";
        message	+= "location.href='" + multiRequest.getContextPath() + "/board/articleList';";
        message	+= "&lt;/script&gt;";
        resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
    } catch (Exception e) {        
        message	 = "&lt;script&gt;";
        message	+= "alert('오류가 발생하였습니다.\n다시 시도해 주십시오.');";
        message	+= "location.href='" + multiRequest.getContextPath() + "/board/write';";
        message	+= "&lt;/script&gt;";
        resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
        e.printStackTrace();
    }
    
    return resEnt;
</pre>


<pre>
<p style="text-align: center;">Naver SmartEditor Api</p>
    &lt;script src="${path}/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"/&gt;
    &lt;script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"/&gt;

    var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
		fCreator: "createSEditor2",
		htParams: {
			bUseModeChanger: false
		}
	});
</pre>

---

## 5) 상점
### ○ 상품 목록 나열하기
1.&nbsp;광고 배너 구현 (BootStrap 사용)  
2.&nbsp;찾고 싶은 상품의 종류를 선택 시 그 종류에 해당하는 상품 출력   
3.&nbsp;검색 창에 정확한 칵테일의 이름을 입력 후 검색하면 그 이름이 들어가는 칵테일을 모두 출력   
4.&nbsp;낮은 가격, 높은 가격 순으로 상품 나열 가능


<pre>
<p style="text-align: center;">원하는 상품 목록 출력</p>
    // 선택한 종류에 따른 검색 상품 나열
    if (searchKeyword != null && !searchKeyword.isEmpty()) {
        // 검색 작업 수행
        if (category != null && !category.isEmpty()) {
            // 선택한 종류에 따른 검색 작업 수행
            productList = storeService.searchProductByCategoryAndKeyword(category, searchKeyword, select);
        } else {
            productList = storeService.searchProductByKeyword(searchKeyword, select);
        }
    } else {
        // 선택한 종류에 따른 상품 나열 수행
        productList = storeService.listProduct(category, select);
    }

</pre>

<pre>
&lt;!-- 상품 리스트 SQL --&gt;
&lt;sql id="search"&gt;
    &lt;if test="category != null and category != ''"&gt;
        &lt;if test="category == '술'.toString()"&gt;AND CATEGORY_CODE = 1&lt;/if&gt;	
        &lt;if test="category == '음료'.toString()"&gt;AND CATEGORY_CODE = 2&lt;/if&gt;
        &lt;if test="category == '과일'.toString()"&gt;AND CATEGORY_CODE = 3&lt;/if&gt;
        &lt;if test="category == '도구'.toString()"&gt;AND CATEGORY_CODE = 4&lt;/if&gt;
    &lt;/if&gt;
&lt;/sql&gt;

&lt;!-- 가격대 높낮이 순 SQL --&gt;
&lt;sql id="select"&gt;
    &lt;if test="select != null and select != ''"&gt;
        &lt;choose&gt;
            &lt;when test="select == 'def'.toString()"&gt;
                AND 1=1
            &lt;/when&gt;
            &lt;when test="select == 'lowPrice'.toString()"&gt;
                ORDER BY PRODUCT_PRICE
            &lt;/when&gt;
            &lt;when test="select == 'highPrice'.toString()"&gt;
                ORDER BY PRODUCT_PRICE DESC
            &lt;/when&gt;
        &lt;/choose&gt;
    &lt;/if&gt;
&lt;/sql&gt;

&lt;!-- 상품 리스트 SQL --&gt;
&lt;select id="selectAllProductList" resultType="com.edu.store.dto.ProductDTO" parameterType="com.edu.store.dto.ProductDTO"&gt;
    &lt;![CDATA[
        SELECT (...)
        FROM PRODUCT
        WHERE 1=1
    ]]&gt;
    &lt;include refid="search"/&gt;
    &lt;include refid="select"/&gt;
&lt;/select&gt;

&lt;!-- 상품 검색으로 찾기 SQL --&gt;
&lt;select id="searchProductByKeyword" resultType="com.edu.store.dto.ProductDTO" parameterType="com.edu.store.dto.ProductDTO"&gt;
        SELECT (...)
        FROM PRODUCT 
        WHERE PRODUCT_NAME LIKE '%' || #{searchKeyword} || '%'
        &lt;include refid="select"/&gt;
&lt;/select&gt;

</pre>

<pre>
<p style="text-align: center;">Controller에서 Paging 처리</p>
<p style="text-align: center;">jsp</p>
    ...
    &lt;c:forEach begin="1" end="${totalPages}" varStatus="loop"&gt;
        &lt;li class="${loop.index == currentPage ? 'active' : ''}"&gt;
            // 이동한 페이지를 updateURLParamsAndNavigate함수로 전달
            &lt;a href="#" onclick="updateURLParamsAndNavigate('page', ${loop.index}); return false;"&gt;${loop.index}&lt;/a&gt;
        &lt;/li&gt;
    &lt;/c:forEach&gt;
    ...

<p style="text-align: center;">javascript</p>

    // page 파라미터 업데이트
    function updateURLParamsAndNavigate(newParam, newValue) {

        // 현재 파라미터 값을 가져옴
        var urlParams = new URLSearchParams(window.location.search);

        // 'page' 파라미터가 이미 있다면 제거
        if (urlParams.has('page')) {
            urlParams.delete('page');
        }

        // 새로운 파라미터 추가
        urlParams.append(newParam, newValue);

        // 새로운 파라미터가 있는 URL 생성
        var newURL = window.location.pathname + '?' + urlParams.toString();

        // 새로운 URL로 이동
        window.location.href = newURL; 
    }

<p style="text-align: center;">Controller</p>

    // 페이징 관련 처리
    int totalItems = productList.size();
    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
    int startIndex = (page - 1) * itemsPerPage;
    int endIndex = Math.min(startIndex + itemsPerPage, totalItems);

</pre>

### ○ 상세 상품 정보
1.&nbsp;수량에 따른 가격 출력   
2.&nbsp;Modal을 통해 Reiview 작성   
3.&nbsp;Reiview Paging 기능   
4.&nbsp;바로 구매(상품 한 개가 담긴 장바구니를 주문하기 페이지로 이동) / 장바구니에 담기

<pre>
<p style="text-align: center;">수량에 따른 가격</p>

    // 바뀔 때마다 총 금액 보여주기
    $("#quantity").on("change", updateTotal);

    // 총 금액 보여주기
    function updateTotal() {
 	    const priceString = document.getElementById("price").textContent;
 	    const quantity = parseInt(document.getElementById("quantity").value);
 	    
 	    const price = parseInt(priceString.replace(/[^\d]/g, "")); // 쉼표와 숫자 이외의 문자 제거
 	    
 	    const total = price * quantity;
 	    
 	    const formattedTotal = new Intl.NumberFormat("ko-KR").format(total) + "원";
        // value로 값을 설정
 	    document.getElementById("total").value = formattedTotal; 
 	}
</pre>


<pre>
<p style="text-align: center;">Review Writing</p>
<p style="text-align: center;"><a href="#imgUpload">Reiview Image UpLoad</a><br><br><a href="#badWord">욕설 방지 필터</a></p>

    ...
    // 욕설을 "*" 문자로 변환
    for (var i = 0; i < yok.length; i++) {
        if (content.includes(yok[i])) { 
            var pattern = new RegExp(yok[i], 'g');
            reviewHtml = reviewHtml.replace(pattern, "**");
        }
    }
    ...

</pre>

<pre>
    <p style="text-align: center;">Review Paging</p>
    <p style="text-align: center;"><a href="#review">Reiview Paging Ajax</a></p>
</pre>

<pre>
<p style="text-align: center;">바로 구매 / 장바구니 추가</p>

    // 바로 구매
    $('#buyNow').on("click", function(){
        
        if(memberId != 'null'){	
            ...
            // 구매할 상품의 정보를 get방식으로 넘겨 주문 페이지로 이동한다.
            var locate = "/store/addToCart?product_display_id=" + productID +"&quantity=" + count + "&cartOrStore=buyNow&image=" + image + "&name=" + name + "&total=" + total +"&price=" + price;
                
            location.href = locate;
        }else if (memberId == 'null'){
            alert("로그인이 필요한 서비스입니다."); 
            ...
        }
    });

    // 장바구니에 상품 추가
    $("#goToCart").on("click", function(){
        if(memberId != 'null'){
        ...
        // 구매할 상품의 정보를 get방식으로 넘겨 장바구니 페이지로 이동한다.
        var locate = "/store/addToCart?product_display_id=" + param + "&quantity=" + quantity + "&cartOrStore=cart";
        location.href = locate;

        }else if (memberId == 'null'){
            alert("로그인이 필요한 서비스입니다.");
            ...
        }
    });

    // 무작위로 장바구니 번호 부여하기
    public int getCartId() throws Exception {
		int random_id = (int)(Math.random() * 100000);
		List<String> check_cart_id = storeService.checkCartId();
		for(int i = 0; i < check_cart_id.size(); i++) {
			if(random_id == Integer.parseInt(check_cart_id.get(i))) {
				break;
			}
			else {
				random_id = (int)(Math.random() * 100000);
				break;
			}
		}
		return random_id;
	}

    ...
    // 장바구니에 상품 추가하기
    if ("cart".equals(cartOrStore)) {
        return "redirect:/shopping/cart";

    // 상품 바로 구매하기
    }else if("buyNow".equals(cartOrStore)) {	    	
        = "redirect:/shopping/order?cartId=" + cartId + "&imageFile=" + image + "&productName=" + name + "&productPrice=" 
        + priceValue + "&cnt=" + quantity + "&totalPrice=" + totalValue;
        return locate;
    }
    ...
</pre>

---

## 6) 장바구니 / 주문하기
### ○ 장바구니
1.&nbsp;상품 수량 변동될 때마다 데이터베이스 변동   
2.&nbsp;각 상품 수량에 따른 가격 변동   
3.&nbsp;가격 변동에 따른 전체 금액 변동   
4.&nbsp;선택한 상품들의 합만 전체 금액에 산출
5.&nbsp;선택한 상품 삭제    
6.&nbsp;선택한 상품만 주문하기 페이지로 이동
7.&nbsp;주문한 페이지 이동할 때 무작위로 주문번호 부여

<pre>
<p style="text-align: center;">수량 데이터베이스 변동</p>
    // +, - 버튼 클릭 시 수량 변경 / 숫자 직접 입력 시 수량 변경
    // (plus or minus).on("click", function() {
    count.on("input", function() {
        ...
        // 변경된 수량 database에 저장하기
        $.ajax({
            url: "/shopping/countchange",
            type: "get",
            dataType: "json",
            data: {"count": count.val(), "cart_id": ctId.val()},
            success: function(data) {
                console.log("success : " + data);
            }, 
            error: function(data) {
                console.log("error : " + data);
            }
        });
        
        // total_price 갱신
        sum = 0;
        for(var i = 0; i < $(".productName").length; i++) {
            // 넘어갈 값이 disabled 되지 않았을 경우
            if(!$(".pdtPrice:eq(" + i + ")").is(":disabled")){
                sum += parseInt($(".pdtPrice:eq(" + i + ")").val());
            }
            // 넘어갈 값이 disabled 되었을 경우
            else if($(".pdtPrice:eq(" + i + ")").is(":disabled")) {
                sum += 0;
            }
        }
        total_price.prop("value", sum);
        tol_price.prop("value", sum);
    });

</pre>

<pre>
<p style="text-align: center;">선택한 상품의 합 보여주기 / 값 전달하기 </p>
    // check 여부에 따른 total_price 변동
    check.on("click", function() {
        // checked true
        if(check.is(":checked")){		
            // 모든 버튼 선택 활성화
            count.attr("disabled", false);
            plus.prop("disabled", false);
            minus.prop("disabled", false);
            
            // 물건 값 넘기기
            $(".pdtName:eq(" + idx + ")").prop("disabled", false);
            $(".imageFile:eq(" + idx + ")").prop("disabled", false);
            count.prop("disabled", false);
            pdtprice.prop("disabled", false);
            
            // total_price 갱신
            sum = 0;
            for(var i = 0; i < $(".productName").length; i++) {
                // 넘어갈 값이 disabled 되지 않았을 경우
                if(!$(".pdtPrice:eq(" + i + ")").is(":disabled")){
                    sum += parseInt($(".pdtPrice:eq(" + i + ")").val());
                }
                // 넘어갈 값이 disabled 되었을 경우
                else if($(".pdtPrice:eq(" + i + ")").is(":disabled")) {
                    sum += 0;
                }
            }
            total_price.prop("value", sum);
            tol_price.prop("value", sum);
        // checked false
        } else if(!check.is(":checked")) {
            // 모든 버튼 선택 불능
            count.attr("disabled", true);
            plus.prop("disabled", true);
            minus.prop("disabled", true);
            
            // 물건 값 넘기지 않기
            $(".pdtName:eq(" + idx + ")").prop("disabled", true);
            $(".imageFile:eq(" + idx + ")").prop("disabled", true);
            count.prop("disabled", true);
            pdtprice.prop("disabled", true);
            
            // total_price 갱신
            sum = 0;
            for(var i = 0; i < $(".productName").length; i++) {
                // 넘어갈 값이 disabled 되지 않았을 경우
                if(!$(".pdtPrice:eq(" + i + ")").is(":disabled")){
                    sum += parseInt($(".pdtPrice:eq(" + i + ")").val());
                }
                // 넘어갈 값이 disabled 되었을 경우
                else if($(".pdtPrice:eq(" + i + ")").is(":disabled")) {
                    sum += 0;
                }
            }
            total_price.prop("value", sum);
            tol_price.prop("value", sum);
        }
    });
    
</pre>

<pre>
<p style="text-align: center;">선택한 상품 삭제</p>
    // 삭제 버튼 클릭 시 선택 물품 삭제
	$("#cancel").on("click", function() {
		let frm = $(".check").closest("form");
		for(let i = 0; i < (".check").length; i++) {
			if(!$(".check:eq(" + i + ")").is(":checked")) {
				$(".ctId:eq(" + i + ")").prop("disabled", true);
			}
		}
		frm.prop("action", "/shopping/deleteCart");
		frm.prop("method", "get");
		frm.submit();
	});

</pre>

<pre>
<p style="text-align: center;" id="orderNum">무작위로 주문 번호 생성</p>
    // get orderNumber
	public int getOrderNum(String m_id) throws Exception {
		int order = (int)(Math.random() * 10000);
		List<String> check_order = shoppingService.checkOrderNum(m_id);
		for(int i = 0; i < check_order.size(); i++) {
			if(order == Integer.parseInt(check_order.get(i))) {
				break;
			}
			else {
				order = (int)(Math.random() * 10000);
				break;
			}
		}
		return order;
	}

</pre>

### ○ 주문하기
1.&nbsp;daum에서 제공하는 공개 api로 배송지 우편번호 검색   
2.&nbsp;결제 진행 시, 'KG이니시스 api'를 사용해서 결제 진행   
3.&nbsp;결제 완료 시, 주문 목록에 구매한 상품들에게 무작위 주문 아이디를 생성하여 삽입 후, 장바구니에서 구매한 상품들만 삭제

<pre>
    <p style="text-align: center;">우편번호 검색</p>
    <p style="text-align: center;"><a href="#zipcode">우편번호 검색 Api</a></p>
</pre>

<pre>
<p style="text-align: center;">전자 결제 API</p>
    var IMP = window.IMP; // 생략 가능
    IMP.init({"IMP 키"});

    function requestPay() {
        // IMP.request_pay(param, callback) //결제창 호출
        IMP.request_pay({                   // param
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: ${order_number},
            name: "주문 진행",
            amount: document.getElementById("fnPrice").value,
            buyer_email: "${member.m_id}",
            buyer_name: document.getElementById("name").value,
            buyer_tel: document.getElementById("phone").value,
            buyer_addr: document.getElementById("address").value + ", " + document.getElementById("address_detail").value,
            buyer_postcode: document.getElementById("zipcode")
        }, function (rsp) { // callback
            if (rsp.success) {
                // 결제 성공 시 로직
                document.getElementById("orderConfirm").submit();
            } else {
                // 결제 실패 시 로직
                alert("payment Refuse");
            }
        });
    }
</pre>

<pre>
<p style="text-align: center;">무작위로 주문 아이디 생성</p>
    // Random String
	static public String getRandomString(int length) {
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
		
		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0".split(",");
		
		for (int i = 0; i < length; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
		}
		return buffer.toString();
	}
	// get orderId
	public String getOrderId() throws Exception {
		String order = getRandomString(8);
		List<String> check_order = shoppingService.checkOrderId();
		for(int i = 0; i < check_order.size(); i++) {
			if(order == check_order.get(i)) {
				break;
			}
			else {
				order = getRandomString(8);
				break;
			}
		}
		return order;
	}

</pre>

---

## 7) 주문 목록 / 상세 주문 내역
### ○ 주문 목록
1.&nbsp;화면 상단에는 구매 내역을, 하단에는 취소 및 반품 내역을 출력   
2.&nbsp;주문 처리 상태 메세지를 클릭하면, 배송 완료로 주문 상태 변환   
3.&nbsp;배송이 진행 중일 땐 취소 버튼, 배송이 완료되면 교환/반품 버튼 활성화   
4.&nbsp;취소/반품 버튼을 클릭 시 구매 내역의 물품들은 취소 반품 내역으로 이동하며,
교환 버튼을 클릭 시 같은 주문 정보로 재배송을 진행   
5.&nbsp;취소 내역과 반품 내역은 날짜를 통해 따로 조회 가능

<pre>
<p style="text-align: center;">구매 / 반품 내역 페이징</p>
<p style="text-align: center;">javascript</p>
    // 취소 / 반품 내역 페이징
	function cancelPaging(pageNum) {
    // 구매 내역 페이징
	function orderPaging(pageNum) {
		let start = $("start").val();
		let end = $("end").val();

		$.ajax({
			url: "/shopping/paging",
			type: "get",
			dataType: "json",
			data: {"page" : pageNum, "startDate" : start, "endDate" : end, "relation" : ("order","cancel") },
			success: function(data) {
				
				// 페이지를 누를때 기존 내용으 지우고 새 페이지의 내용을 채움
				// $("#order_product_list").empty();
                $("#cancel_product_list").empty();
				
				var orderedHTML = '';
				for(let idx = 0; idx < data.order.length; idx++){
					orderedHTML = ...;
					
					// $("#order_product_list").append(orderedHTML);
					$("#cancel_product_list").append(orderedHTML);
				}
			},
			error: function(data) {
				console.log("error : " + data);
			}
		});
	}
	orderPaging(${page});
	
	// paging 버튼 클릭할 때마다 data-page에 지정된 값으로 페이지 넘기기
	$(".orderPaging", ".cancelPaging").on("click", function() {
		var pageNum = $(this).data("page");
		orderPaging(pageNum);
	});
	
	// 조회 버튼을 클릭했을 경우
	$("#searchBuy", "#searchCancel").on("click", function() {
		var pageNum = 1;
		orderPaging(pageNum);
	});

</pre>

<pre>
<p style="text-align: center;">Controller</p>

    ...
    // 주문 or 취소 목록
    List<OrderDTO> list = new ArrayList<OrderDTO>();

    if(rel.equals("order")) {
        paging.setCri(search);
        // cri를 가지고 검색한 총 건수를 TotalCount 변수에 저장한다.
        paging.setTotalCount(shoppingService.orderListTotalCount(searchMap));
        
        list = shoppingService.showOrder(searchMap);
    }
    else if(rel.equals("cancel")) {
        paging.setCri(search);
        // cri를 가지고 검색한 총 건수를 TotalCount 변수에 저장한다.
        paging.setTotalCount(shoppingService.cancelListTotalCount(searchMap));
        
        list = shoppingService.showCancel(searchMap);
    }
    ...

</pre>

<pre>
<p style="text-align: center;">상품 취소, 환불, 교환</p>

    ...
    String order_status = new String();
    if(title.equals("Cancel Progressing")) {
        log.info(id + " 주문의 취소 이유는 : " + c_reason);
        order_status = "delivery-refuse(cancel)";
    } else if(title.equals("Refund Progressing")) {
        log.info(id + " 주문의 환불 이유는 : " + c_reason);
        order_status = "product refund";
    } else if(title.equals("Change Progressing")) {
        log.info(id + " 주문의 교환 이유는 : " + c_reason);
        order_status = "product change";
        
        // 같은 물품으로 새 제품 배송 진행
        OrderDTO ordertemp = shoppingService.changeProduct(id);

        // 주문 번호 부여하기
        int order_num = getOrderNum(member.getM_id());
        // 무작위 8자리 주문 아이디 부여하기
        String order_id = getOrderId();
        ordertemp.setOrder_number(order_num);
        ordertemp.setOrder_id(order_id);
        ordertemp.setOrder_status("delivery-progressing");
        log.info("재배송할 상품 : " + ordertemp);
        
        // 같은 물품으로 새 제품 배송 진행
		shoppingService.reDeliveryProduct(ordertemp);
    }
    ...

<a href="#orderNum"># 주문 번호 부여하기</a>

</pre>

### ○ 상세 주문 내역
1.&nbsp;해당 주문 번호에 해당하는 주문자 정보와 상품들을 보여준다.

---

## 4. Program 개발 환경 및 사용 언어
#### ● 개발 환경
<div>
    <img src="./vscode.png" height="70px">
    <img src="./eclipse.png" height="70px">
    <img src="./spring.png" height="70px">
    <img src="./ajax.jpg" height="70px">
</div>

#### ● 저장소
<div>
    <img src="./git.png" height="70px">
    <img src="./github.png" height="70px">
    <img src="./amazon.png" height="70px">
    <img src="./oracledatabase.jpg" height="70px">
</div>

#### ● 사용 언어
<div>
    <img src="./java.png" height="70px">
    <img src="./jsp.png" height="70px">
    <img src="./html.png" height="70px">
    <img src="./css.png" height="70px">
    <img src="./javascript.png" height="70px">
    <img src="./bootstrap.png" height="70px">
    <img src="./jquery.png" height="70px">
</div>

## 5. Program 개선 사항
### 권준오
- 리뷰 쓰고 난 후 상세 페이지에서 뒤로 가기 버튼을 눌렀을 경우,
리뷰 페이지를 거치지 않고 바로 목록 페이지로 넘어가는 기능으로 업데이트   
(현재는 리뷰 작성 페이지를 거쳐서 캐쉬로 확인하여 강제로 목록 페이지로 전송)
- 술 상세 페이지에서 Review를 클릭했을 때 최신 순, 오래된 순 기능 추가
- 관리자 기능 구현
    - 베이스 alcohol, 레시피 alcohol 내용을 기입할 때, 지금과 같이 sql문으로 insert하는 것이 아닌, 관리자가 홈페이지에서 데이터를 입력 가능할 수 있도록 기능 추가
    - 관리자 계정으로만 다른 유저의 리뷰나 게시물을 수정, 삭제하는 권한을 부여해서, 홈페이지 내 부적절한 내용이나 단어를 포함한 게시글이나 악의적으로 반복 작성하는 리뷰를 관리하는 기능 추가
- 술 리뷰 작성 시, 별점 0점 기능 추가
- 술 리뷰 수정 / 삭제 기능 추가
### 김다빈
- 상세 게시물 보기에서 글 수정이 아님에도 불구하고 이미지와 글이 삭제되는 현상 제거
- 글 수정이 아닐 때, 수정 취소, 올리기 버튼 비활성화
- naver smart editor에서 사용 할 수 있는 사진 업로드 기능 활성화
- 다중 이미지 업로드 기능 추가
- 오래된 순, 찜 많은 순 기능 추가
### 김종민
- 아이디를 전화번호로 찾을 경우, 인증번호를 문자로 배송하는 기능 추가
- 비밀번호를 찾을 경우, 인증 번호로 인증 후 새로운 비밀 번호를 랜덤으로 생성해서 이메일로 전송하는 기능 추가
- api로 회원 가입 시, 타 회사에서 가지고 있는 정보 가지고 오는 기능 추가
- 회원 탈퇴 시, 바로 탈퇴가 되는 것이 아닌 7일 후 완전한 회원 탈퇴가 이뤄지는 기능 추가
- 로그인 실패 시, 가지고 있는 action(경로) 초기화 해결   
ex) 현재 http://member/login?action=... 로그인 실패 후 http://member/login 으로 리다이렉트 되는 현상 해결
### 김태규
- 상품 상세 목록에서 상품 목록으로 넘어가기 기능 추가
### 서승현
- 좋아요 페이지, 나만의 레시피에서 찜한 게시글들을 작성자들의 닉네임을 포함하여 가져오는 기능 추가
- 좋아요 페이지, 내가 쓴 게시물 페이징 기능 추가
- '나만의 레시피' 상세 게시글 댓글 textarea 크기 조절 기능 삭제
- '나만의 레시피' 상세 게시글 댓글 페이징 기능 추가
### 이동범
- 장바구니에서 품절된 상품이 있을 경우 품절된 상품들을 모아두는 '품절 내역' 기능 추가
- 구매 내역, 취소/반품 내역이 없을 경우 '상품이 존재하지 않다'는 메세지를 보여주는 기능 추가
- gps api를 활용해서 상품이 도착지에 정상 도착했을 경우 자동으로 '배송 완료' 상태로 전환 기능 추가
- gps api를 활용해서 거리에 따른 배송비 변동 기능 추가
- 물건을 회수하면 '반품 완료', 회수하지 못하면 '반품 진행 중' 상태 추가
- 주문 내역에 물건 검색 기능 추가
- 일정 기간(1년 ~ 2년)이 지날 경우 자동적으로 주문 내역 삭제하는 기능 추가
- 상품 목록을 클릭 시 해당 상품 구매 페이지로 이동하는 기능 추가
- 배송 완료된 상태에는 배송 상태 변경 불가 기능 추가
- 상세 주문 내역에 paging 추가
