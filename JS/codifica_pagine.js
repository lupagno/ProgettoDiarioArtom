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

function togglePers(npag) {
    const idpag = "p" + npag;
    const pagina = document.getElementById(idpag);
    const people = pagina.getElementsByClassName("pers");
    for (let i = 0; i < people.length; i++) {
        if (people[i].style.backgroundColor === "lightseagreen") {
            people[i].style.backgroundColor = "transparent";
        } else {
            people[i].style.backgroundColor = "lightseagreen";
        }
    }
}

function toggleOrg(npag) {
    const idpag = "p" + npag;
    const pagina = document.getElementById(idpag);
    const orgs = pagina.getElementsByClassName("org");
    for (let i = 0; i < orgs.length; i++) {
        if (orgs[i].style.backgroundColor === "lightsalmon") {
            orgs[i].style.backgroundColor = "transparent";
        } else {
            orgs[i].style.backgroundColor = "lightsalmon";
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
    const toUpper = document.getElementsByClassName("toUpper");
    for (let i = 0; i < toUpper.length; i++) {
        toUpper[i].textContent = toUpper[i].textContent.toUpperCase();
    }
    const toLower = document.getElementsByClassName("toLower");
    for (let i = 0; i < toLower.length; i++) {
        toLower[i].textContent = toLower[i].textContent.toLowerCase();
    }
}