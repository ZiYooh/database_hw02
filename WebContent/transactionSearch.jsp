<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter"%>

<%@ page import="transaction.TransactionDAO"%>

<%@ page import="transaction.TransactionDTO"%>

<%@ page import="java.util.ArrayList"%>

<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>

  <head>

    <title>거래 검색 페이지</title>

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

	String transactionDivide = "";


	String search = "";


	if(request.getParameter("transactionDivide") != null) {

		transactionDivide = request.getParameter("transactionDivide");

	}


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

      <form method="get" action="./transactionSearch.jsp" class="form-inline mt-3">

        <select name="transactionDivide" class="form-control mx-1 mt-2">
	
          <option value="transactionNumber">거래번호</option>

          <option value="productID">상품번호</option>

          <option value="price">가격</option>
          
          <option value="date">거래날짜</option>
          
          <option value="customerName">고객</option>

        </select>
	

        <input type="text" name="search" class="form-control mx-1 mt-2" value="<%= search %>" placeholder="내용을 입력하세요.">

        <button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
        
        <a class="btn btn-info ml-1 mt-2" href="transactionSearch.jsp">초기화</a>
        
				
      </form>

<%

	ArrayList<TransactionDTO> transactionList = new ArrayList<TransactionDTO>();

	transactionList = new TransactionDAO().getList(transactionDivide, search);

	if(transactionList != null)

	for(int i = 0; i < transactionList.size(); i++) {

	TransactionDTO transaction = transactionList.get(i);

%>

      <div class="card bg-light mt-3">

        <div class="card-header bg-light">

          <div class="row">

            <div class="col-8 text-left"><%=transaction.getTransactionNumber()%>

            </div>

          </div>

        </div>

        <div class="card-body">

          <h5 class="card-title">

            거래번호: <%=transaction.getTransactionNumber()%>

          </h5>

          <p class="card-text">
          	상품번호: <%=transaction.getProductID()%><br>
          	가격: $<%=transaction.getPrice()%><br>
          	날짜: <%=transaction.getDate()%><br>
          	고객: <%=transaction.getCustomerName()%><br>
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
