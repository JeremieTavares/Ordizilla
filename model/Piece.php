<?php 
//classe de pièce
class Piece {

    private $_id,
            $_typePiece,
            $_nom,
            $_company,
            $_vitesseWatt,
            $_type,
            $_typeCapacity,
            $_quantite,
            $_typeVitesseOrWatt,
            $_prix,
            $_path;

    public function __construct($params = array()) {
        foreach ($params as $key => $value) {

            $methodName = "set_" . $key;
            if (method_exists($this, $methodName)) {
                 $this->$methodName($value);
                }
            }

            if($params["typePiece"] == "cpu") {
                $this->_typeVitesseOrWatt = "GHz";
            }
            elseif($params["typePiece"] == "gpu" || $params["typePiece"] == "psu") {
                $this->_typeVitesseOrWatt = "W";
            }
            elseif($params["typePiece"] == "cooling") {
                $this->_typeVitesseOrWatt = "RPM";
            }
            elseif($params["typePiece"] == "ram") {
                $this->_typeVitesseOrWatt = "MHz";
            }
            elseif($params["typePiece"] == "storage") {
                $this->_typeVitesseOrWatt = $this->_typeCapacity;
            }

        }

    //GETTER

    public function get_typePiece() : string
    {
        return $this->_typePiece;
    }
     
    public function get_nom() : string
    {
                return $this->_nom;
    }
       
    public function get_company() : string
    {
                return $this->_company;
    }
   
    public function get_vitesseWatt() : int
    {
                return $this->_vitesseWatt;
    }
   
    public function get_type() : string
    {
                return $this->_type;
    }
 
    public function get_typeCapacity() : string
    {
                return $this->_typeCapacity;
    }

    public function get_typeVitesseOrWatt()
    {
                return $this->_typeVitesseOrWatt;
    }

    public function get_prix()
    {
                return $this->_prix;
    }

    public function get_quantite()
    {
                return $this->_quantite;
    }

    public function get_id()
    {
        return $this->_id;
    }
    public function get_path() : string
    {
        return $this->_path;
    }
          
    //SETTER    

    public function set_typePiece(string $_typePiece) : void
    {
        $this->_typePiece = $_typePiece;
    }

    public function set_nom(string $_nom) : void
    {
                $this->_nom = $_nom;
    }

    public function set_company(string $_company) : void
    {
                $this->_company = $_company;
    }

    public function set_vitesseWatt($_vitesseWatt) : void
    {
                $this->_vitesseWatt = $_vitesseWatt;
    }

    public function set_type($_type) : void
    {
                $this->_type = $_type;
    }

    public function set_typeCapacity($_typeCapacity) : void
    {
                $this->_typeCapacity = $_typeCapacity;
    }

    public function set_typeVitesseOrWatt($_typeVitesseOrWatt)
    {
                $this->_typeVitesseOrWatt = $_typeVitesseOrWatt;
    }

    public function set_prix($_prix)
    {
                $this->_prix = $_prix;
    }

    public function set_quantite($_quantite)
    {
                $this->_quantite = $_quantite;
    }

    public function set_id($_id)
    {
        $this->_id = $_id;
    }
    
    public function set_path(string $_path) : void
    {
        $this->_path = $_path;
    }


    public function get_nom_piece() : string {
        
        switch ($this->_typePiece) {
            case 'cpu':
                return "Processeur";
                break;
            case 'cooling':
                return "Refroidissement";
                break;
            case 'gpu':
                return "Carte graphique";
                break;
            case 'motherboard':
                return "Carte mère";
                break;
            case 'pc_case':
                return "boitier ordinateur";
                break;
            case 'psu':
                return "Alimentation";
                break;
            case 'ram':
                return "Mémoire";
                break;
            case 'storage':
                return "Storage";
                break;
            
            default:
                return "autre";
                break;
        }

    }

    public function besoinVitesseWatt() {
        switch ($this->_typePiece) {
            case 'cpu':
                return true;
                break;
            case 'cooling':
                return true;
                break;
            case 'gpu':
                return true;
                break;
            case 'motherboard':
                return false;
                break;
            case 'pc_case':
                return false;
                break;
            case 'psu':
                return true;
                break;
            case 'ram':
                return true;
                break;
            case 'storage':
                return true;
                break;
            
            default:
                return false;
                break;
    }
    }

    public function afficherVitesseWatt() {
        switch ($this->_typePiece) {
            case 'cpu':
                return "<p>Fréquence : </p><p>" . $this->_vitesseWatt . " " . $this->_typeVitesseOrWatt . "</p>";
                break;
            case 'cooler':
                return "<p>Vitesse : </p><p>" . $this->_vitesseWatt . " " .  $this->_typeVitesseOrWatt . "</p>";
                break;
            case 'gpu':
                return "<p>Wattage : </p><p>" . $this->_vitesseWatt . " " .  $this->_typeVitesseOrWatt . "</p>";
                break;
            case 'psu':
                return "<p>Wattage : </p><p>" . $this->_vitesseWatt . " " .  $this->_typeVitesseOrWatt . "</p>";
                break;
            case 'ram':
                return "<p>Fréquence : </p><p>" . $this->_vitesseWatt . " " .  $this->_typeVitesseOrWatt . "</p>";
                break;
            case 'storage':
                return "<p>Taille : </p><p>" . $this->_vitesseWatt . " " .  $this->_typeVitesseOrWatt . "</p>";
                break;
        }
    }

    public function besoinType() {
        switch ($this->_typePiece) {
            case 'cpu':
                return true;
                break;
            case 'cooling':
                return true;
                break;
            case 'motherboard':
                return true;
                break;
            case 'pc_case':
                return true;
                break;
            case 'psu':
                return true;
                break;
            case 'ram':
                return true;
                break;
            case 'storage':
                return true;
                break;
            default:
                return false;
                break;
        }
    }

    public function affichageType() {
        switch ($this->_typePiece) {
            case 'cpu':
                return "<p>Génération : </p><p>" . $this->_type . "</p>";
                break;
            case 'cooling':
                return "<p>Type : </p><p>" . ($this->_type ? "Avec eau" : "Sans eau") . "</p>";
                break;
            case 'psu':
                return "<p>Taille : </p><p>" . $this->_type . "</p>";
                break;
            case 'motherboard':
                return "<p>Taille : </p><p>" . $this->_type . "</p>";
                break;
            case 'ram':
                return "<p>Génération : </p><p>" . $this->_type . "</p>";
                break;
            case 'storage':
                return "<p>Type : </p><p>" . $this->_type . "</p>";
                break;
        }

    }


    public function getWordByPiece() {
        switch ($this->_typePiece) {
            case 'cpu':
                    return array(
                        "vitesse"=>"Fréquence",
                        "type"=>"Génération",
                        "unite"=>$this->_typeVitesseOrWatt
                    );
                break;
            case 'cooling':
                    return array(
                        "vitesse"=>"Tour par minute",
                        "type"=>"Type",
                        "unite"=>$this->_typeVitesseOrWatt
                    );
                break;
            case 'gpu':
                return array(
                    "vitesse"=>"Wattage",
                    "unite"=>$this->_typeVitesseOrWatt
                );
                break;
            case 'psu':
                return array(
                    "vitesse"=>"Wattage",
                    "type"=>"Taille",
                    "unite"=>$this->_typeVitesseOrWatt
                );
                break;
            case 'ram':
                return array(
                    "vitesse"=>"Fréquence",
                    "type"=>"Génération",
                    "unite"=>$this->_typeVitesseOrWatt
                );
                break;
            case 'storage':
                return array(
                    "vitesse"=>"Taille",
                    "type"=>"Type",
                    "unite"=>"Go"
                );
                break;
                case 'motherboard':
                    return array(
                        "type"=>"Taille"
                    );
                    break;
                case 'pc_case':
                    return array(
                        "type"=>"Taille"
                    );
                    break;
        }
    }

    function getAsTable() {

            return array(
                "id"=>$this->_id,
                "nomPiece"=>$this->get_nom_piece(),
                "nom"=>$this->_nom,
                "company"=>$this->_company,
                "vitesse"=>($this->besoinVitesseWatt() ? $this->_vitesseWatt : $this->_vitesseWatt),
                "type"=>($this->besoinType() ? $this->_type : ""),
                "prix"=>$this->_prix,
                "quantite"=>$this->_quantite,
                "path"=>$this->_path
            );
    }

    
}
?>