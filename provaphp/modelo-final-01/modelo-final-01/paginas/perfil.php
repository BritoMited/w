<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feed</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght@20..48,400..700" />
    <link rel="stylesheet" href="style.css">
</head>
<body>


    <?php 
        
        require_once "../config/banco.php";
        require_once "../classes/Usuario.php";
        include_once "../config/enviarImagem.php";
        include_once "../header.php";
        require_once "../config/sessao.php";

        $codUsuario =  $_SESSION['codUsu'] ?? null;
        $textoNovoPost = $_POST["textoPost"] ?? null;
        $imagemNovoPost = $_POST["imagemPost"] ?? null;
        
        // echo var_dump($textoNovoPost); // apenas debug
        // echo var_dump($imagemNovoPost); // apenas debug

        if(is_null($codUsuario)){
            die("Nenhum Usuario - Abrir usuario logado depois");
        }

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            // se estou no meu perfil posso postar
            if($codUsuario == $_SESSION['codUsu']){

                // ver se o formulário foi enviado
                if ($_SERVER["REQUEST_METHOD"] == "POST") {
                    $imagemNovoPost = enviarImagem();
                    adicionarPostagem($codUsuario, $textoNovoPost, $imagemNovoPost);
                } 

            }
        }

        
        $usuario = pegarUsuario($_GET['usr']);
        
    ?>

    <main>
        <div style="width: 100%;">
            
            <div class="single-post-container" style="margin-top: 20px;">
                <?php
                
                Usuario::cartaoUsuario($usuario->imagem, $usuario->nome);
                
                ?>
            </div>

            <?php
            
            if($codUsuario == $_GET['usr']){
             echo  ' <div class="single-post-container" style="margin-top: 20px;">';
             echo  '<h2>Nova Postagem</h2>';

             echo  '<form action="" method="post" enctype="multipart/form-data">';
             echo     ' <input type="text" name="textoPost">';
             echo     ' <br><br><input type="file" name="imagemPost">';
             echo    '  <br><br><button type="submit" class="btn-blue">Comentar</button>';
             echo  '</form>';
             echo    '</div>';
            }
            
            ?>
           
            

            <h2>Outras Postagens</h2>

            <div class="social-card-container">
                
                <?php 
                
                    $postagens = pegarPostagens($codUsuario);
                    // echo var_dump($postagens); // apenas debug

                    for ($i=0; $i < count($postagens); $i++) { 
                        $p = $postagens[$i];
                        //-- descomentar ao arrumar import
                        //-- Postagem::gerarPostCard($p->cod, $p->imagem, $p->nome, $p->texto_post, $p->post_img, $p->likes, 0);    
                    }
                ?>
            </div>
        </div>
    </main>

</body>
</html>