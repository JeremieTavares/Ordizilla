<!DOCTYPE html>
<html lang="fr-ca">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="./inc/css/style.css">
    <script src="https://kit.fontawesome.com/efba2f86ba.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="./node_modules/@splidejs/splide/dist/css/splide.min.css">
    <script src="./node_modules/@splidejs/splide/dist/js/splide.js"></script>

    <script src="./inc/js/app.js" defer></script>

    <title><?= $title ?></title>
</head>

<body class="<?= (isset($bodyClass) ? $bodyClass : "") ?>">
    <header>
        <div class="container-flexible">
            <a href="index.php">
                <img src="./inc/img/logoHeader.png" alt="Logo OrdiZilla" />
            </a>
            <div class="flexible">
                <form class="search-barre" method="get" action="index.php">
                    <input type="search" placeholder="Rechercher..." id="search" name="search">
                    <input type="hidden" name="page" value="product">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>

                <div class="shopping-cart displayNone">
                    <i class="fa-solid fa-cart-shopping"></i>
                </div>
                <div class="container">
                    <input type="checkbox" class="checkbox" id="chk">
                    <label class="label" for="chk">
                        <i class="fa-solid fa-sun"></i>
                        <i class="fas fa-moon"></i>
                        <div class="ball"></div>
                    </label>
                </div>
                <?php if (isset($_SESSION["adminId"])) { ?>
                    <a href='./index.php?action=logout' class="logout">Se déconnecter</a>
                <?php } ?>
                <button class="burger displayNone">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
            </div>
        </div>
        <div class="container_nav">
            <nav>
                <ul class="nav_list">
                    <li class="nav_item"><a href="index.php">Accueil</a></li>
                    <li class="nav_item container_underlist">
                        Produit<i class="fa-solid fa-caret-down"></i>
                        <ul class="nav_underList">
                            <div>
                                <li class="nav_item"><a href="index.php?page=product&article=cpu">Processeur</a></li>
                                <li class="nav_item"><a href="index.php?page=product&article=gpu">Carte graphique</a></li>
                                <li class="nav_item"><a href="index.php?page=product&article=ram">Mémoire</a></li>
                                <li class="nav_item"><a href="index.php?page=product&article=storage">Stockage</a></li>
                                <li class="nav_item"><a href="index.php?page=product&article=motherboard">Carte mère</a></li>
                                <li class="nav_item"><a href="index.php?page=product&article=cooling">Refroidissement</a></li>
                                <li class="nav_item"><a href="index.php?page=product&article=psu">Alimentation</a></li>
                                <li class="nav_item"><a href="index.php?page=product&article=pc_case">Boitier</a></li>
                            </div>

                        </ul>
                    </li>
                    <li class="nav_item"><a href="index.php?page=faq">
                            <div>FAQ</div>
                        </a></li>
                    <li class="nav_item"><a href="index.php?page=contact">
                            <div>Contact</div>
                        </a></li>
                </ul>
            </nav>
        </div>
    </header>

    <?= $content ?>

    <footer>
        <div class="flex-container">
            <div>
                <div class="container">
                    <p>Suivez nous :</p>
                    <div class="flex">
                        <a href="https://www.facebook.com"><i class="fa-brands fa-facebook"></i></a>
                        <a href="https://www.twitter.com"> <i class="fa-brands fa-twitter"></i></a>
                        <a href="https://www.instagram.com"> <i class="fa-brands fa-instagram"></i></a>
                    </div>
                </div>
                <div class="flex-items">
                    <p>Communiquer avec nous :</p>
                    <p>Tel : (819) 563-9383<br />
                        Courriel : ordizilla@ordi.ca<br />
                        Location : 111 rue Secrete, Sherbrooke</p>
                </div>
            </div>
            <p class="copyright">&#169; 2022 - Jeremie Lachapelle | Tous droits réservés</p>
            <div class="flex-items">
                <p>Informations :</p>
                <a href="index.php?page=piedDePage&view=termeServices">Termes de services</a>
                <a href="index.php?page=piedDePage&view=politiqueDachats">Politique d'achats en ligne</a>
                <a href="index.php?page=piedDePage&view=politiqueConfid">Politique de confidentialité</a>
                <a href="index.php?page=piedDePage&view=politiqueRetours">Politique de retours</a>
                <a href="index.php?page=piedDePage&view=possibEmplois">Possibilitées d'emploi</a>
            </div>
        </div>
    </footer>
</body>