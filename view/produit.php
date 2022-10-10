<!--
    Contient la page produit.

    Contient la page cardTemplate.php qui change  
    dynamiquement par rapport à la demande de l'index.

-->

<?php
$title = (isset($_SESSION["adminId"]) ? "Produit Admin" : "Produit");

ob_start();
?>

<main>
    <!-- <h1>Nos produit</h1> -->
    <div class="splide">
        <div class="splide__track">
            <ul class="splide__list">
                <li class="splide__slide">
                    <div>
                        <button value="cpu">
                            <img src="./inc/img/cpu_2.png" alt="">
                            <p>Processeur</p>
                        </button>
                    </div>
                </li>
                <li class="splide__slide">
                    <div>
                        <button value="gpu">
                            <img src="./inc/img/graphics-card.png" alt="">
                            <p>Carte Graphique</p>
                        </button>
                    </div>
                </li>
                <li class="splide__slide">
                    <div>
                        <button value="ram">
                            <img src="./inc/img/ram_1.png" alt="">
                            <p>Mémoire</p>
                        </button>
                    </div>
                </li>
                <li class="splide__slide">
                    <button value="storage">
                        <img src="./inc/img/ssd-drive_1.png" alt="">
                        <p>Stockage</p>
                    </button>
                </li>
                <li class="splide__slide">
                    <button value="motherboard">
                        <img src="./inc/img/motherboard_1.png" alt="">
                        <p>Carte mère</p>
                    </button>
                </li>
                <li class="splide__slide">
                    <button value="cooling">
                        <img src="./inc/img/fan.png" alt="">
                        <p>Refroidissement</p>
                    </button>
                </li>
                <li class="splide__slide">
                    <button value="psu">
                        <img src="./inc/img/power-supply.png" alt="">
                        <p>Alimentation</p>
                    </button>
                </li>
                <li class="splide__slide">
                    <button value="pc_case">
                        <img src="./inc/img/pc-tower_1.png" alt="">
                        <p>Boitier</p>
                    </button>
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

    <?php
    if (isset($_SESSION["adminId"])) {
    ?>
        <section class="addCardForm">
            <div>
                <button class="showAddForm">
                    <p>Ajouter un produit</p>
                    <i class="fa-solid fa-circle-plus"></i>
                </button>
                <?php
                if (isset($_GET["err"])) {
                    echo '<p>La pièce "' . $_GET["err"] . '" existe déjà dans la base de donnée, elle n\'a donc pas été ajouté.</p>';
                }
                ?>
            </div>


            <div class="modalAddForm displayNone">
                <div>
                    <button class="closeModalAddProduit"><i class="fa-solid fa-xmark"></i></button>
                    <h2>Ajouter un produit</h2>
                    <form action="index.php" method="POST" enctype="multipart/form-data">
                        <div class="formAddGrid">
                            <label for="choixPieces"><strong>Quel type de piece</strong> voulez ajoutez a l'inventaire :</label>
                            <select name="choixPieces" id="choixPieces" class="inputModalAdd">
                                <option value="none">Choisissez une pièce</option>
                                <option value="cpu">Processeur</option>
                                <option value="gpu">Carte graphique</option>
                                <option value="ram">Memoire</option>
                                <option value="storage">Stockage</option>
                                <option value="motherboard">Carte mere</option>
                                <option value="cooling">Refroidissement</option>
                                <option value="psu">Alimentation</option>
                                <option value="pc_case">Boitier</option>
                            </select>

                            <div class="dynamicForm">

                            </div>

                        </div>

                        <p class="errAdd"></p>
                        <button type="submit" id="bouttonSubmitAdd">
                            <p>Ajouter le produit</p>
                            <i class="fa-solid fa-circle-plus"></i>
                        </button>
                    </form>
                </div>
            </div>

            <div class="modalDelete displayNone">
                <div>
                    <button class="closeModalDelete"><i class="fa-solid fa-xmark"></i></button>
                    <h3>Que souhaitez-vous faire?</h3>
                    <p id="updateOrDeletePModal"><strong>Supprimer de la base de données</strong> <br />ou <br /><strong>modifier la quantité disponible</strong> pour ce produit? </p>
                    <div>

                        <button id="buttonDeleteCard">
                            Supprimer
                        </button>
                        <button id="buttonShowFormUpdate">
                            Modifier
                        </button>
                    </div>
                    <div class="formUpdate displayNone">
                        <form action="javascript:void(0)" method="post">
                            <label for="amountFormUpdate">Changer la quantité :</label>
                            <input type="number" name="amountFormUpdate" id="amountFormUpdate" min="0">
                            <input type="hidden" name="idFormUpdate" id="idFormUpdate">
                            <button type="button" id="formUpdateButton" id="formUpdateButton">
                                Modifier
                            </button>
                        </form>
                    </div>
                </div>
            </div>

        </section>

    <?php
    }
    ?>


    <section class="containerProduit">
        <?php require_once('cardTemplate.php'); ?>
    </section>

</main>


<?php
$content = ob_get_clean();
require_once('template.php');
?>