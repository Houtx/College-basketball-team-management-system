package ubtms.basic.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by jinzhany on 2017/2/11.
 */
public class CodingInterceptor implements HandlerInterceptor {

    private List<String> excludedUrls;
    public List<String> getExcludedUrls() {
        return excludedUrls;
    }

    public void setExcludedUrls(List<String> excludedUrls) {
        this.excludedUrls = excludedUrls;
    }
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("preHandle");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

//        String requestUri = request.getRequestURI();
//        for (String url : excludedUrls) {
//            if (requestUri.endsWith(url)) {
//                return true;
//            }
//        }
//
//        //是否登录进行判断
//        Object object = request.getSession().getAttribute("loginUser");
//        if (object == null) {
//            request.getRequestDispatcher("/").forward(request,response);
//            return false;
//        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle");

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("afterCompletion");

    }
}
