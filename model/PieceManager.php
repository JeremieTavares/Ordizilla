<?php
require_once('model/Manager.php');

class PieceManager extends Manager
{
    // SELECT
    const SELECT_ALL_PIECES_BY_SEARCH = 'SELECT * FROM allpieceinstock WHERE nom like "%":search"%" OR type LIKE "%":search"%" OR company LIKE "%":search"%" ORDER BY nom ASC;';
    const SELECT_ALL_PIECES_OUT_STOCK_BY_SEARCH = 'SELECT * FROM allpiece WHERE nom like "%":search"%" OR type LIKE "%":search"%" OR company LIKE "%":search"%" ORDER BY nom ASC;';

    const SELECT_PIECES_BY_NAME_IN_STOCK = 'SELECT * FROM allpieceinstock WHERE typePiece LIKE :piece ORDER BY nom ASC';

    const SELECT_PIECES_BY_NAME = 'SELECT * FROM allpiece WHERE typePiece LIKE :piece ORDER BY nom ASC';


    // INSERT
    const INSERT_NEW_PIECE_CPU = 'INSERT INTO cpu (cpu_name, cpu_type, cpu_speed, cpu_company, cpu_amount, cpu_prix, cpu_path)
                                             VALUES (:cpu_name, (SELECT tyc_id FROM type_cpu WHERE tyc_type LIKE :cpu_type), :cpu_speed, (SELECT com_id FROM company WHERE com_name LIKE :cpu_company), :cpu_amount, :cpu_prix, :cpu_path)';

    const INSERT_NEW_PIECE_COOLING = 'INSERT INTO cooling (coo_name, coo_clock, coo_company, coo_watercooling, coo_amount, coo_prix, coo_path)
                                             VALUES (:coo_name, :coo_clock, (SELECT com_id FROM company WHERE com_name LIKE :coo_company), (SELECT tyc_id FROM type_cooler WHERE tyc_type LIKE :coo_watercooling), :coo_amount, :coo_prix, :coo_path)';

    const INSERT_NEW_PIECE_GPU = 'INSERT INTO gpu (gpu_name, gpu_watt, gpu_company, gpu_amount, gpu_prix, gpu_path)
                                             VALUES (:gpu_name, :gpu_watt, (SELECT com_id FROM company WHERE com_name LIKE :gpu_company), :gpu_amount, :gpu_prix, :gpu_path)';

    const INSERT_NEW_PIECE_MOTHERBOARD = 'INSERT INTO motherboard (mbo_name, mbo_type, mbo_company, mbo_amount, mbo_prix, mbo_path)
                                             VALUES (:mbo_name, (SELECT tym_id FROM type_motherboard WHERE tym_type LIKE :mbo_type), (SELECT com_id FROM company WHERE com_name LIKE :mbo_company), :mbo_amount, :mbo_prix, :mbo_path)';

    const INSERT_NEW_PIECE_PC_CASE = 'INSERT INTO pc_case (pca_name, pca_type_mb_id, pca_company, pca_amount, pca_prix, pca_path)
                                             VALUES (:pca_name, (SELECT tym_id FROM type_motherboard WHERE tym_type LIKE :pca_type_mb), (SELECT com_id FROM company WHERE com_name LIKE :pca_company), :pca_amount, :pca_prix, :pca_path)';

    const INSERT_NEW_PIECE_PSU = 'INSERT INTO psu (psu_name, psu_watt, psu_company, psu_type, psu_amount, psu_prix, psu_path)
                                             VALUES (:psu_name, :psu_watt, (SELECT com_id FROM company WHERE com_name LIKE :psu_company), (SELECT typ_id FROM type_psu WHERE typ_type LIKE :psu_type), :psu_amount, :psu_prix, :psu_path)';

    const INSERT_NEW_PIECE_RAM = 'INSERT INTO ram (ram_name, ram_type_ram_id, ram_speed, ram_company, ram_amount, ram_prix, ram_path)
                                             VALUES (:ram_name, (SELECT tyr_id FROM type_ram where tyr_type LIKE :ram_type_ram), :ram_speed, (SELECT com_id FROM company WHERE com_name LIKE :ram_company), :ram_amount, :ram_prix, :ram_path)';

    const INSERT_NEW_PIECE_STORAGE = 'INSERT INTO storage (sto_name, sto_capacity, sto_type_capacity, sto_type_storage_id, sto_company, sto_amount, sto_prix, sto_path)
                                             VALUES (:sto_name, :sto_capacity, (SELECT tca_id FROM type_capacity WHERE tca_type LIKE :sto_type_capacity), (SELECT tys_id FROM type_storage WHERE tys_type LIKE :sto_type_storage), (SELECT com_id FROM company WHERE com_name LIKE :sto_company), :sto_amount, :sto_prix, :sto_path)';

    // INSERT
    const DELETE_PIECE = 'DELETE FROM :productTable WHERE :column = :id';

    // FUNCTION POUR DELETE LES PIECES CPU    12
    public function deletePieceFromDb($item, $id)
    {
        
        $columnName = "";
        if ($item == "motherboard"){ 
            $columnName = "mbo_id";
            $path = "mbo_path";
        }
        elseif ($item == "pc_case") {
            $columnName = "pca_id";
            $path = "pca_path";
        }
        else
            $columnName = (substr($item, 0, 3) . "_id");
            $path = (substr($item, 0, 3) . "_path");
        try {

            $db = $this->dbConnect();
            $getId = "SELECT {$path} FROM {$item} WHERE {$columnName} = {$id}";

            $select = $db->query($getId);
            $pathResponse = $select->fetch();

            $delete_piece = "DELETE FROM {$item} WHERE {$columnName} = {$id}";
            $query = $db->prepare($delete_piece);
            $query->execute();
                    
            return $pathResponse[$path];
        } catch (Exception $e) {
            echo 'Exception reçue : ',  $e->getMessage();
            return null;
        }
    }

    // FUNCTION POUR UPDATE LES PIECES
    public function updatePieceById($id, $piece, $prix, $quantite)
    {

        if ($piece == "motherboard") {
            $prixS = "mbo_prix";
            $quantiteS = "mbo_amount";
            $idS = "mbo_id";
        } elseif ($piece == "pc_case") {
            $prixS = "pca_prix";
            $quantiteS = "pca_amount";
            $idS = "pca_id";
        } else {
            $prixS = (substr($piece, 0, 3) . "_prix");
            $quantiteS = (substr($piece, 0, 3) . "_amount");
            $idS = (substr($piece, 0, 3) . "_id");
        }

        $update = "UPDATE {$piece}
                       SET {$quantiteS} = ({$quantiteS} + {$quantite}), {$prixS} = {$prix} WHERE {$idS} = $id";

        $db = $this->dbConnect();
        $db->query($update);
    }

    // FUNCTION POUR INSERT LES PIECES

    public function insertNewCpu($cpu_name, $cpu_type, $cpu_speed, $cpu_company, $cpu_amount, $cpu_prix, $cpu_path)
    {
        $db = $this->dbConnect();
        
        $testIfExist = $db->query('SELECT cpu_id FROM cpu WHERE cpu_name LIKE "' . $cpu_name . '"');
        if($testIfExist->rowCount() == 0){

            $queryType = $db->prepare('SELECT tyc_id FROM type_cpu where tyc_type LIKE "' . $cpu_type . '"');
            $queryType->execute();
            $responseType = $queryType->fetch();
            if (empty($responseType)) {
                $queryInsertType = $db->prepare('INSERT INTO type_cpu (tyc_type) VALUES ("' . $cpu_type . '")');
                $queryInsertType->execute();
            }

            $queryType = $db->prepare('SELECT com_id FROM company where com_name LIKE "' . $cpu_company . '"');
            $queryType->execute();
            $responseType = $queryType->fetch();
            if (empty($responseType)) {
                $queryInsertType = $db->prepare('INSERT INTO company (com_name) VALUES ("' . $cpu_company . '")');
                $queryInsertType->execute();
            }


            $query = $db->prepare(self::INSERT_NEW_PIECE_CPU);
            $query->bindParam(":cpu_name", $cpu_name, PDO::PARAM_STR);
            $query->bindParam(":cpu_type", $cpu_type, PDO::PARAM_STR);
            $query->bindParam(":cpu_speed", $cpu_speed, PDO::PARAM_INT);
            $query->bindParam(":cpu_company", $cpu_company, PDO::PARAM_STR);
            $query->bindParam(":cpu_amount", $cpu_amount, PDO::PARAM_INT);
            $query->bindParam(":cpu_prix", $cpu_prix, PDO::PARAM_INT);
            $query->bindParam(":cpu_path", $cpu_path, PDO::PARAM_STR);
            $query->execute();
            return true;
        }
        else 
            return false;      
    }

    public function insertNewCooling($coo_name, $coo_clock, $coo_company, $coo_watercooling, $coo_amount, $coo_prix, $coo_path)
    {
        $db = $this->dbConnect();

        $testIfExist = $db->query('SELECT coo_id FROM cooling WHERE coo_name LIKE "' . $coo_name . '"');
        if($testIfExist->rowCount() == 0){

            $queryType = $db->prepare('SELECT tyc_id FROM type_cooler where tyc_type LIKE "' . $coo_watercooling . '"');
            $queryType->execute();
            $responseType = $queryType->fetch();
            if (empty($responseType)) {
                $queryInsertType = $db->prepare('INSERT INTO type_cooler (tyc_type) VALUES ("' . $coo_watercooling . '")');
                $queryInsertType->execute();
            }

            $queryCom = $db->prepare('SELECT com_id FROM company where com_name LIKE "' . $coo_company . '"');
            $queryCom->execute();
            $responseCom = $queryCom->fetch();
            if (empty($responseCom)) {
                $queryInsertCom = $db->prepare('INSERT INTO company (com_name) VALUES ("' . $coo_company . '")');
                $queryInsertCom->execute();
            }

            $query = $db->prepare(self::INSERT_NEW_PIECE_COOLING);
            $query->bindParam(":coo_name", $coo_name, PDO::PARAM_STR);
            $query->bindParam(":coo_clock", $coo_clock, PDO::PARAM_INT);
            $query->bindParam(":coo_company", $coo_company, PDO::PARAM_STR);
            $query->bindParam(":coo_watercooling", $coo_watercooling, PDO::PARAM_INT);
            $query->bindParam(":coo_amount", $coo_amount, PDO::PARAM_INT);
            $query->bindParam(":coo_prix", $coo_prix, PDO::PARAM_INT);
            $query->bindParam(":coo_path", $coo_path, PDO::PARAM_STR);
            $query->execute();
            return true;
        }
        else    
            return false;
    }

    public function insertNewGpu($gpu_name, $gpu_watt, $gpu_company, $gpu_amount, $gpu_prix, $gpu_path)
    {
        $db = $this->dbConnect();

        
        $testIfExist = $db->query('SELECT gpu_id FROM gpu WHERE gpu_name LIKE "' . $gpu_name . '"');
        if($testIfExist->rowCount() == 0){

            $queryCom = $db->prepare('SELECT com_id FROM company where com_name LIKE "' . $gpu_company . '"');
            $queryCom->execute();
            $responseCom = $queryCom->fetch();
            if (empty($responseCom)) {
                $queryInsertCom = $db->prepare('INSERT INTO company (com_name) VALUES ("' . $gpu_company . '")');
                $queryInsertCom->execute();
            }

            $query = $db->prepare(self::INSERT_NEW_PIECE_GPU);
            $query->bindParam(":gpu_name", $gpu_name, PDO::PARAM_STR);
            $query->bindParam(":gpu_watt", $gpu_watt, PDO::PARAM_INT);
            $query->bindParam(":gpu_company", $gpu_company, PDO::PARAM_STR);
            $query->bindParam(":gpu_amount", $gpu_amount, PDO::PARAM_INT);
            $query->bindParam(":gpu_prix", $gpu_prix, PDO::PARAM_INT);
            $query->bindParam(":gpu_path", $gpu_path, PDO::PARAM_STR);
            $query->execute();
            return true;
        }
        else    
            return false;
    }

    public function insertNewMotherboard($mbo_name, $mbo_type, $mbo_company, $mbo_amount, $mbo_prix, $mbo_path)
    {
        $db = $this->dbConnect();

        $testIfExist = $db->query('SELECT mbo_id FROM motherboard WHERE mbo_name LIKE "' . $mbo_name . '"');
        if($testIfExist->rowCount() == 0){

            $queryType = $db->prepare('SELECT tym_id FROM type_motherboard where tym_type LIKE "' . $mbo_type . '"');
            $queryType->execute();
            $responseType = $queryType->fetch();
            if (empty($responseType)) {
                $queryInsertType = $db->prepare('INSERT INTO type_motherboard (tym_type) VALUES ("' . $mbo_type . '")');
                $queryInsertType->execute();
            }

            $queryCom = $db->prepare('SELECT com_id FROM company where com_name LIKE "' . $mbo_company . '"');
            $queryCom->execute();
            $responseCom = $queryCom->fetch();
            if (empty($responseCom)) {
                $queryInsertCom = $db->prepare('INSERT INTO company (com_name) VALUES ("' . $mbo_company . '")');
                $queryInsertCom->execute();
            }

            $query = $db->prepare(self::INSERT_NEW_PIECE_MOTHERBOARD);
            $query->bindParam(":mbo_name", $mbo_name, PDO::PARAM_STR);
            $query->bindParam(":mbo_type", $mbo_type, PDO::PARAM_STR);
            $query->bindParam(":mbo_company", $mbo_company, PDO::PARAM_STR);
            $query->bindParam(":mbo_amount", $mbo_amount, PDO::PARAM_INT);
            $query->bindParam(":mbo_prix", $mbo_prix, PDO::PARAM_INT);
            $query->bindParam(":mbo_path", $mbo_path, PDO::PARAM_STR);
            $query->execute();
            return true;
        }
        else    
            return false;
    }

    public function insertNewPcCase($pca_name, $pca_type_mb, $pca_company, $pca_amount, $pca_prix, $pca_path)
    {
        $db = $this->dbConnect();

        $testIfExist = $db->query('SELECT pca_id FROM pc_case WHERE pca_name LIKE "' . $pca_name . '"');
        if($testIfExist->rowCount() == 0){

            $queryType = $db->prepare('SELECT tym_id FROM type_motherboard where tym_type LIKE "' . $pca_type_mb . '"');
            $queryType->execute();
            $responseType = $queryType->fetch();
            if (empty($responseType)) {
                $queryInsertType = $db->prepare('INSERT INTO type_motherboard (tym_type) VALUES ("' . $pca_type_mb . '")');
                $queryInsertType->execute();
            }

            $queryCom = $db->prepare('SELECT com_id FROM company where com_name LIKE "' . $pca_company . '"');
            $queryCom->execute();
            $responseCom = $queryCom->fetch();
            if (empty($responseCom)) {
                $queryInsertCom = $db->prepare('INSERT INTO company (com_name) VALUES ("' . $pca_company . '")');
                $queryInsertCom->execute();
            }

            $query = $db->prepare(self::INSERT_NEW_PIECE_PC_CASE);
            $query->bindParam(":pca_name", $pca_name, PDO::PARAM_STR);
            $query->bindParam(":pca_type_mb", $pca_type_mb, PDO::PARAM_STR);
            $query->bindParam(":pca_company", $pca_company, PDO::PARAM_STR);
            $query->bindParam(":pca_amount", $pca_amount, PDO::PARAM_INT);
            $query->bindParam(":pca_prix", $pca_prix, PDO::PARAM_INT);
            $query->bindParam(":pca_path", $pca_path, PDO::PARAM_STR);
            $query->execute();
            return true;
        }
        else    
            return false;
    }

    public function insertNewPsu($psu_name, $psu_watt, $psu_company, $psu_type, $psu_amount, $psu_prix, $psu_path)
    {
        $db = $this->dbConnect();

        $testIfExist = $db->query('SELECT psu_id FROM psu WHERE psu_name LIKE "' . $psu_name . '"');
        if($testIfExist->rowCount() == 0){

            $queryType = $db->prepare('SELECT typ_id FROM type_psu where typ_type LIKE "' . $psu_type . '"');
            $queryType->execute();
            $responseType = $queryType->fetch();
            if (empty($responseType)) {
                $queryInsertType = $db->prepare('INSERT INTO type_psu (typ_type) VALUES ("' . $psu_type . '")');
                $queryInsertType->execute();
            }

            $queryCom = $db->prepare('SELECT com_id FROM company where com_name LIKE "' . $psu_company . '"');
            $queryCom->execute();
            $responseCom = $queryCom->fetch();
            if (empty($responseCom)) {
                $queryInsertCom = $db->prepare('INSERT INTO company (com_name) VALUES ("' . $psu_company . '")');
                $queryInsertCom->execute();
            }

            $query = $db->prepare(self::INSERT_NEW_PIECE_PSU);
            $query->bindParam(":psu_name", $psu_name, PDO::PARAM_STR);
            $query->bindParam(":psu_watt", $psu_watt, PDO::PARAM_INT);
            $query->bindParam(":psu_company", $psu_company, PDO::PARAM_STR);
            $query->bindParam(":psu_type", $psu_type, PDO::PARAM_STR);
            $query->bindParam(":psu_amount", $psu_amount, PDO::PARAM_INT);
            $query->bindParam(":psu_prix", $psu_prix, PDO::PARAM_INT);
            $query->bindParam(":psu_path", $psu_path, PDO::PARAM_STR);
            $query->execute();
            return true;
        }
        else    
            return false;
    }

    public function insertNewRam($ram_name, $ram_type_ram, $ram_speed, $ram_company, $ram_amount, $ram_prix, $ram_path)
    {
        $db = $this->dbConnect();

        $testIfExist = $db->query('SELECT ram_id FROM ram WHERE ram_name LIKE "' . $ram_name . '"');
        if($testIfExist->rowCount() == 0){

            $queryType = $db->prepare('SELECT tyr_id FROM type_ram where tyr_type LIKE "' . $ram_type_ram . '"');
            $queryType->execute();
            $responseType = $queryType->fetch();
            if (empty($responseType)) {
                $queryInsertType = $db->prepare('INSERT INTO type_ram (tyr_type) VALUES ("' . $ram_type_ram . '")');
                $queryInsertType->execute();
            }

            $queryCom = $db->prepare('SELECT com_id FROM company where com_name LIKE "' . $ram_company . '"');
            $queryCom->execute();
            $responseCom = $queryCom->fetch();
            if (empty($responseCom)) {
                $queryInsertCom = $db->prepare('INSERT INTO company (com_name) VALUES ("' . $ram_company . '")');
                $queryInsertCom->execute();
            }

            $query = $db->prepare(self::INSERT_NEW_PIECE_RAM);
            $query->bindParam(":ram_name", $ram_name, PDO::PARAM_STR);
            $query->bindParam(":ram_type_ram", $ram_type_ram, PDO::PARAM_STR);
            $query->bindParam(":ram_speed", $ram_speed, PDO::PARAM_INT);
            $query->bindParam(":ram_company", $ram_company, PDO::PARAM_STR);
            $query->bindParam(":ram_amount", $ram_amount, PDO::PARAM_INT);
            $query->bindParam(":ram_prix", $ram_prix, PDO::PARAM_INT);
            $query->bindParam(":ram_path", $ram_path, PDO::PARAM_STR);
            $query->execute();
            
            return true;
        }
        else    
            return false;
    }

    public function insertNewStorage($sto_name, $sto_capacity, $sto_type_capacity, $sto_type_storage, $sto_company, $sto_amount, $sto_prix, $sto_path)
    {
        $db = $this->dbConnect();

        $testIfExist = $db->query('SELECT sto_id FROM storage WHERE sto_name LIKE "' . $sto_name . '"');
        if($testIfExist->rowCount() == 0){

            $queryTypeCap = $db->prepare('SELECT tys_id FROM type_storage where tys_type LIKE "' . $sto_type_storage . '"');
            $queryTypeCap->execute();
            $responseTypeCap = $queryTypeCap->fetch();

            if (empty($responseTypeCap)) {
                $queryInsertTypeCap = $db->prepare('INSERT INTO type_storage (tys_type) VALUES ("' . $sto_type_storage . '")');
                $queryInsertTypeCap->execute();
            }

            $queryType = $db->prepare('SELECT com_id FROM company where com_name LIKE "' . $sto_company . '"');
            $queryType->execute();
            $responseType = $queryType->fetch();
            if (empty($responseType)) {
                $queryInsertType = $db->prepare('INSERT INTO company (com_name) VALUES ("' . $sto_company . '")');
                $queryInsertType->execute();
            }

            $query = $db->prepare(self::INSERT_NEW_PIECE_STORAGE);
            $query->bindParam(":sto_name", $sto_name, PDO::PARAM_STR);
            $query->bindParam(":sto_capacity", $sto_capacity, PDO::PARAM_INT);
            $query->bindParam(":sto_type_capacity", $sto_type_capacity, PDO::PARAM_STR);
            $query->bindParam(":sto_type_storage", $sto_type_storage, PDO::PARAM_STR);
            $query->bindParam(":sto_company", $sto_company, PDO::PARAM_STR);
            $query->bindParam(":sto_amount", $sto_amount, PDO::PARAM_INT);
            $query->bindParam(":sto_prix", $sto_prix, PDO::PARAM_INT);
            $query->bindParam(":sto_path", $sto_path, PDO::PARAM_STR);
            $query->execute();
            return true;
        }
        else    
            return false;
    }

    //Va chercher toutes les pieces qui on le search dans : nom ou company ou type. Qui on une quantité > 0
    //Return : Si il y a des piece : un array d'objet Piece contenant les piece de la bd qui concorde
    //       : Si il n'y à pas de piece : void
    public function getAllPieceBySearchManager($search)
    {
        $db = $this->dbConnect();

        $query = $db->prepare(self::SELECT_ALL_PIECES_BY_SEARCH);
        $query->bindParam(":search", $search, PDO::PARAM_STR);
        $query->execute();
        $response = $query->fetchAll();

        $newArr = [];

        foreach ($response as $value) {
            array_push($newArr, new Piece($value));
        }
        if (count($newArr) > 0)
            return $newArr;
    }

    public function getAllPieceBySearchOutStockManager($search)
    {
        $db = $this->dbConnect();

        $query = $db->prepare(self::SELECT_ALL_PIECES_OUT_STOCK_BY_SEARCH);
        $query->bindParam(":search", $search, PDO::PARAM_STR);
        $query->execute();
        $response = $query->fetchAll();



        $newArr = [];

        foreach ($response as $value) {
            array_push($newArr, new Piece($value));
        }
        if (count($newArr) > 0)
            return $newArr;
    }

    //Va chercher toutes les pieces d'un type qui on une quantié > 0
    //Return : Si il y a des piece : un array d'objet Piece contenant les piece de la bd qui concorde
    //       : Si il n'y à pas de piece : void
    public function getPiecesByNameManager($piece)
    {

        $db = $this->dbConnect();

        $query = $db->prepare(self::SELECT_PIECES_BY_NAME_IN_STOCK);
        $query->bindParam(":piece", $piece, PDO::PARAM_STR);
        $query->execute();
        $response = $query->fetchAll();


        $newArr = [];

        foreach ($response as $value) {
            array_push($newArr, new Piece($value));
        }
        if (count($newArr) > 0)
            return $newArr;
    }

    //Va chercher toute les company des piece ayant quantité > 0 d'un type de pièce
    public function getCompanyByPieceManager($piece)
    {

        if ($piece == "motherboard")
            $company = "mbo_company";
        elseif ($piece == "pc_case")
            $company = "pca_company";
        else
            $company = (substr($piece, 0, 3) . "_company");

        $piece = $piece . " p";

        $select = 'SELECT DISTINCT com.com_name AS "company" FROM company com
                                            JOIN ' . $piece . ' ON p.' . $company . ' = com.com_id';

        $db = $this->dbConnect();

        $query = $db->prepare($select);
        $query->execute();
        $response = $query->fetchAll();

        return $response;
    }

    public function getPiecesByNameOfAllManager($piece)
    {
        $db = $this->dbConnect();

        $query = $db->prepare(self::SELECT_PIECES_BY_NAME);
        $query->bindParam(":piece", $piece, PDO::PARAM_STR);
        $query->execute();
        $response = $query->fetchAll();

        $newArr = [];

        foreach ($response as $value) {
            array_push($newArr, new Piece($value));
        }
        
        if (count($newArr) > 0)
            return $newArr;
    }


    public function getAllTypeByPieceManager($piece) {
        $db = $this->dbConnect();

        $select = 'SELECT DISTINCT type FROM allpiece WHERE typePiece LIKE "' . $piece . '";';

        $query = $db->query($select);
        $response = $query->fetchAll();

        return $response;
    }

    public function getAllCompanyByPieceManager($piece) {
        $db = $this->dbConnect();

        $select = 'SELECT DISTINCT company FROM allpiece WHERE typePiece LIKE "' . $piece . '";';

        $query = $db->query($select);
        $response = $query->fetchAll();

        return $response;
    }

    public function updateAmountById($id, $piece, $quantite) {

        try{
            if ($piece == "motherboard") {
                $quantiteS = "mbo_amount";
                $idS = "mbo_id";
            } elseif ($piece == "pc_case") {
                $quantiteS = "pca_amount";
                $idS = "pca_id";
            } else {
                $quantiteS = (substr($piece, 0, 3) . "_amount");
                $idS = (substr($piece, 0, 3) . "_id");
            }
    
            $update = "UPDATE {$piece}
                           SET {$quantiteS} = {$quantite} WHERE {$idS} = $id";
    
            $db = $this->dbConnect();
            $db->query($update);

        }
        catch(Exception $e) {
            echo "Update erreur : ". $e->getMessage();
        }
        
        return true;
    }
}
