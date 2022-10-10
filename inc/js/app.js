let AdminIsActive = false;

changeTheme();
verifyCookie();
verificationSearchButton();
burgerSlider();

if (document.title == "Produit") ProduitPageInit();
else if (document.title == "FAQ") faqPageInit();
else if (document.title == "Produit Admin") {
  ProduitPageInit();
  adminPageInit();
  AdminIsActive = true;
} else if (document.title == "Login") {
  verificationInputLogin();
}
/*******************************Produit******************************************/

//Init de la page prdouit (Ne plus toucher)
function ProduitPageInit() {
  splideCardButton();
  cardButton();
  filter();
}

//Création des event pour les boutton de slider (appel "produitChange()")
function splideCardButton() {
  const sliderButton = document.querySelectorAll(
    ".splide .splide__slide button"
  );

  sliderButton.forEach((item) => {
    item.addEventListener("click", (e) => {
      produitChange(e.currentTarget.value);
    });
  });
}

//S'occupe des animation des card pour les différents produits
function cardButton() {
  const hiddenButtonCard = document.querySelectorAll(
    ".produitCard .openHiddenCard"
  );

  hiddenButtonCard.forEach((item) => {
    item.addEventListener("click", (e) => {
      let hiddenPart =
        e.currentTarget.parentElement.querySelector(".hiddenCard");

      if (!hiddenPart.classList.contains("height"))
        hiddenButtonCard.forEach((item) => {
          item.parentElement
            .querySelector(".hiddenCard")
            .classList.remove("height");
          item.classList.remove("arrowTurn");
          item.parentElement.classList.remove("indexTop");
        });

      hiddenPart.classList.toggle("height");
      item.classList.toggle("arrowTurn");
      item.parentElement.classList.add("indexTop");
    });
  });
  document.addEventListener("click", (event) => {
    let isClickInsideElement = false;

    hiddenButtonCard.forEach((item) => {
      if (!isClickInsideElement)
        isClickInsideElement = item.contains(event.target);
    });
    if (!isClickInsideElement) {
      hiddenButtonCard.forEach((item) => {
        item.parentElement
          .querySelector(".hiddenCard")
          .classList.remove("height");
        item.classList.remove("arrowTurn");
        item.parentElement.classList.remove("indexTop");
      });
    }
  });
}

//Crée le body du fetch pour changer les produits (appel "fetchProduit()")
function produitChange(produit) {
  let fetchBody = {
    action: "fetchProduit",
    produit: produit,
  };
  fetchProduit(fetchBody);
}

//Fait le fetch (envoie la réponse dans fetchResponseCard)
async function fetchProduit(fetchBody) {
  let response = await fetch("index.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(fetchBody),
  });

  fetchResponseCard(response);
}

//Reçoit la réponse du fetch et la traite
//Met la reponse dans la page produit (Reponse : cardTemplate.php)
async function fetchResponseCard(response) {
  containerProduit = document.querySelector(".containerProduit");

  containerProduit.innerHTML = await response.text();
  cardButton();
  filter();
  if (AdminIsActive) cardDeleteButton();
}

//S'occupe de la section filtre et change l'affichage des cards par rapport au filtre
function filter() {
  let filterButton = document.querySelector("#filterButton");
  let form = filterButton.parentElement;
  let allProduit = document.querySelectorAll(".produitCard");

  filterButton.addEventListener("click", () => {
    filterButton.firstElementChild.classList.toggle("filterButtoniconSwitch");

    //Gérer les input et les filtres
    if (
      filterButton.firstElementChild.classList.contains(
        "filterButtoniconSwitch"
      )
    ) {
      let companyInp = form.querySelectorAll(".fournisseur input");
      let priceInp = form.querySelectorAll(".FromPrix input");

      let companyInpValue = [];

      companyInp.forEach((item) => {
        if (item.checked) companyInpValue.push(item.name);
      });

      allProduit.forEach((item) => {
        let hasFilter = false;
        let priceFilterMin = false;
        let priceFilterMax = false;
        let priceFilter = false;
        if (priceInp[0].value.length > 0 && priceInp[0].value >= 0) {
          if (
            parseInt(item.querySelector(".prix").innerHTML.slice(0, -2)) >=
            priceInp[0].value
          ) {
            priceFilterMin = true;
          }
        } else priceFilterMin = true;

        if (priceInp[1].value.length > 0 && priceInp[1].value >= 0) {
          if (
            parseInt(item.querySelector(".prix").innerHTML.slice(0, -2)) <=
            priceInp[1].value
          ) {
            priceFilterMax = true;
          }
        } else priceFilterMax = true;

        if (priceFilterMin && priceFilterMax) {
          priceFilter = true;
        }

        companyInpValue.forEach((filter) => {
          if (item.querySelector(".company").innerHTML == filter) {
            hasFilter = true;
          }
        });

        if (!hasFilter || !priceFilter) item.classList.add("displayNone");
      });
    } else {
      allProduit.forEach((item) => {
        item.classList.remove("displayNone");
      });
    }
  });

  //Restart les filtre on change des input
  let allInputForm = document.querySelectorAll("#form_filter input");

  allInputForm.forEach((item) => {
    item.addEventListener("change", () => {
      filterButton.firstElementChild.classList.remove("filterButtoniconSwitch");

      allProduit.forEach((item) => {
        item.classList.remove("displayNone");
      });
    });
  });
}

/********************************************************************************/
/*******************************admin******************************************/

function adminPageInit() {
  modalAddProduit();
  dynamicFormAdd();
  cardDeleteButton();
  modalUpdate();
}

function modalAddProduit() {
  let modalButtonOpen = document.querySelector(".showAddForm");
  let modalButtonClose = document.querySelector(".closeModalAddProduit");
  let modal = document.querySelector(".modalAddForm");

  modalButtonOpen.addEventListener("click", () => {
    modal.classList.remove("displayNone");
    setTimeout(() => {
      modal.querySelector("div").classList.add("modalSpawn");
    }, 1);
  });

  modalButtonClose.addEventListener("click", () => {
    modal.querySelector("div").classList.remove("modalSpawn");

    setTimeout(() => {
      modal.classList.add("displayNone");
    }, 300);

    document.querySelector(".dynamicForm").innerHTML = "";
    document.querySelectorAll("#choixPieces option").forEach((item) => {
      item.removeAttribute("selected");
    });
    document
      .querySelector("#choixPieces option:first-of-type")
      .setAttribute("selected", true);
    document.querySelector(".errAdd").innerHTML = "";
  });
}

function dynamicFormAdd() {
  let select = document.querySelector("#choixPieces");

  select.addEventListener("change", () => {
    if (select.value != "none") {
      let fetchBody = {
        action: "fetchAdminForm",
        typeProduit: select.value,
      };

      fetchAdminFormDynamic(fetchBody);
    } else {
      document.querySelector(".dynamicForm").innerHTML = "";
    }

    document.querySelector(".errAdd").innerHTML = "";
  });
}

async function fetchAdminFormDynamic(fetchBody) {
  let response = await fetch("index.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(fetchBody),
  });

  fetchResponseFormDynamic(response);
}

async function fetchResponseFormDynamic(response) {
  let dynamicForm = document.querySelector(".dynamicForm");

  dynamicForm.innerHTML = await response.text();

  autoFillFormAdd();
  filterFormAddInput();
  verificationInputAdd();
}

function autoFillFormAdd() {
  let buttons = document.querySelectorAll(".dynamicForm .produitName");
  let buttonLock = document.querySelector(".lockIcones");
  let form = document.querySelector(".dynamicForm");
  let companyButton = document.querySelectorAll(".companyButton");
  let typeButton = document.querySelectorAll(".typeButton");
  let formInputs = document.querySelectorAll(".dynamicForm input");

  buttons.forEach((item) => {
    item.addEventListener("click", () => {
      form.querySelector('input[name="nomPiece"]').value =
        item.querySelector(".nomForm").innerHTML;
      form.querySelector('input[name="prixPiece"]').value =
        item.querySelector(".prixForm").innerHTML;
      form.querySelector(".enStock").innerHTML =
        item.querySelector(".quantiteForm").innerHTML;
      if (item.querySelector(".typeForm").innerHTML != "") {
        form.querySelector('[name="typePiece"]').value =
          item.querySelector(".typeForm").innerHTML;

        if (form.querySelector('select[name="typePiece"]') !== null) {
          form
            .querySelectorAll('select[name="typePiece"] option')
            .forEach((item) => {
              item.removeAttribute("selected");
            });
          form
            .querySelector(
              'select[name="typePiece"] option[value="' +
                item.querySelector(".typeForm").innerHTML +
                '"]'
            )
            .setAttribute("selected", true);
        }
      }

      form.querySelector('input[name="fournisseurPiece"]').value =
        item.querySelector(".companyForm").innerHTML;
      if (item.querySelector(".vitesseForm").innerHTML != "")
        form.querySelector('input[name="frequancePiece"]').value =
          item.querySelector(".vitesseForm").innerHTML;

      buttonLock.querySelector("i:first-of-type").classList.add("displayNone");
      buttonLock
        .querySelector("i:last-of-type")
        .classList.remove("displayNone");

      form.querySelector('input[name="id"]').value =
        item.querySelector(".idForm").innerHTML;

      //Grisé les input
      formInputs.forEach((item) => {
        if (item.name != "prixPiece" && item.name != "quantitePiece") {
          item.setAttribute("readonly", "readonly");
          item.classList.add("greyedOut");
          if (item.name == "imageProduit") {
            item.setAttribute("disabled", true);
          }
        }
      });
    });
  });

  buttonLock.addEventListener("click", () => {
    if (
      buttonLock
        .querySelector("i:first-of-type")
        .classList.contains("displayNone")
    ) {
      buttonLock
        .querySelector("i:first-of-type")
        .classList.remove("displayNone");
      buttonLock.querySelector("i:last-of-type").classList.add("displayNone");
      form.querySelector('input[name="id"]').value = -1;
    }

    formInputs.forEach((item) => {
      if (item.name != "prixPiece" && item.name != "quantitePiece") {
        item.removeAttribute("readonly");
        item.removeAttribute("disabled");
        item.classList.remove("greyedOut");
      }
    });
  });

  companyButton.forEach((item) => {
    item.addEventListener("click", (e) => {
      form.querySelector('input[name="fournisseurPiece"]').value =
        e.currentTarget.querySelector("p").innerHTML;
    });
  });

  typeButton.forEach((item) => {
    item.addEventListener("click", (e) => {
      form.querySelector('input[name="typePiece"]').value =
        e.currentTarget.querySelector("p").innerHTML;
    });
  });
}

function filterFormAddInput() {
  let inputs = document.querySelectorAll(".inputFiltered");

  inputs.forEach((item) => {
    item.addEventListener("input", (e) => {
      let value = e.currentTarget.value;
      let regex = new RegExp(value.toLowerCase(), "gm");

      if (e.currentTarget.id == "nomPiece") {
        e.currentTarget.parentElement.nextElementSibling
          .querySelectorAll("button")
          .forEach((item) => {
            if (
              !regex.test(
                item.querySelector(".nomForm").innerHTML.toLowerCase()
              )
            ) {
              item.classList.add("displayNone");
            } else {
              item.classList.remove("displayNone");
            }
          });
      } else {
        e.currentTarget.nextElementSibling
          .querySelectorAll("button")
          .forEach((item) => {
            if (!regex.test(item.querySelector("p").innerHTML.toLowerCase())) {
              item.classList.add("displayNone");
            } else {
              item.classList.remove("displayNone");
            }
          });
      }
    });
  });
}

/***********************************************************************/
/****FAQ ***************************************************************/

/* DARK MODE */

function setCookie(cname, cvalue, exdays) {
  const d = new Date();
  d.setTime(d.getTime() + exdays * 24 * 60 * 60 * 1000);
  let expires = "expires=" + d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
  let theme = cname + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(";");
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1);
    }
    if (c.indexOf(theme) == 0) {
      return c.substring(theme.length, c.length);
    }
  }
  return "";
}

function changeTheme() {
  const chk = document.getElementById("chk");
  const body = document.getElementsByTagName("body")[0];
  chk.addEventListener("change", () => {
    body.classList.toggle("dark");
    if (body.classList.contains("dark")) {
      setCookie("theme", "dark", 30);
    } else {
      setCookie("theme", "light", 30);
    }
  });
  verifyCookie();
}

function verifyCookie() {
  if (getCookie("theme") == "dark") {
    const chk = document.getElementById("chk");
    const body = document.getElementsByTagName("body")[0];
    chk.setAttribute("checked", true);
    body.classList.add("dark");
  }
}

function faqPageInit() {
  window.addEventListener(
    "load",
    (ev) => {
      document.querySelector("#testSelect").addEventListener("change", (ev) => {
        let n = ev.target.value;
        switch (n) {
          case "0":
            // votre code, ici message dans la console (touche F12)
            document.getElementById("message").innerHTML =
              "Nous avons parfois des produits neuf mais dans la majorité des cas il s'agit d'annulation de commande ou des ordinateurs reconditionné allant de 20 à 2000 heures d'utilisation.  Ce n'est pas neuf mais pour un ordinateur ayant aussi peu d'heure à son compte autant dire qu'il l'ait. En plus c'est moins cher! Pour ce qui est de nos produits usagé, ils sont testé par nos fournisseurs et par nos soins également. Lorsqu'une pièce est a changer nous le faisons!";
            break;
          case "1":
            document.getElementById("message").innerHTML =
              "Lorsque nous aurons terminé avec la réparation nous vous appellerons, habituellement en 1 à 3 jours vous aurez de nos nouvelles. Évidemment certaine réparation peuvent prendre plus de temps que d'autres. Soyez assuré que nous ferons le plus vite possible!";
            break;
          case "2":
            document.getElementById("message").innerHTML =
              "Malheureusement non, nous réparons uniquement les ordinateurs car nous n'avons pas accès aux pièces spécifiques d'appareils tels que les cellulaires ou autre.";
            break;
          case "3":
            document.getElementById("message").innerHTML =
              "Non, ici c'est premier arrivé premier servi. Il nous est impossible de vous garantir que votre ordinateur soit prêt dans la journée.";
            break;
          case "4":
            document.getElementById("message").innerHTML =
              "S'il y a présence de virus, de dommage physique ou logiciel, ne s'est pas éteint correctement à répétition à cause de l'utilisateur la garantie ne sera pas applicable. Les batteries de nos portables usagés ne sont pas couverte. Tout autre problème est couvert par la garantie.";
            break;
          case "5":
            document.getElementById("message").innerHTML =
              "Tout dépend de l'état de votre périphérique de stockage. Parfois nous ne pouvons pas récupérer les données quand le disque a atteint un niveau d'usure trop élevé. Toutefois, en moyenne nous pouvons récupérer 97,52% des données sur un disque dur hautement endommagé donc n'ayez pas peur! Nous avons notre propre logiciel de backup qui a passé les tests haut la main et qui s'améliore de jour en jour.";
            break;
          case "6":
            document.getElementById("message").innerHTML =
              "Pour ce qui est des ordinateurs usagé, ils viennent souvent des entreprises gouvernementale comme la CSRS, Régie du logement, etc... Les ordinateurs reconditionné ont souvent entre 0 à 600 heures d'utilisation, ce sont des annulations de commandes qui sont très peu utilisé et même parfois pas du tout, donc très avantageux par rapport a un ordinateur neuf au niveau du prix. Les ordinateurs neuf viennent directement de notre fournisseur.";
            break;
          case "7":
            document.getElementById("message").innerHTML =
              "Pour les réparations, nous utilisons souvent Crystaldiskinfo et d'autres logiciel de diagnostic comme Memtest86. Lorsque ce n'est pas suffisant nous utilisons des logiciels plus spécialisé et non accessible au grand public. Sinon, l'essais erreur. Pour ce qui est des transfert de données, nous utilisons notre propre logiciel.";
            break;
          default:
            console.error("Cette valeur n'existe pas !");
            break;
        }
      });
    },
    false
  );
}

/*********************************************************************************/
/**********************************DELETE*****************************************/

function cardDeleteButton() {
  let buttons = document.querySelectorAll(".delete");
  let modal = document.querySelector(".modalDelete");

  buttons.forEach((item) => {
    item.addEventListener("click", () => {
      modal.classList.remove("displayNone");
      setTimeout(() => {
        modal.querySelector("div").classList.add("modalSpawn");
      }, 1);

      modal.querySelector("#amountFormUpdate").value =
        item.parentElement.parentElement.querySelector(".quantite").innerHTML;
      modal.querySelector("#idFormUpdate").value = item.id;
    });
  });
}

//Modal delete

function modalUpdate() {
  let buttonUpdate = document.querySelector("#buttonShowFormUpdate");
  let formUpdate = document.querySelector(".formUpdate");
  let updateButtonSubmit = document.querySelector("#formUpdateButton");
  let buttonCloseModal = document.querySelector(".closeModalDelete");
  let buttonDelete = document.querySelector("#buttonDeleteCard");
  let modal = document.querySelector(".modalDelete");

  buttonDelete.addEventListener("click", () => {
    if (confirm("Etes vous certain de vouloir supprimer cette item ?")) {
      let id = modal.querySelector("#idFormUpdate").value;
      let nameItem = /(\w+)-\d+/g.exec(id)[1];
      let idItem = /\w+-(\d+)/g.exec(id)[1];

      let fetchBody = {
        action: "deleteProduct",
        product: nameItem,
        id: idItem,
      };

      fetchFunct(fetchBody, document.querySelector("#" + id));
    } else {
      txt = "Vous avez cancelé votre action de suppression!";
      console.log(txt);
    }

    closeModalDelete(modal);
  });

  buttonCloseModal.addEventListener("click", () => {
    closeModalDelete(modal);
    formUpdate.classList.add("displayNone");
  });

  buttonUpdate.addEventListener("click", () => {
    formUpdate.classList.toggle("displayNone");
  });

  updateButtonSubmit.addEventListener("click", (e) => {
    let id = modal.querySelector("#idFormUpdate").value;
    let nameItem = /(\w+)-\d+/g.exec(id)[1];
    let idItem = /\w+-(\d+)/g.exec(id)[1];
    let amount = document.querySelector("#amountFormUpdate").value;

    let fetchBody = {
      action: "updateAmount",
      piece: nameItem,
      id: idItem,
      amount: amount,
    };

    if (verificationUpdateInput(e)) {
      fetchFunct(fetchBody, document.querySelector("#" + id));
      closeModalDelete(modal);
    }
  });
}

async function fetchFunct(fetchBody, item) {
  try {
    let response = await fetch("./index.php", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(fetchBody),
    });
    fetchResponseUpdateDel(response, item);
  } catch (err) {
    console.log("Le fetch n'a pas fonctionné :" + err.message);
  }
}

function closeModalDelete(modal) {
  modal.querySelector("div").classList.remove("modalSpawn");
  setTimeout(() => {
    modal.classList.add("displayNone");
  }, 400);
}

async function fetchResponseUpdateDel(response, item) {
  responseJson = await response.json();
  if (responseJson["fetchResponse"] == "delete") {
    if (responseJson["status"] == "succes")
      item.parentElement.parentElement.remove();
    else if (responseJson["status"] == "fail")
      alert(await responseJson["message"]);
  } else if (responseJson["fetchResponse"] == "amount") {
    item.parentElement.parentElement.querySelector(".quantite").innerHTML =
      responseJson["quantite"];
  }
}

/*********************************validation input*******************************/

function isSmaller(number, input) {
  if (input.value.length > number)
    return {
      value: false,
      sentence: number + " caractère maximum.",
    };
  else
    return {
      value: true,
    };
}

function asNoSpecialChar(input) {
  let regex = /^[a-zA-Z0-9-,.() ]+$/gm;

  if (regex.test(input.value))
    return {
      value: true,
    };
  else if(input.value.length <= 0)
  return {
    value: false,
    sentence:
      "Rien n'est écrit",
  };
  else
    return {
      value: false,
      sentence:
        "Les caractères spéciaux ne sont pas acceptés",
    };
}

function isNumeric(input) {
  let regex = /^-?\d+$/gm;

  if (!regex.test(input.value)) {
    return {
      value: false,
      sentence: "Les caractères autres que numérique ne sont pas acceptés."
    };
  }
  else if(parseInt(input.value) < 0) {
    return {
      value: false,
      sentence: "Les chiffre négatifs ne sont valides."
    };
  }
  else
      return {
        value: true,
      };
  }

function verificationSearchButton() {
  let search = document.querySelector(".search-barre");
  let input = search.querySelector("#search");

  search.addEventListener("submit", (e) => {
    if (!isSmaller(32, input)["value"]) {
      e.preventDefault();
      if (input.parentElement.querySelector("p") != null)
        input.parentElement.querySelector("p").remove();
      input.insertAdjacentHTML(
        "beforebegin",
        '<p class="errSearch">' + isSmaller(32, input)["sentence"] + "</p>"
      );
    } else if (!asNoSpecialChar(input)["value"]) {
      e.preventDefault();
      if (input.parentElement.querySelector("p") != null)
        input.parentElement.querySelector("p").remove();
      input.insertAdjacentHTML(
        "beforebegin",
        '<p class="errSearch">' + asNoSpecialChar(input)["sentence"] + "</p>"
      );
    }
  });
}

function verificationInputLogin() {
  let formLogin = document.querySelector(".containerLogin");
  let inputs = formLogin.querySelectorAll(
    'input[type="text"], input[type="password"]'
  );

  formLogin.addEventListener("submit", (e) => {
    let cancelSubmit = false;
    inputs.forEach((input) => {
      if (!isSmaller(32, input)["value"]) {
        cancelSubmit = true;

        if (
          input.nextElementSibling != null &&
          input.nextElementSibling.tagName == "P"
        )
          input.nextElementSibling.remove();

        input.insertAdjacentHTML(
          "afterend",
          '<p class="err">' + isSmaller(32, input)["sentence"] + "</p>"
        );
      } else if (!asNoSpecialChar(input)["value"]) {
        cancelSubmit = true;
        if (
          input.nextElementSibling != null &&
          input.nextElementSibling.tagName == "P"
        )
          input.nextElementSibling.remove();

        input.insertAdjacentHTML(
          "afterend",
          '<p class="err">' + asNoSpecialChar(input)["sentence"] + "</p>"
        );
      }
    });
    if (cancelSubmit) e.preventDefault();
  });
}

function verificationInputAdd() {
  let form = document.querySelector(".modalAddForm form");
  let inputs = document.querySelectorAll(
    '.modalAddForm form input[type="text"], .modalAddForm form input[type="number"]'
  );

  form.addEventListener("submit", (e) => {
    let errMessage = "";

    inputs.forEach((input) => {
      if(input.name == "quantitePiece" && input.value.length <= 0) input.value = 0;
      if (input.type == "text") {
        if (!asNoSpecialChar(input)["value"]) {
          errMessage +=
            input.name + " : " + asNoSpecialChar(input)["sentence"] + "<br />";
        }
      } else if (input.type == "number") {
        if (!asNoSpecialChar(input)["value"]) {
          errMessage +=
            input.name + " : " + asNoSpecialChar(input)["sentence"] + "<br />";
        } else if (!isNumeric(input)["value"]) {
          errMessage =
            input.name + " : " + isNumeric(input)["sentence"] + "<br />";
        }
      }
    });

    if (errMessage != "") {
      e.preventDefault();
      document.querySelector(".errAdd").innerHTML = errMessage;
    }
  });
}

function verificationUpdateInput(e) {
  let input = document.querySelector(".formUpdate input");

  if (!isNumeric(input)["value"] || !asNoSpecialChar(input)["value"]) {
    if (
      input.nextElementSibling != null &&
      input.nextElementSibling.tagName == "P"
    )
      input.nextElementSibling.remove();

    input.insertAdjacentHTML(
      "afterend",
      '<p class="err">' + isNumeric(input)["sentence"] + "</p>"
    );
    e.preventDefault();
    return false;
  } else {
    if (input.nextElementSibling.tagName == "P")
      input.nextElementSibling.remove();
    return true;
  }
}


/*******************BURGER***************** */

function burgerSlider() {
  let burger = document.querySelector(".burger");
  let menu = document.querySelector(".container_nav");
  burger.addEventListener("click", () => {
    menu.classList.toggle("sliderIn");

    if(!menu.classList.contains("sliderIn"))
      burger.querySelectorAll("span").forEach(item => {item.style.backgroundColor = "black";})
    else 
      burger.querySelectorAll("span").forEach(item => {item.style.backgroundColor = "white";})

  });
}
