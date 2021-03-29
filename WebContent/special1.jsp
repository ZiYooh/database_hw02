<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="special_1.Special1DAO"%>

<%@ page import="special_1.Special1DTO"%>

<%@ page import="java.util.ArrayList"%>

<%@ page import="java.net.URLEncoder"%>
    
<!DOCTYPE html>
<html>

  <head>

    <title>특수 검색(1) 페이지</title>

    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- 부트스트랩 CSS 추가하기 -->

    <link rel="stylesheet" href="./css/bootstrap.min.css">

    <!-- 커스텀 CSS 추가하기 -->

    <link rel="stylesheet" href="./css/custom.css">

  </head>

  <body>


    <nav class="navbar navbar-expand-lg navbar-light bg-light">

      <a class="navbar-brand" href="index.jsp">데이터베이스 검색 사이트</a>

      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">

        <span class="navbar-toggler-icon"></span>

      </button>

      <div class="collapse navbar-collapse" id="navbar">

        <ul class="navbar-nav mr-auto">

          <li class="nav-item active">

            <a class="nav-link" href="index.jsp">메인</a>

          </li>

        </ul>


      </div>

    </nav>
	<p style="text-align:center;"><b><font size="6em">여성 구매자가 남성 구매자보다 많은 상품 목록</font></b></p>
    <div class="container">


<%

	ArrayList<Special1DTO> special1List = new ArrayList<Special1DTO>();

	special1List = new Special1DAO().getList();

	if(special1List != null)

	for(int i = 0; i < special1List.size(); i++) {

	Special1DTO special1 = special1List.get(i);

%>

      <div class="card bg-light mt-3">

        <div class="card-header bg-light">

          <div class="row">

            <div class="col-8 text-left"><%=special1.getName()%>
            </div>

          </div>

        </div>

        <div class="card-body">

          <h5 class="card-title">

            상품명: <%=special1.getName()%>

          </h5>

          <p class="card-text">
          	여성 구매자 수: <%=special1.getFemaleCount()%><br>
          	남성 구매자 수: <%=special1.getMaleCount()%><br>
          </p>


        </div>

      </div>

<%

	}

%>

    </div>

    <ul class="pagination justify-content-center mt-3">

      <li class="page-item">


      </li>

      <li class="page-item">

      </li>

    </ul>


    <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">


    </footer>

    <!-- 제이쿼리 자바스크립트 추가하기 -->

    <script src="./js/jquery.min.js"></script>

    <!-- Popper 자바스크립트 추가하기 -->

    <script src="./js/popper.min.js"></script>

    <!-- 부트스트랩 자바스크립트 추가하기 -->

    <script src="./js/bootstrap.min.js"></script>

  </body>

</html>