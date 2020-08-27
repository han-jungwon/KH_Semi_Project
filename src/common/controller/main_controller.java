package common.controller;

import common.action.action;
import common.action.action_forward;
import common.action.main_action;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.net")
public class main_controller extends HttpServlet {

    public main_controller() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /* 요청된 전체 URL 중에서 포트 번호 다음 부터 마지막 문자열까지 반환된다.
         * 예) http://localhost:8088/JspProject/login.net인 경우
         * "/JspProject/login.net" 반환됩니다.
         * */
        String RequestURI = request.getRequestURI();
        System.out.println("RequestURI = " + RequestURI);

        // getContextPath() : 컨텍스트 경로가 반환됩니다.
        // contextPath는 "/JspProject"가 반환됩니다.
        String contextPath = request.getContextPath();
        System.out.println("contextPath = " + contextPath);

        // RequestURI에서 컨텍스트 경로 길이 값의 인덱스 위치의 문자로부터
        // 마지막 위치 문자까지 추출합니다.
        // command는 "/login.net" 반환됩니다.
        String command = RequestURI.substring(RequestURI.lastIndexOf("/"));
        System.out.println("command = " + command);

        //초기화
        action_forward forward = null;
        action action=null;
        if(command.equals("/main.net")) {
            action = new main_action();
            try {
                forward = action.execute(request,response);
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
        if(forward != null) {
            if(forward.isRedirect()) { //리다이렉트 된다.
                System.out.println("re" + forward.getPath());
                response.sendRedirect(forward.getPath());
            } else { //포워딩된다.
                System.out.println("fo" + forward.getPath());
                RequestDispatcher dispatcher =
                        request.getRequestDispatcher(forward.getPath());
                dispatcher.forward(request, response);
            }
        }
    }
    //get이든 post든 dpProcess메서드를 구현하여 처리하도록 하였음.
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
}
