<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
    
<%@ page import="special_2.Special2DAO"%>

<%@ page import="special_2.Special2DTO"%>

<%@ page import="java.util.ArrayList"%>

<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>

  <head>

    <title>특수 검색(2) 페이지</title>

    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- 부트스트랩 CSS 추가하기 -->

    <link rel="stylesheet" href="./css/bootstrap.min.css">

    <!-- 커스텀 CSS 추가하기 -->

    <link rel="stylesheet" href="./css/custom.css">

  </head>

  <body>

<%

	request.setCharacterEncoding("UTF-8");

	String search = "";

	if(request.getParameter("search") != null) {

		search = request.getParameter("search");

	}

%>	

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

    <div class="container">

      <form method="get" action="./special2.jsp" class="form-inline mt-3">
		

      <input type="date" name="search">
      <input type="submit" value="Submit">

      <a class="btn btn-info ml-1 mt-2" href="special2.jsp">초기화</a>
        
		
      </form>

<%
	if(!search.equals("")){
%>	
	<p style="text-align:center;"><b><font size="6em"><%=search %> 이전에 가장 많은 거래가 이루어진 상품들</font></b></p>
<% 
	ArrayList<Special2DTO> special2List = new ArrayList<Special2DTO>();

	special2List = new Special2DAO().getList(search);

	if(special2List != null)

	for(int i = 0; i < special2List.size(); i++) {

	Special2DTO special2 = special2List.get(i);

%>
	
      <div class="card bg-light mt-3">

        <div class="card-header bg-light">

          <div class="row">

            <div class="col-8 text-left"><%=special2.getName()%>

            </div>

          </div>

        </div>

        <div class="card-body">

          <h5 class="card-title">

            상품명: <%=special2.getName()%>

          </h5>

          <p class="card-text">
          	가격: $<%=special2.getPrice()%><br>
          	거래 횟수: <%=special2.getCount()%><br>
          </p>


        </div>

      </div>

<%

		}
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
