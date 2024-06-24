<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feed</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght@20..48,400..700" />
</head>
<body>

    <?php 
        require_once "../config/banco.php";
        require_once "../classes/Postagem.php";
        include_once "../header.php";
        require_once "../config/sessao.php";
        $listaPost = pegarPostagens(null);
    ?>

    <main>
        <div class="social-card-container">
            <?php 
                    // Gerar um card de postagem
                    
                    foreach ($listaPost as $lp) {
                        $quant = quantidadeDeComentarios($lp->cod);
                        Postagem::gerarPostCard($lp->cod, $lp->imagem, $lp->nome,  $lp->texto_post , $lp->post_img, $lp->likes, $quant);
                    }
                ?>

                

        </div>
    </main>

</body>
</html>