function toggleDel(npag) {
    const idpag = "p" + npag;
    const pagina = document.getElementById(idpag);
    const deletions = pagina.getElementsByClassName("deleted");
    for (let i = 0; i < deletions.length; i++) {
        if (deletions[i].style.display === "none") {
            deletions[i].style.display = "inline";
        } else {
            deletions[i].style.display = "none";
        }
    }
}

function toggleErr(npag) {
    const idpag = "p" + npag;
    const pagina = document.getElementById(idpag);
    const errors = pagina.getElementsByClassName("error");
    const corrections = pagina.getElementsByClassName("correction");
    for (let i = 0; i < errors.length; i++) {
        if (errors[i].style.display === "none") {
            errors[i].style.display = "inline";
            corrections[i].style.display = "none";
        } else {
            errors[i].style.display = "none";
            corrections[i].style.display = "inline";
        }
    }
}

function toggleAbbr(npag) {
    const idpag = "p" + npag;
    const pagina = document.getElementById(idpag);
    const abbr = pagina.getElementsByClassName("short");
    const expan = pagina.getElementsByClassName("expanded");
    for (let i = 0; i < abbr.length; i++) {
        if (abbr[i].style.display === "none") {
            abbr[i].style.display = "inline";
            expan[i].style.display = "none";
        } else {
            abbr[i].style.display = "none";
            expan[i].style.display = "inline";
        }
    }
}

window.onload = function transpose() {
    const trs01 = document.getElementById("trs01").innerHTML;
    document.getElementById("trs01").innerHTML = document.getElementById("trs02").innerHTML;
    document.getElementById("trs02").innerHTML = trs01;
    const trs03 = document.getElementById("trs03").innerHTML;
    document.getElementById("trs03").innerHTML = document.getElementById("trs04").innerHTML;
    document.getElementById("trs04").innerHTML = trs03;
}