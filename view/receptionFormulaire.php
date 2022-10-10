<?php
$title = "receptionFormulaire";
ob_start();
?>

<main>

    <h1>Réception du formulaire</h1>
    <h2>Votre formulaire a bien été transmis !</h2>
    <p>Nous vous recontacterons dans les plus brefs délais. Ordzilla vous remercie !</p>

</main>

<?php
$content = ob_get_clean();
require_once('template.php');
?>