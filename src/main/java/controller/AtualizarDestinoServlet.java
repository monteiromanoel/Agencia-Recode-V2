package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Viagem;
import model.ViagemDAO;

@WebServlet("/AtualizarDestino")
public class AtualizarDestinoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AtualizarDestinoServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idDestinoString = request.getParameter("id");
		int idDestino = Integer.parseInt(idDestinoString);

		Viagem viagemAlterada = new Viagem();
		viagemAlterada.setDestino(request.getParameter("destino"));
		
		String precoString = request.getParameter("preco");
		Pattern pattern2 = Pattern.compile("\\d+(\\.\\d+)?"); 
		Matcher matcher2 = pattern2.matcher(precoString);
		if (matcher2.find()) {
		    String numeroEncontrado = matcher2.group(); 
		    Double preco = Double.parseDouble(numeroEncontrado);
		    viagemAlterada.setPreco(preco);
		} else {
		    viagemAlterada.setPreco(null);
		}
		
		String dataIdaString = request.getParameter("data_ida");
		LocalDate dataIda = LocalDate.parse(dataIdaString);
		viagemAlterada.setData_ida(dataIda);
		String dataVoltaString = request.getParameter("data_volta");
		LocalDate dataVolta = LocalDate.parse(dataVoltaString);
		viagemAlterada.setData_volta(dataVolta);
		
		viagemAlterada.setDescricao_curta(request.getParameter("descricao_curta"));

		viagemAlterada.setAdicional(request.getParameter("adicional"));
		
		String tipoSelecionado = request.getParameter("tipo_pacote");
		viagemAlterada.setTipo_pacote(tipoSelecionado);

		viagemAlterada.setLocalidade(request.getParameter("localidade"));
		
		viagemAlterada.setImagem(request.getParameter("imagem"));
		
		viagemAlterada.setDescricao_longa(request.getParameter("descricao_longa"));

		viagemAlterada.setLabel_promocao(request.getParameter("label_promocao"));
		
		String imagem2 = request.getParameter("imagem2");
		String imagem3 = request.getParameter("imagem3");
		String imagem4 = request.getParameter("imagem4");

		viagemAlterada.setImagem2(imagem2.isEmpty() ? null : imagem2);
		viagemAlterada.setImagem3(imagem3.isEmpty() ? null : imagem3);
		viagemAlterada.setImagem4(imagem4.isEmpty() ? null : imagem4);

		String precoAntigoString = request.getParameter("preco_antigo");

		// Use uma expressão regular para extrair o valor numérico
		Pattern pattern = Pattern.compile("\\d+(\\.\\d+)?"); 
		Matcher matcher = pattern.matcher(precoAntigoString);
		if (matcher.find()) {
		    String numeroEncontrado = matcher.group(); 
		    Double precoAntigo = Double.parseDouble(numeroEncontrado);
		    viagemAlterada.setPreco_antigo(precoAntigo);
		} else {
		    viagemAlterada.setPreco_antigo(null); // Define como null se não houver número encontrado
		}

		viagemAlterada.setId(idDestino);

		ViagemDAO vd = new ViagemDAO();
		vd.atualizarViagem(viagemAlterada);

		response.sendRedirect("/Agencia-Viagem-V2/ListarDestinos?atualizado=true");

	}

}
