<?php 

    // echo print_r($_GET);
    $url = $_GET["url"] ?? null;

    
    if($url == ""){
        header("Location: ./paginas/feed.php");
    }
    

?>