<?php 
    require_once("./model/AdminManager.php"); 

    function verifyLogin($username, $password, $sessionIsActive) {
        $manager = new AdminManager();

        $id = $manager->verifyLoginManager($username, $password);
        
        if($id >= 0) {
            $_SESSION["adminId"] = $id;
            require_once("./controller/controllerPiece.php");
            getPiecesByNamePost("cpu", $sessionIsActive);
        }
        else {          
            $err = "Le mot de passe ou le nom d'utilisateur est invalide";
            require_once("./view/login.php");
        }
    }

    function logout($sessionIsActive) {
        $_SESSION = [];
        session_destroy();
        require_once("./controller/controllerPiece.php");
        getPiecesByNamePost("cpu", $sessionIsActive);
    }

?>