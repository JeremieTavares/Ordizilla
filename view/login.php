<!--
    Contient la page produit.

    Contient la page cardTemplate.php qui change  
    dynamiquement par rapport à la demande de l'index.

-->

<?php
    $title = "Login";
    $bodyClass = "bodyLogin";
    ob_start();
?>

<main class="login">
    
    <div class="containerLogin">
        <h1>Se connecter : </h1>
        
            <?php if(isset($err)) echo "<div id='divErrorLogin'> $err </div> "?>
        
        <form action="index.php" method="post">
            <input type="text" name="username" placeholder="Nom d'utilisateur" />
            <input type="password" name="password" placeholder="Mot de passe" />
            <input type="hidden" name="action" value="loginAdmin" />
            <input type="submit" value="Se connecter" />
        </form>
    </div>

</main>


<?php
    $content = ob_get_clean();
    require_once('template.php');
?>

