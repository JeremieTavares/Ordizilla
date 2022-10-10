<?php
$title = "Accueil";
ob_start();
?>


<main class="mainAccueil">
    <h1 class="displayNone">Accueil</h1>
    <div class="containerBanner">
        <a href="index.php?page=product&article=motherboard">
            <img src="./inc/img/fwebp.webp" alt="baniere de la compagnie">
        </a>
    </div>
    <div class="accueilDiv">
        <div class="containerCards">
            <h2>Nos produits en vente</h2>
            <div class="splide">
                <div class="splide__track">
                    <ul class="splide__list">
                        <li class="splide__slide">
                            <div>
                                <a href="index.php?page=product&article=cpu">

                                    <img src="./inc/img/cpu_2.png" alt="logo cpu">
                                    <p>Processeur</p>

                                </a>
                            </div>
                        </li>
                        <li class="splide__slide">
                            <div>
                                <a href="index.php?page=product&article=gpu">

                                    <img src="./inc/img/graphics-card.png" alt="logo gpu">
                                    <p>Carte Graphique</p>

                                </a>
                            </div>
                        </li>
                        <li class="splide__slide">
                            <div>
                                <a href="index.php?page=product&article=ram">

                                    <img src="./inc/img/ram_1.png" alt="logo ram">
                                    <p>Mémoire</p>

                                </a>
                            </div>
                        </li>
                        <li class="splide__slide">
                            <a href="index.php?page=product&article=storage">

                                <img src="./inc/img/ssd-drive_1.png" alt="logo ssd">
                                <p>Stockage</p>

                            </a>
                        </li>
                        <li class="splide__slide">
                            <a href="index.php?page=product&article=motherboard">

                                <img src="./inc/img/motherboard_1.png" alt="logo motherboard">
                                <p>Carte mère</p>

                            </a>
                        </li>
                        <li class="splide__slide">
                            <a href="index.php?page=product&article=cooling">

                                <img src="./inc/img/fan.png" alt="logo cooling">
                                <p>Refroidissement</p>

                            </a>
                        </li>
                        <li class="splide__slide">
                            <a href="index.php?page=product&article=psu">

                                <img src="./inc/img/power-supply.png" alt="logo power supply">
                                <p>Alimentation</p>

                            </a>
                        </li>
                        <li class="splide__slide">
                            <a href="index.php?page=product&article=pc_case">

                                <img src="./inc/img/pc-tower_1.png" alt="logo case">
                                <p>Boitier</p>

                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <script>
                new Splide('.splide', {
                    type: 'loop',
                    perPage: 4,
                    perMove: 1,
                    gap: "2rem",
                    breakpoints: {
                        992: {
                            perPage: 3,
                        },
                        768: {
                            perPage: 2,
                        },
                    }
                }).mount();
            </script>
        </div>

        <hr class="breakLine">
        <h2 class="services">Services Offerts</h2>
        <div class="containerServices1">
            <div class="iconServices">
                <img src="./inc/img/iconReparation.png" alt="icon de reparation" />
                <p>Réparation d'ordinateur</p>
            </div>
            <div class="iconServices">
                <img src="./inc/img/iconVirus.png" alt="icon de virus" />
                <p>Nettoyage de virus</p>
            </div>
        </div>
        <div class="containerServices2">
            <div class="iconServices">
                <img src="./inc/img/iconDb.png" alt="icon de database" />
                <p>Sauvegarde de données</p>
            </div>
            <div class="iconServices">
                <img src="./inc/img/iconWindows.png" alt="icon de windows" />
                <p>Installation de Windows</p>
            </div>
        </div>
        <div class="containerServices3">
            <div class="iconServices">
                <img src="./inc/img/iconServer.png" alt="icon de server" />
                <p>Transfert de données</p>
            </div>
            <div class="iconServices">
                <img src="./inc/img/iconMAJ.png" alt="icon de mise a jour" />
                <p>Mise à jour de logiciels</p>
            </div>
        </div>
        <hr class="breakLine">
        <div class="containerMarques">
            <h3>Nos marques offertes</h3>
            <br />
            <img class="marquesImg" src="./inc/img/marques.png" alt="baniere des marques" />
        </div>
    </div>
    </div>
</main>


<?php
$content = ob_get_clean();
require_once('template.php');
?>