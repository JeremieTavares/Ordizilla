<label for="nomPiece"><strong>Nom</strong> du model/piece</label>
<div class="divLock">
    <input type="text" name="nomPiece" id="nomPiece" class="inputModalAdd inputFiltered" placeholder="Nom item" />

    <button class="lockIcones" type="button" id="btnLock">
        <i class="fa-solid fa-lock-open"></i>
        <i class="fa-solid fa-lock displayNone"></i>
    </button>
</div>

<div>
    <div class="horizontalScroll">
        <?php foreach ($contentPiece as $value) {

            $tbl = $value->getAsTable();
        ?>
            <button type="button" class="produitName produitButtonForm">
                <p class="nomForm"><?= $tbl["nom"] ?></p>
                <p class="idForm displayNone"><?= $tbl["id"] ?></p>
                <p class="prixForm displayNone"><?= $tbl["prix"] ?></p>
                <p class="companyForm displayNone"><?= $tbl["company"] ?></p>
                <p class="vitesseForm displayNone"><?= $tbl["vitesse"] ?></p>
                <p class="typeForm displayNone"><?= $tbl["type"] ?></p>
                <p class="quantiteForm displayNone"><?= $tbl["quantite"] ?></p>
                <p class="uniteForm displayNone"><?= $contentPiece[0]->getWordByPiece()["unite"] ?></p>
            </button>

        <?php } ?>
    </div>
</div>

<label for="prixPiece"><strong>Prix</strong> (CAD $)</label>
<label for="quantitePiece"><strong>Quantité</strong> (En stock : <span class="enStock">0</span>)</label>
<input type="number" name="prixPiece" id="prixPiece" class="inputModalAdd" min="0" step="0.01" placeholder="Prix de l'item avant taxes" />
<input type="text" name="quantitePiece" id="quantitePiece" class="inputModalAdd" placeholder="Quantite a ajouter a l'inventaire" />

<?php if ($contentPiece[0]->besoinType()) { ?>
    <label for="typePiece"><strong><?= $contentPiece[0]->getWordByPiece()["type"] ?></strong></label>
    <?php
    if ($contentPiece[0]->get_typePiece() == "cooling") {
    ?>
        <select name="typePiece" id="typePiece">
            <option value="2">Water Cooling</option>
            <option value="1" selected>Air Cooling</option>
        </select>
    <?php
    } else {
    ?>
        <input type="text" name="typePiece" id="typePiece" class="inputModalAdd inputFiltered" placeholder="Type de l'item" />

        <div class="horizontalScroll">
            <?php foreach ($contentType as $value) { ?>

                <button type="button" class="produitButtonForm typeButton">
                    <p class="typeForm"><?= $value["type"] ?></p>
                </button>

            <?php } ?>
        </div>

<?php }
} ?>

<label for="fournisseurPiece"><strong>Fournisseur</strong></label>
<input type="text" name="fournisseurPiece" id="fournisseurPiece" class="inputModalAdd inputFiltered" placeholder="Fournisseur de l'item" />
<div class="horizontalScroll">
    <?php foreach ($contentCompany as $value) { ?>

        <button type="button" class="produitButtonForm companyButton">
            <p class="companyForm"><?= $value["company"] ?></p>
        </button>

    <?php } ?>
</div>


<?php if ($contentPiece[0]->besoinVitesseWatt()) { ?>

    <label for="frequancePiece"><strong><?= $contentPiece[0]->getWordByPiece()["vitesse"] ?></strong> (<span class="unite"><?= $contentPiece[0]->getWordByPiece()["unite"] ?></span>)</label>
    <input type="text" name="frequancePiece" id="frequancePiece" class="inputModalAdd" placeholder="frequance de l'item" />

<?php } ?>

<div class="divFile-input" id="divFile">
    <input type="file" id="file" name="imageProduit" class="file" />
    <label for="file">
        Choisissez une image
        <i class="fa-solid fa-file-image"></i>
    </label>
</div>

<!-- <input type="file" name="imageProduit" id="imageProduit" accept="image/jpeg, image/png, image/jpg" /> -->
</script>
<input type="hidden" name="id" value="-1" />
<input type="hidden" name="action" value="AddOrUpdateProduct" />