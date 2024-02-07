function showErr(npag) {
    const idpag = "p" + npag;
    const pagina = document.getElementById(idpag);
    const words = pagina.getElementsByClassName("error");
    const corrections = pagina.getElementsByClassName("correction");
    for (let i = 0; i < words.length; i++) {
        if (words[i].style.display === "none") {
            words[i].style.display = "inline";
            corrections[i].style.display = "none";
        } else {
            words[i].style.display = "none";
            corrections[i].style.display = "inline";
        }
      }
  }