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
import model.User;
import model.Task;

@WebServlet("/registrarTarefas")
public class RegistrarTarefasServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    TaskDao tdao = new TaskDao();
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
		String usuario = (String) request.getSession().getAttribute("usuario");
		if(usuario != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/registrartarefas.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = (String) request.getSession().getAttribute("usuario");
		if(usuario != null) {
			String titulo = request.getParameter("titulo");
			String descricao = request.getParameter("descricao");
			String data_criacao = request.getParameter("data_criacao");
			String data_conclusao = request.getParameter("data_conclusao");
			String status = request.getParameter("status");
			
			Task t = new Task();
			t.setTitulo(titulo);
			t.setDescricao(descricao);
			t.setStatus(status);
			
			ServletContext sc = getServletContext();
			User u = (User) sc.getAttribute("usuario");
			t.setU(u);
			
			java.text.DateFormat fmt = new java.text.SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date data_criacaoSQL;
			try {
				data_criacaoSQL = new java.sql.Date(fmt.parse(data_criacao).getTime());
				t.setData_criacao(data_criacaoSQL);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			java.sql.Date data_conclusaoSQL;
			try {
				data_conclusaoSQL = new java.sql.Date(fmt.parse(data_conclusao).getTime());
				t.setData_conclusao(data_conclusaoSQL);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			try {
				tdao.cadastrarTarefa(t);
			}catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			try {
				tdao.buscarTarefas(u.getId());
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("lista_tarefas", tdao.getTarefasUsuario());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/tarefas.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login.jsp");
			dispatcher.forward(request, response);
		}
	}
}
