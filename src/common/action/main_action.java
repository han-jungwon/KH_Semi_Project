package common.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class main_action implements action {
    @Override
    public action_forward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        action_forward forward = new action_forward();
        forward.setRedirect(false);

        forward.setPath("WEB-INF/semi_main/semi_main.jsp");
        return forward;
    }
}
