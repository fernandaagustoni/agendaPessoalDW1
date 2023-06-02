package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import java.io.IOException;
import dao.TaskDao;
import dao.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao udao = new UserDao();
	TaskDao tdao = new TaskDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		
		try {
			User u = udao.buscarUsuario(login, password);
			if(u != null) {
				request.getSession().setAttribute("usuario", login);
				ServletContext sc = getServletContext();
				sc.setAttribute("login", login);
				sc.setAttribute("password", password);
				sc.setAttribute("usuario", u);
				
				try {
					tdao.buscarTarefas(u.getId());
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("lista_tarefas", tdao.getTarefasUsuario());
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/tarefas.jsp");
				dispatcher.forward(request, response);
			} 
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

}
