<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import= "java.io.*" %>
<%@ page import= "java.util.Date" %>
<%@ page import= "java.text.SimpleDateFormat" %>
<%@ page import= "java.sql.Connection" %>
<%@ page import= "java.sql.DriverManager"%>
<%@ page import= "java.sql.SQLException"%>
<%@ page import= "java.sql.Statement"%>

<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!doctype html>

<html>

  <head>

    <title>DB 복원</title>

    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- 부트스트랩 CSS 추가하기 -->

    <link rel="stylesheet" href="./css/bootstrap.min.css">

    <!-- 커스텀 CSS 추가하기 -->

    <link rel="stylesheet" href="./css/custom.css">

  </head>

  <body>
<%
String path0 = request.getRealPath("uploadfile");
BufferedReader br = null;
String line;
String path = path0+"/init.csv";

// Connection object
Connection connection = null;

SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy년 MM월dd일 HH시mm분ss초");
Date time = new Date();
String time1 = format1.format(time);

try{
	// Driver loading
    Class.forName("com.mysql.jdbc.Driver");
    // To avoid timezone error, add "?serverTimezone=UTC"
    String url = "jdbc:mysql://localhost/javabook?serverTimezone=UTC";
    
    connection = DriverManager.getConnection(url, "scott", "tiger");
    System.out.println("Connection Success");
   
    // Create new statement
	Statement statement = connection.createStatement();
	statement.setQueryTimeout(30);

	try {
		statement.executeUpdate("DELETE FROM Customer");
		statement.executeUpdate("DELETE FROM Product");
		statement.executeUpdate("DELETE FROM Transaction");
		System.out.print(time1);
		System.out.println(" Reset Success");
		
		br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "UTF-8"));
		while((line = br.readLine()) != null) {
			String[] temp = line.split(","); // 쉼표로 구분
			if(temp[0].equals("C")) {
				statement.executeUpdate("INSERT INTO Customer VALUES('"+temp[1].trim()+"', '"+temp[2].trim()+"', '"+temp[3].trim()+"', '"+temp[4].trim()+"') ON DUPLICATE KEY UPDATE `name`=VALUES(`name`)");
				System.out.println("C Success");
			}
			
			else if(temp[0].equals("T")) {
				String tempPrice = temp[3];
				String SinputPrice = tempPrice.substring(1);
				double DinputPrice = Double.parseDouble(SinputPrice);
				String[] tempDate = temp[4].split("/");
				String inputDate = tempDate[2] + "-" + tempDate[1] + "-" + tempDate[0].trim();
				statement.executeUpdate("INSERT INTO Transaction VALUES('"+temp[1].trim()+"', '"+temp[2].trim()+"', '"+DinputPrice+"', '"+inputDate+"', '"+temp[5].trim()+"') ON DUPLICATE KEY UPDATE `transactionNumber`=VALUES(`transactionNumber`)");
				System.out.println("T Success");
			}
			
			else if(temp[0].equals("P")) {
				statement.executeUpdate("INSERT INTO Product VALUES('"+temp[1].trim()+"', '"+temp[2].trim()+"', '"+temp[3].trim()+"') ON DUPLICATE KEY UPDATE `productID`=VALUES(`productID`)");
				System.out.println("P Success");
			}
			else {
				System.out.println("No Data");
			}
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.print(time1);
	System.out.println(" Upadte Success");
	
}
catch(ClassNotFoundException e){
    System.out.println("Driver loading fail");
}
catch(SQLException e){
    System.out.println("Error: " + e);
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

      <form method="get" action="./index.jsp" class="form-inline mt-3">

        <a class="btn btn-primary mx-1 mt-2" href="index.jsp">메인으로</a>

      </form>

    </div>
		<p style="text-align:center;"><b><font size="6em">DB 복원 완료!</font></b></p>
	
   

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
