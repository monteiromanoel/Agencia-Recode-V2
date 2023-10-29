package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Viagem;
import model.ViagemDAO;

@WebServlet("/CadastrarDestino")
public class CadastrarDestinoAdmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CadastrarDestinoAdmServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Viagem objViagem = new Viagem();
		
		String destino = request.getParameter("destino");
		objViagem.setDestino(destino);
		
		String localidade = request.getParameter("localidade");
		objViagem.setLocalidade(localidade);
		
		String dataIdaString = request.getParameter("data_ida");
		LocalDate dataIda = LocalDate.parse(dataIdaString);
		objViagem.setData_ida(dataIda);
		
		String dataVoltaString = request.getParameter("data_volta");
		LocalDate dataVolta = LocalDate.parse(dataVoltaString);
		objViagem.setData_volta(dataVolta);
		
		String adicional = request.getParameter("adicional");
		objViagem.setAdicional(adicional);
		
		String tipoPacote = request.getParameter("tipo_pacote");
		objViagem.setTipo_pacote(tipoPacote);
		
		String descricaoCurta = request.getParameter("descricao_curta");
		objViagem.setDescricao_curta(descricaoCurta);
		
		String descricaoLonga = request.getParameter("descricao_longa");
		objViagem.setDescricao_longa(descricaoLonga);
		
		String labelPromo = request.getParameter("label_promocao");
		if (labelPromo == null || labelPromo.isEmpty()) {
			labelPromo = null;
		}
		objViagem.setLabel_promocao(labelPromo);
		
		
		String precoAntigoString = request.getParameter("preco_antigo");
		Pattern pattern = Pattern.compile("\\d+(\\.\\d+)?"); 
		Matcher matcher = pattern.matcher(precoAntigoString);
		if (matcher.find()) {
		    String numeroEncontrado = matcher.group(); 
		    Double precoAntigo = Double.parseDouble(numeroEncontrado);
		    objViagem.setPreco_antigo(precoAntigo);
		} else {
			Double precoAntigo = null;
			objViagem.setPreco_antigo(precoAntigo);
		}
		
		String precoString = request.getParameter("preco");
		Pattern pattern2 = Pattern.compile("\\d+(\\.\\d+)?"); 
		Matcher matcher2 = pattern2.matcher(precoString);
		if (matcher2.find()) {
		    String numeroEncontrado = matcher.group(); 
		    Double preco = Double.parseDouble(numeroEncontrado);
		    objViagem.setPreco(preco);
		} else {
			Double preco = null;
			objViagem.setPreco(preco);
		}
		
		String imagem = request.getParameter("imagem");
		objViagem.setImagem(imagem);
		
		String imagem2 = request.getParameter("imagem2");
		if (imagem2 == null || imagem2.isEmpty()) {
		    imagem2 = null;
		}
		objViagem.setImagem2(imagem2);
		
		String imagem3 = request.getParameter("imagem3");
		if (imagem3 == null || imagem3.isEmpty()) {
		    imagem3 = null;
		}
		objViagem.setImagem3(imagem3);
		
		String imagem4 = request.getParameter("imagem4");
		if (imagem4 == null || imagem4.isEmpty()) {
		    imagem4 = null;
		}
		objViagem.setImagem4(imagem4);
		
		ViagemDAO vDao = new ViagemDAO();
		vDao.salvarViagem(objViagem);
		
		response.sendRedirect("/Agencia-Viagem-V2/ListarDestinos?atualizado=true");
		
	}

}
