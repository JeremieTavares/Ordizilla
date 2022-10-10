<?php
require_once("./model/PieceManager.php");
require_once("./model/Piece.php");


//Controller qui appel la class PieceManager et qui appel la fonction "getAllPieceBySearchManager" (aller voir pieceManager.php)
function getAllPieceBySearch($search, $sessionIsActive)
{
       $manager = new PieceManager();

       if ($sessionIsActive)
              $contentPiece = $manager->getAllPieceBySearchOutStockManager($search);
       else
              $contentPiece = $manager->getAllPieceBySearchManager($search);


       require_once("./view/produit.php");
}

//Controller qui appel la class PieceManager et qui appel la fonction "getPiecesByNameManager" (aller voir pieceManager.php)
function getPiecesByName($piece, $sessionIsActive)
{
       $manager = new PieceManager();
       if ($sessionIsActive)
              $contentPiece = $manager->getPiecesByNameOfAllManager($piece);
       else
              $contentPiece = $manager->getPiecesByNameManager($piece);


       return $contentPiece;
}
//Même fichier         pieceManager.php
//Controller qui appel la class PieceManager et qui appel la fonction "getPiecesByName" et "getCompanyByPiece" (aller voir pieceManager.php)
//Fonction adapté pour les requete post (Différence : Affiche directement produit qui contient cardTemplate)
function getPiecesByNamePost($piece, $sessionIsActive)
{
       $contentPiece = getPiecesByName($piece, $sessionIsActive);
       $contentCompany = getCompanyByPiece($piece);

       require_once("./view/produit.php");
}

//Fonction adapté pour les requete fetch (Différence : Renvoie cardTemplate.php remplie vers le js et coté js cardTemplate est inséré dans produit.php)
function getPiecesByNameFetch($piece, $sessionIsActive)
{
       $contentPiece = getPiecesByName($piece, $sessionIsActive);
       $contentCompany = getCompanyByPiece($piece);
       require_once("./view/cardTemplate.php");
       http_response_code(200);
}


// renvoie le return de "getCompanyByPieceManager" (aller voir pieceManager.php)
function getCompanyByPiece($piece)
{
       $manager = new PieceManager();

       $content = $manager->getCompanyByPieceManager($piece);

       return $content;
}

function getPiecesByNameOfAll($piece)
{
       $manager = new PieceManager();
       $contentPiece = $manager->getPiecesByNameOfAllManager($piece);


       return $contentPiece;
}


function getPieceByNameFetchForm($piece)
{
       $manager = new PieceManager();
       $contentPiece = getPiecesByNameOfAll($piece);
       $contentType = $manager->getAllTypeByPieceManager($piece);
       $contentCompany = $manager->getAllCompanyByPieceManager($piece);
       require_once("./view/formAddTemplate.php");
       http_response_code(200);
}

// FUNCTION DELETE ITEM
function deleteItem($item, $id)
{

       $manager = new PieceManager();
       $path = $manager->deletePieceFromDb($item, $id);

     

       if (isset($path)) {

              $pathImage = "./inc/imagesProduits/" . $path;
              if(file_exists($pathImage))
                     unlink($pathImage);

              http_response_code(200);
              $array = array (
                     "fetchResponse" => "delete",
                     "status" => "succes"
              );
              echo json_encode($array, JSON_PRETTY_PRINT);
       } else {
              http_response_code(400);
              $array = array (
                     "fetchResponse" => "delete",
                     "status" => "fail",
                     "message" => "La suppression n'a pas fonctionné"
              );
              echo json_encode($array, JSON_PRETTY_PRINT);
       }
              
}

// FUNCTION RELIE AUX UPDATES

function updatePiece($id, $piece, $prix, $quantite)
{
       $manager = new PieceManager();
       $manager->updatePieceById($id, $piece, $prix, (empty($quantite) ? 0 : $quantite));
       header("location: index.php?page=product");
       exit;
}

function updateAmount($id, $piece, $quantite)
{
       $manager = new PieceManager();
       if (!empty($quantite))
              $worked = $manager->updateAmountById($id, $piece, $quantite);

       if ($worked) {
              http_response_code(200);
              $array = array (
                     "fetchResponse" => "amount",
                     "Sentence" => "Changement réussi.",
                     "quantite" => $quantite
              );

              echo json_encode($array, JSON_PRETTY_PRINT);
       } else {
              http_response_code(400);
              echo "La quantité n'est pas valide.";
       }
}


function saveImage($image, $name)
{
       $dossier = "./inc/imagesProduits/";
       if ($image['tmp_name'] !== "") {

              $nomImage = sha1($name . time());
              $tmp = $image['tmp_name'];
              $fichier = $image['name'];
              $extension = strrchr($fichier, '.');
              @move_uploaded_file($tmp, $dossier . $nomImage . $extension);
              echo $tmp;

              echo '<br>';
              echo $dossier . $nomImage . $extension;


              @unlink($tmp);
              echo $nomImage . $extension;
              return $nomImage . $extension;
       }
}
// FUNCTION RELIE AUX INSERT
function insertPiece($piece, $image)
{
       $imagePath = saveImage($image, $piece['nomPiece']);
       if ($piece['choixPieces'] == "cpu") {
              $manager = new PieceManager();
              $worked = $worked = $manager->insertNewCpu(
                     $piece['nomPiece'],
                     $piece['typePiece'],
                     $piece['frequancePiece'],
                     $piece['fournisseurPiece'],
                     (empty($piece['quantitePiece']) ? 0 : $piece['quantitePiece']),
                     $piece['prixPiece'],
                     $imagePath
              );
       } elseif ($piece['choixPieces'] == "gpu") {
              $manager = new PieceManager();
              $worked = $manager->insertNewGpu(
                     $piece['nomPiece'],
                     $piece['frequancePiece'],
                     $piece['fournisseurPiece'],
                     (empty($piece['quantitePiece']) ? 0 : $piece['quantitePiece']),
                     $piece['prixPiece'],
                     $imagePath
              );
       } elseif ($piece['choixPieces'] == "ram") {
              $manager = new PieceManager();
              $worked = $manager->insertNewRam(
                     $piece['nomPiece'],
                     $piece['typePiece'], // CHECK TYPE RELATIONNEL ddr3-4-5 il ne la pas dans le form                                     
                     $piece['frequancePiece'],
                     $piece['fournisseurPiece'],
                     (empty($piece['quantitePiece']) ? 0 : $piece['quantitePiece']),
                     $piece['prixPiece'],
                     $imagePath
              );
       } elseif ($piece['choixPieces'] == "storage") {
              if ($piece['frequancePiece'] >= 1000) {
                     $capacite = $piece['frequancePiece'] / 1000;
                     $capaciteType = "TO";
              } else {
                     $capacite =  $piece['frequancePiece'];
                     $capaciteType = "GB";
              }

              $manager = new PieceManager();

              $worked = $manager->insertNewStorage(
                     $piece['nomPiece'],
                     $capacite,
                     $capaciteType,
                     $piece['typePiece'],
                     $piece['fournisseurPiece'],
                     (empty($piece['quantitePiece']) ? 0 : $piece['quantitePiece']),
                     $piece['prixPiece'],
                     $imagePath
              );
       } elseif ($piece['choixPieces'] == "motherboard") {
              $manager = new PieceManager();
              $worked = $manager->insertNewMotherboard(
                     $piece['nomPiece'],
                     $piece['typePiece'],
                     $piece['fournisseurPiece'],
                     (empty($piece['quantitePiece']) ? 0 : $piece['quantitePiece']),
                     $piece['prixPiece'],
                     $imagePath
              );
       } elseif ($piece['choixPieces'] == "cooling") {
              $manager = new PieceManager();
              $worked = $manager->insertNewCooling(
                     $piece['nomPiece'],
                     $piece['frequancePiece'],
                     $piece['fournisseurPiece'],
                     $piece['typePiece'],
                     (empty($piece['quantitePiece']) ? 0 : $piece['quantitePiece']),
                     $piece['prixPiece'],
                     $imagePath
              );
       } elseif ($piece['choixPieces'] == "psu") {
              $manager = new PieceManager();
              $worked = $manager->insertNewPsu(
                     $piece['nomPiece'],
                     $piece['frequancePiece'],
                     $piece['fournisseurPiece'],
                     $piece['typePiece'],
                     (empty($piece['quantitePiece']) ? 0 : $piece['quantitePiece']),
                     $piece['prixPiece'],
                     $imagePath
              );
       } elseif ($piece['choixPieces'] == "pc_case") { // DANS LE FORM ADD CEST BRISE QUAND ON CLICK SUR CASE: pr TYPE
              $manager = new PieceManager();
              $worked = $manager->insertNewPcCase(
                     $piece['nomPiece'],
                     $piece['typePiece'],
                     $piece['fournisseurPiece'],
                     (empty($piece['quantitePiece']) ? 0 : $piece['quantitePiece']),
                     $piece['prixPiece'],
                     $imagePath
              );
       }
       if(!$worked)
              header('location: index.php?page=product&err=' . $piece["nomPiece"]);
       else
              header('location: index.php?page=product');
       exit;
}
