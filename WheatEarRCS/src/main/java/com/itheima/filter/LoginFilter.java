package com.itheima.filter;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		System.out.println("-------------------LoginFilter lanjie-=----------");
		//1.强转
		HttpServletRequest request=(HttpServletRequest) req;
		HttpServletResponse response=(HttpServletResponse) resp;
		String rootPath = request.getContextPath();
		System.out.println(rootPath);
        String requestUrl = request.getRequestURI();
        Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");

        if(loginUserInfo!=null){
            List<Map<String,Object>> roleList = null;
            if(loginUserInfo.containsKey("roleList")){
                roleList = (List<Map<String,Object>>)loginUserInfo.get("roleList");
                if(roleList == null ||roleList.isEmpty()){
                    request.setAttribute("Msg", "对不起，您无权访问！");
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                    //response.sendRedirect(rootPath+"/index.jsp");
                    return;
                }else{


                    if(requestUrl.contains("home")){

                        for(Map<String,Object> role :roleList) {

                            if("2".equals(role.get("roleType")) ){

                                chain.doFilter(request, response);
                                return;
                            }

                        }
                        request.setAttribute("Msg", "对不起，您无权访问！");
                        //response.sendRedirect(rootPath+"/index.jsp");
                        request.getRequestDispatcher("/index.jsp").forward(request, response);
                        return;
                    }else if(requestUrl.contains("back")){

                        System.out.println("back");

                        for(Map<String,Object> role :roleList) {

                            if("1".equals(role.get("roleType")) ){
                                System.out.println("back"+role.toString());
                                chain.doFilter(request, response);
                                return;

                            }

                        }
                        request.setAttribute("Msg", "对不起，您无权访问！");
                       // response.sendRedirect(rootPath+"/page/login/login-1.jsp");
                        request.getRequestDispatcher("/page/login/login-1.jsp").forward(request, response);
                        return;


                    }
                    chain.doFilter(request, response);


                }

            }else{
                request.setAttribute("Msg", "对不起，您无角色信息，无权访问！");
                System.out.println("用户(无角色信息):"+loginUserInfo.toString());
                //response.sendRedirect(rootPath+"/index.jsp");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }



        }else{
            System.out.println("---!!!!-----无登录信息转login-----------"+request.getRequestURI());
            //request.getRequestDispatcher("../login.jsp").forward(request, response);
            if(requestUrl.contains("home")){
                response.sendRedirect(rootPath+"/page/login/login-2.jsp");
            }else if(requestUrl.contains("back")){
                System.out.println("back");
                response.sendRedirect(rootPath+"/page/login/login-1.jsp");
            }
        }








			chain.doFilter(request, response);
		}
		//chain.doFilter(request, response);
		//response.sendRedirect(rootPath+"/login.jsp");
		
		//
		// pass the request along the filter chain
		


	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
