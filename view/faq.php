<?php
$title = "FAQ";
ob_start();
?>
<main class="faq-main">
    <h1>Foire aux questions</h1>
    <hr />
    <select id="testSelect">
        <option value="0">Vos produits sont-ils neufs ?</option>
        <option value="1">Où en est ma réparation?</option>
        <option value="2">Réparez vous autre chose que les ordinateurs?</option>
        <option value="3">Dois-je prendre rendez-vous?</option>
        <option value="4">Qu'est-ce qui n'est pas inclus dans la garantie?</option>
        <option value="5">Est-ce que vous pouvez récupérer mes données?</option>
        <option value="6">D'où viennent vos ordinateurs?</option>
        <option value="7">Quels outils utilisez vous?</option>
    </select>
    <div id="message">Nous avons parfois des produits neuf mais dans la majorité des cas il s'agit d'annulation de commande ou des ordinateurs reconditionné allant de 20 à 2000 heures d'utilisation. Ce n'est pas neuf mais pour un ordinateur ayant aussi peu d'heure à son compte autant dire qu'il l'ait. En plus c'est moins cher! Pour ce qui est de nos produits usagé, ils sont testé par nos fournisseurs et par nos soins également. Lorsqu'une pièce est a changer nous le faisons!</div>
    <hr />
    <p>N'hésitez pas à nous écrire si vous avez d'autres questions !</p>
    <a href="index.php?page=contact" id="FAQ-Contact">Contact</a>

</main>

<?php
$content = ob_get_clean();
require_once('template.php');
?>