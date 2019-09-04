package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */

/*
 * 1. Servlet Annotation을 자동으로 생성해준다.
 * 
 * 2. 만약 Servlet Annotation을 사용하지 않고 서블릿을 호출하려면 web.xml파일(dd파일)에 servlet정보를 추가해야한다.
 * 
 * 3. url-pattern을 지정하는 방법 3가지
 * - 1) *.do - url의 마지막이 .do형식으로 끝나면 호출한다. ex) localhost/abc/test.do, localhost/hello.do
 * - 주의사항 : url에 앞에 /를 붙이면 안된다.
 *
 * - 2) /test (exact matching)
 * 
 * - 3) /test/* (wildcard matching)
 * 
 * WebServlet에서도 동일한 방식으로 3가지 방식을 사용 가능하다
 */
@WebServlet("/hey")

public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 응답 MIME타입과 문자 인코딩을 지정한다.
		response.setContentType("text/html;charset=utf-8");
		
		// 클라이언트에게 음답한 출력객체를 생성한다.
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html>\r\n" + 
				"<html lang=\"en\">\r\n" + 
				"\r\n" + 
				"<head>\r\n" + 
				"    <meta charset=\"UTF-8\">\r\n" + 
				"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
				"    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n" + 
				"    <title>Document</title>\r\n" + 
				"    <script src=\"/js/jquery-3.4.1.js\"></script>\r\n" + 
				"    <script>\r\n" + 
				"        $(function () {\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"        });\r\n" + 
				"    </script>\r\n" + 
				"</head>\r\n" + 
				"\r\n" + 
				"<body>\r\n" + 
				"    <input type=\"button\" id=\"btn1\" value=\"효과1\">\r\n" + 
				"\r\n" + 
				"    <style>\r\n" + 
				"        div {\r\n" + 
				"            width: 300px;\r\n" + 
				"            height: 300px;\r\n" + 
				"            background-color: red;\r\n" + 
				"        }\r\n" + 
				"    </style>\r\n" + 
				"    <div id=\"target\">\r\n" + 
				"    </div>\r\n" + 
				"    <script>\r\n" + 
				"        var num = 1;\r\n" + 
				"        $('#btn1').click(function (event) {\r\n" + 
				"            if (num) {\r\n" + 
				"                $('#target').fadeOut();\r\n" + 
				"                num = 0;\r\n" + 
				"            } else {\r\n" + 
				"                $('#target').fadeIn();\r\n" + 
				"                num = 1;\r\n" + 
				"            }\r\n" + 
				"        });\r\n" + 
				"    </script>\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"</body>\r\n" + 
				"\r\n" + 
				"</html>");
		
	}
}
