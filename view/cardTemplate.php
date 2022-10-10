

<div class="filter">
    <h2>Filtre</h2>
    

    <form action="javascript:void(0)" method="post" id="form_filter">
    <?php if(isset($contentCompany)) { ?>
        <fieldset class="fournisseur">
            <div  class="gridColumn">
                <h3>Fournisseur</h3>
                <!-- Génération par js -->
                <?php
                    foreach ($contentCompany as $value) {
                ?>
                        <label for="<?= $value["company"] ?>"><?= $value["company"] ?></label>
                        <input type="checkbox" name="<?= $value["company"] ?>" id="<?= $value["company"] ?>" checked="checked" />
                <?php
                    }
                ?>
            </div>
        </fieldset>
        <?php } ?>
        <fieldset class="gridRow FromPrix">
            <h3>Prix</h3>
            <div>
                <label for="min">Min</label>
                <label for="max">Max</label>
                <input type="number" name="min" id="min" min="0" />
                <input type="number" name="max" id="max" min="0" />
            </div>
        </fieldset>
        <button id="filterButton" type="submit"><div><i class="fa-solid fa-filter"></i><i class="fa-solid fa-filter-circle-xmark"></i></div></button>
    </form>
</div>
<div class="produits">
    <!-- Génération par js -->
    
    <?php
    if(isset($contentPiece))
    {
        foreach ($contentPiece as $value) {?>
            <div class="produitCard">
                <?php if(isset($_SESSION["adminId"])) { ?>

                <div class="cardButtonMod">
                    <button class="delete" id="<?=$value->get_typePiece() ."-". $value->get_id()?>">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                
                <?php
                    } 
                ?>
                <img src="./inc/imagesProduits/<?=$value->get_path()?>" alt="imageProduit <?= $value->get_nom() ?>">
                <div class="textCard">
                    <p class="nom"><?= $value->get_nom() ?></p>
                    <p class="prix"><?= $value->get_prix() ?> $</p>
                    
                    <div class="hiddenCard">
                        <h3>Info supplémentaire</h3>

                        <p>Type de pièce : </p><p class="typePiece"><?= $value->get_nom_piece() ?></p>
                        <p>Fournisseur : </p><p class="company"><?= $value->get_company() ?></p>
                        <?php 
                            if($value->besoinVitesseWatt()) {
                        ?>        
                                <?= $value->afficherVitesseWatt(); ?>
                        <?php
                            }

                            if($value->besoinType()) {
                        ?>

                            <?= $value->affichageType(); ?>

                        <?php
                            }
                        ?>

                        <p>Quantité : </p><p class="quantite"><?= $value->get_quantite() ?></p>
                    </div>
                </div>
                    <button class="openHiddenCard"><div><img src="./inc/img/down-arrow.png" alt=""></div></button>
            </div>
    <?php 
        } 
    }
    else {
    ?>
        <p class="erreurNoArticle">Aucun article disponible...</p>
    <?php
    }
    ?>
    
</div>