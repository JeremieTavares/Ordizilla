<?php
if (session_status() === PHP_SESSION_NONE)
    session_start();

//Contient les fetchs
$fetchRequest = json_decode(file_get_contents('php://input'), true);

//Si il y a un get page
if (isset($_REQUEST["page"])) {
    //Si la page demandée est produit
    if ($_REQUEST["page"] == "product") {
        //Si l'utilisateur est passé par la bar de recherche
        if (isset($_REQUEST["search"])) {
            require_once("./controller/controllerPiece.php");
            //Va chercher dans la vue sql par rapport au search

            getAllPieceBySearch($_REQUEST["search"], (isset($_SESSION["adminId"]) ? true : false));
        }
        //Si l'utilisateur est passé par le nav (get article)
        elseif (isset($_REQUEST["article"])) {
            require_once("./controller/controllerPiece.php");
            //Va chercher tout de la vue sql qui est le type d'article (ex : cpu)

            getPiecesByNamePost($_REQUEST["article"], (isset($_SESSION["adminId"]) ? true : false));
        } else {
            //Si aucun des autres cpu est affiché par default
            require_once("./controller/controllerPiece.php");
            getPiecesByNamePost("cpu", (isset($_SESSION["adminId"]) ? true : false));
        }
    } elseif ($_REQUEST["page"] == "login") {
        require_once("./view/login.php");
    } elseif ($_REQUEST["page"] == "contact") {
        require_once("./view/contact.php");
    }
    //Si l'utilisateur utilise les liens footer
    elseif ($_REQUEST["page"] == "piedDePage") {
        if (isset($_REQUEST["view"])) {
            $view = $_REQUEST["view"];
            require_once("./view/piedDePage.php");
        }
    } elseif ($_REQUEST["page"] == "faq") {
        require_once("./view/faq.php");
    } elseif ($_REQUEST["page"] == "receptionFormulaire") {
        require_once('./view/receptionFormulaire.php');
    }
    //Si le get page est là mais qu'il ne représente aucune page du site
    else {
        require_once("./view/accueil.php");
    }
} elseif (isset($_REQUEST["action"]) && $_REQUEST["action"] == "loginAdmin") {
    require_once("./controller/controllerAdmin.php");
    verifyLogin($_REQUEST["username"], $_REQUEST["password"], (isset($_SESSION["adminId"]) ? true : false));
} elseif (isset($_REQUEST["action"]) && $_REQUEST["action"] == "logout") {
    require_once("./controller/controllerAdmin.php");
    logout((isset($_SESSION["adminId"]) ? true : false));
} elseif (isset($_REQUEST["action"]) && $_REQUEST["action"] == "AddOrUpdateProduct") {
    require_once("./controller/controllerPiece.php");
    if ((isset($_REQUEST["id"]) && $_REQUEST["id"] >= 0)
        && isset($_REQUEST["choixPieces"])
        && isset($_REQUEST['prixPiece'])
        && isset($_REQUEST['quantitePiece'])
    ) { //UPDATE PIECE
        updatePiece($_REQUEST["id"], $_REQUEST["choixPieces"], $_REQUEST['prixPiece'], $_REQUEST['quantitePiece']);
    } else {
        // INSERT PIECE
        if (isset($_REQUEST["choixPieces"])) {
            $piece = $_REQUEST["choixPieces"];
            if ($piece == "cpu") {
                if (
                    isset($_REQUEST['nomPiece'])
                    && isset($_REQUEST['prixPiece'])
                    && isset($_REQUEST['quantitePiece'])
                    && isset($_REQUEST['typePiece'])
                    && isset($_REQUEST['fournisseurPiece'])
                    && isset($_REQUEST['frequancePiece'])
                    && isset($_FILES['imageProduit'])
                )
                    insertPiece($_REQUEST, $_FILES['imageProduit']);
            } elseif ($piece == "gpu") {
                if (
                    isset($_REQUEST['nomPiece'])
                    && isset($_REQUEST['prixPiece'])
                    && isset($_REQUEST['quantitePiece'])
                    && isset($_REQUEST['fournisseurPiece'])
                    && isset($_REQUEST['frequancePiece'])
                    && isset($_FILES['imageProduit'])
                )
                    insertPiece($_REQUEST, $_FILES['imageProduit']);
            } elseif ($piece == "ram") {
                if (
                    isset($_REQUEST['nomPiece'])
                    && isset($_REQUEST['prixPiece'])
                    && isset($_REQUEST['quantitePiece'])
                    && isset($_REQUEST['typePiece'])
                    && isset($_REQUEST['fournisseurPiece'])
                    && isset($_REQUEST['frequancePiece'])
                )
                    insertPiece($_REQUEST, $_FILES['imageProduit']);
            } elseif ($piece == "storage") {
                if (
                    isset($_REQUEST['nomPiece'])
                    && isset($_REQUEST['prixPiece'])
                    && isset($_REQUEST['quantitePiece'])
                    && isset($_REQUEST['typePiece'])
                    && isset($_REQUEST['fournisseurPiece'])
                    && isset($_REQUEST['frequancePiece'])
                    && isset($_FILES['imageProduit'])
                )
                    insertPiece($_REQUEST, $_FILES['imageProduit']);
            } elseif ($piece == "motherboard") {
                if (
                    isset($_REQUEST['nomPiece'])
                    && isset($_REQUEST['prixPiece'])
                    && isset($_REQUEST['quantitePiece'])
                    && isset($_REQUEST['typePiece'])
                    && isset($_REQUEST['fournisseurPiece'])
                    && isset($_FILES['imageProduit'])
                )
                    insertPiece($_REQUEST, $_FILES['imageProduit']);
            } elseif ($piece == "cooling") {
                if (
                    isset($_REQUEST['nomPiece'])
                    && isset($_REQUEST['prixPiece'])
                    && isset($_REQUEST['quantitePiece'])
                    && isset($_REQUEST['typePiece'])
                    && isset($_REQUEST['fournisseurPiece'])
                    && isset($_REQUEST['frequancePiece'])
                    && isset($_FILES['imageProduit'])
                )
                    insertPiece($_REQUEST, $_FILES['imageProduit']);
            } elseif ($piece == "psu") {
                if (
                    isset($_REQUEST['nomPiece'])
                    && isset($_REQUEST['prixPiece'])
                    && isset($_REQUEST['quantitePiece'])
                    && isset($_REQUEST['typePiece'])
                    && isset($_REQUEST['fournisseurPiece'])
                    && isset($_REQUEST['frequancePiece'])
                    && isset($_FILES['imageProduit'])
                )
                    insertPiece($_REQUEST, $_FILES['imageProduit']);
            } elseif ($piece == "pc_case") {
                if (
                    isset($_REQUEST['nomPiece'])
                    && isset($_REQUEST['prixPiece'])
                    && isset($_REQUEST['quantitePiece'])
                    && isset($_REQUEST['fournisseurPiece'])
                    && isset($_FILES['imageProduit'])
                )
                    insertPiece($_REQUEST, $_FILES['imageProduit']);
            }
        }
    }
}
//Si une requete fetch est envoyé
elseif (isset($fetchRequest["action"])) {
    require_once("./controller/controllerPiece.php");
    if ($fetchRequest["action"] == "fetchProduit") {
        getPiecesByNameFetch($fetchRequest["produit"], (isset($_SESSION["adminId"]) ? true : false));
    } elseif ($fetchRequest["action"] == "fetchAdminForm") {
        getPieceByNameFetchForm($fetchRequest["typeProduit"]);
    } elseif ($fetchRequest["action"] == "deleteProduct") {
        deleteItem($fetchRequest["product"], $fetchRequest["id"]);
    } elseif ($fetchRequest["action"] == "updateAmount") {
        updateAmount($fetchRequest["id"], $fetchRequest["piece"], $fetchRequest["amount"]);
    }
}
//Si aucun get
else {
    require_once("./view/accueil.php");
}
