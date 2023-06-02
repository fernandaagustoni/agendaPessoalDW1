package controller;

import java.io.IOException;
import java.text.ParseException;
import dao.UserDao;
import dao.TaskDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Task;

@WebServlet("/registrarTarefas")
public class RegistrarTarefasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao udao = new UserDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarTarefasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuarioregister.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		
		Usuario u = new Usuario();
		
		u.setLogin(login);
		u.setSenha(password);
		u.setNome(nome);
		u.setEmail(email);
		
		try {
			udao.cadastrarUsuario(u);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuariodetails.jsp");
		dispatcher.forward(request, response);
		
	}

}
