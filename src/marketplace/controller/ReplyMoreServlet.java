package marketplace.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import marketplace.model.service.MarketplaceService;
import marketplace.model.vo.Reply;
import member.model.vo.Member;

/**
 * Servlet implementation class ReplyMoreServlet
 */
@WebServlet("/marketplace/moreReply")
public class ReplyMoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyMoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		int rwriter= ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Reply reply = new Reply();
		reply.setWriter(rwriter);
		reply.setBid(bid);
		
		// 댓글 insert 후 갱신 된 댓글 리스트 select하여 리턴
		List<Reply> replyList =new MarketplaceService().moreReply(reply);
		
//		System.out.println(replyList);
		
		/* GSON 라이브러리 추가 후 GSON 객체의 toJson 메소드로 처리 */
		response.setContentType("application/json; charset=utf-8");
//		 new Gson().toJson(replyList, response.getWriter());
		/* GSON 사용 시 날짜 값은 Date 포맷에 대한 컨트롤이 필요함 
		 * GsonBuilder 클래스의 setDateFormat 메소드 사용 */
		Gson gson = new GsonBuilder().setDateFormat("yyyy.MM.dd HH:mm:ss").create();
		gson.toJson(replyList,response.getWriter());
	}

}
