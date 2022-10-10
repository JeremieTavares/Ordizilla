<?php 

    require_once('model/Manager.php');

    class AdminManager extends Manager {

        private const SELECT_USERNAME_AND_PASSWORD = "SELECT adm_id, adm_password FROM admin WHERE adm_username LIKE :username";

        public function verifyLoginManager($username, $password) {
            $db = $this->dbConnect();

            $query = $db->prepare(self::SELECT_USERNAME_AND_PASSWORD);
            $query->bindParam("username", $username, PDO::PARAM_STR);
            $query->execute();
            $response = $query->fetch();

            if(isset($response["adm_password"]) && password_verify($password, $response["adm_password"]))
                return $response["adm_id"];
            
                return -1;

        }
    }

?>