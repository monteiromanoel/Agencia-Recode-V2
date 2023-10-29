function exibirResultadoPesquisa() {
	var divResultado = document.getElementById("resultadoPesquisa");
	divResultado.style.display = "block";
}

let mainImg = document.getElementById("mainImage");
let smallImg = document.getElementsByClassName("small-img");

smallImg[0].onclick = function() {
	mainImg.src = smallImg[0].src;
};

smallImg[1].onclick = function() {
	mainImg.src = smallImg[1].src;
};

smallImg[2].onclick = function() {
	mainImg.src = smallImg[2].src;
};

smallImg[3].onclick = function() {
	mainImg.src = smallImg[3].src;
};

