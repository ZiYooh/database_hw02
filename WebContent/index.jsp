<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!doctype html>

<html>

  <head>

    <title>데이터베이스 검색 사이트</title>

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

    <div class="container">

      <form method="get" action="./index.jsp" class="form-inline mt-3">

		<a class="btn btn-warning mx-1 mt-2" href="dbuploadfile.jsp">DB 업데이트</a>
		
		<a class="btn btn-danger mx-1 mt-2" href="dbresetcheck.jsp">DB 초기화</a>
		
        <a class="btn btn-primary mx-1 mt-2" href="customerSearch.jsp">고객 검색</a>

        <a class="btn btn-primary mx-1 mt-2" href="transactionSearch.jsp">거래 검색</a>
        
        <a class="btn btn-primary mx-1 mt-2" href="productSearch.jsp">상품 검색</a>
        
        <a class="btn btn-success ml-1 mt-2" href="special1.jsp">특수 검색 (1)</a>
		
		<a class="btn btn-danger ml-1 mt-2" href="special2.jsp">특수 검색 (2)</a>
		
		<a class="btn btn-info ml-1 mt-2" href="special3.jsp">특수 검색 (3)</a>
		
      </form>

    </div>




      <div class="card bg-light mt-3">

        <div class="card-header bg-light">

          <div class="row">

            <div class="col-8 text-left"> <b>특수 검색 목록</b>
            
            </div>

          </div>

        </div>

        <div class="card-body">


          <p class="card-text">
          특수 검색 (1) : 남자보다 여자가 많이 산 상품의 이름<br>
          
          특수 검색 (2) : 주어진 날 이전에 가장 많은 거래(금액기준)가 이루어진 k 가지 상품<br>
          
          특수 검색 (3) : 하나의 supplier에서 m 번 이상의 제품을 산 고객의 이름<br>
          
          
          </p>


          </div>

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
