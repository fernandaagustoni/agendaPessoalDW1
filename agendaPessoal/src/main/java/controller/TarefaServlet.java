package controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import dao.TaskDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Task;
import model.User;


/**
 * Servlet implementation class UsuarioTarefa
 */
@WebServlet("/tarefas")
public class TarefaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TaskDao tdao = new TaskDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TarefaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = (String) request.getSession().getAttribute("usuario");
		if(usuario != null) {
			ServletContext sc = getServletContext();
			User u = (User) sc.getAttribute("usuario");
			try {
				tdao.buscarTarefas(u.getId());
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("lista_tarefas", tdao.getTarefasUsuario());
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
			int id_tarefa = Integer.parseInt(request.getParameter("id_excluir"));
			
			try {
				tdao.excluirTarefa(id_tarefa);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/tarefadeletada.jsp");
				dispatcher.forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
