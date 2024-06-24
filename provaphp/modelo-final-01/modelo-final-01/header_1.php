<nav class="navbar">

    <?php
    require_once "config/sessao.php";
    if(isset($_SESSION['usu'])){
        echo  '<a href="./feed.php"><button class="nav-button btn-secondary">Feed</button></a>';
        echo '<a href="./perfil.php?usr=1"><button class="nav-button btn-secondary">Meu Perfil</button></a>';
        echo '<a href="./logout.php"><button class="nav-button btn-red">Logout</button></a>';
    }else{
        echo  '<a href="./feed.php"><button class="nav-button btn-secondary">Feed</button></a>';
        echo  '<a href="./login.php"><button class="nav-button btn-success">Login</button></a>';
        echo '<a href="./novoUsuario.php"><button class="nav-button btn-dark">Criar Usuario</button></a>';
    }
    ?>
    
</nav>