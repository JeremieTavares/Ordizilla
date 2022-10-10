<?php
$title = "contact";
ob_start();
?>
<main class="contact">
    <h1>Notre succursale</h1>
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2801.128744784999!2d-71.88514508419792!3d45.406743345296064!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4cb7b307b0469941%3A0x3dc1840a301e21a4!2s15%20Rue%20du%20C%C3%A9gep%2C%20Sherbrooke%2C%20QC%20J1G%201B2!5e0!3m2!1sfr!2sca!4v1655769944220!5m2!1sfr!2sca" width="1000" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" class="iframe"></iframe>
    <p>15, rue du Cégep,<br />
        Sherbrooke, QC, J1E 2J4,<br />
        Téléphone : (819) 563-9383<br />
    </p>
    <hr />
    <h2>Nos heures d'ouverture</h2>
    <p>Lundi: 9H30 à 17h30<br />
        Mardi: 9H30 à 17h30<br />
        Mercredi: 9H30 à 17h30<br />
        Jeudi: 9H30 à 21h00<br />
        Vendredi: 9H30 à 21h00<br />
        ​Samedi: 9h30 à 17h<br />
        Dimanche: Fermé</p>
    <hr />
    <h2>Contactez-nous</h2>
    <div class="container-contact">
        <div class="flexible-contact">
            <img src="./inc/img/logoFacebook.png" alt="Facebook" class="facebook" />
            <a>Rejoignez-nous sur Facebook !</a>
        </div>
        <div class="flexible-contact">
            <img src="./inc/img/logoTwitter.png" alt="Twitter" class="twitter" />
            <a>Suivez-nous sur Twitter !</a>
        </div>
        <div class="flexible-contact">
            <img src="./inc/img/logoInstagram.png" alt="Instagram" class="instagram">
            <a>Partagez nos moments sur Instagram !</a>
        </div>
    </div>
    <hr />
    <h2>Écrivez-nous !</h2>
    <form action="index.php?page=receptionFormulaire" method="post" class="formulaire">
        <label for="email">Inscrivez l'adresse à laquelle on pourra vous rejoindre *</label>
        <input type="email" name="email" id="email" placeholder="Votre courriel..." />

        <label for="message">Indiquez votre message de manière la plus claire possible *</label>
        <textarea name="message" id="message" cols="50" rows="10" placeholder="Votre message..."></textarea>
        <div class="d-flex-justify-content-center">
            <button type="submit">Transmettre</button>
        </div>
    </form>
</main>
<?php
$content = ob_get_clean();
require_once('template.php');
?>