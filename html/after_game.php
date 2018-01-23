<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SeeUPlay - lost</title>
    <link rel="stylesheet" type="text/css" href="end.css">
    <link rel="stylesheet" type="text/css" href="hiscore.css">
</head>
<body>
    <div>
        <img id="img_home" src="img/home.jpg" width="100%">
    </div>
    <div>
    <?php 
    $imageId=1;//id du jeu
    $my_end=2;//0: perdu 1:gagné mais score<=hiscore 2:gagné et score>hiscore
    ?>
        <img class="pres_end" src="img/game0<?php echo $imageId;?>.png">
    </div>
    <?php
    if ($my_end==0):?>
    <div>
        <h1 class="pres_text">The CPU has won so your score is not validated.</h1>
        <?php
        display_links();
        ?>
    </div>
    <?php elseif($my_end==1):?>
    <div>
        <h1 class="pres_text">Congratulations you have defeated the CPU but you have not beaten your hiscore !</h1>
        <?php
        display_links();
        display_challenge();
        ?>
    </div>
    <?php elseif($my_end==2):?>
    <div>
        <h1 class="pres_text">Congratulations you have defeated the CPU and you have a new hiscore !</h1>
        <?php
        display_links();
        display_challenge();
        ?>
    </div>
    
    <?php endif;?>
    <?php
    function display_links(){?>
        <div class="pres_text">
            <a href="">Play Again</a>      <a href="">Homepage</a>
        </div>
    <?php } ?>
    <?php
    function display_challenge(){?>
        <h1 class="pres_text">You can challenge a friend if you want.</h1>
        <div class="my_form">
            <form method="GET">
                <input type="text" name="friendemail" placeholder="Email of your friend">
                <input type="submit" value="Challenge">
            </form>
        </div>
    <?php } ?>

    <div id="hicontainer">
    <?php 
    /*$bdd= new PDO('mysql:host=localhost;dbname=news;charset=utf8','root','');
    $reponse=$bdd->query('SELECT * from mes_news');
    $tab_hiscore=$reponse->fetch();*/
    $tab_hiscore=Array();
    $tab_hiscore[]=array('rank'=>'01','nick'=>'Pseudo01','score'=>1000);
    $tab_hiscore[]=array('rank'=>'02','nick'=>'Pseudo02','score'=>900);
    $tab_hiscore[]=array('rank'=>'03','nick'=>'Pso03','score'=>800);
    $tab_hiscore[]=array('rank'=>'04','nick'=>'Pseudo04','score'=>700);
    $tab_hiscore[]=array('rank'=>'05','nick'=>'Pseudo05','score'=>600);
    $tab_hiscore[]=array('rank'=>'06','nick'=>'Pseudo06','score'=>500);
    $tab_hiscore[]=array('rank'=>'07','nick'=>'Pseudo07','score'=>400);
    $tab_hiscore[]=array('rank'=>'08','nick'=>'Pseudo08','score'=>300);
    $tab_hiscore[]=array('rank'=>'09','nick'=>'Pseudo09','score'=>200);
    $tab_hiscore[]=array('rank'=>'10','nick'=>'Pseudo10','score'=>100);
    ?>
    <table id="hiscore">
     <tr>
      <th>Rank</th>
      <th>Nickname</th>
      <th>Score</th>
     </tr>    
     <?php
     for($i=0; $i<sizeof($tab_hiscore); $i++){
        echo "<tr>";
        foreach($tab_hiscore[$i] as $key=>$value){
            echo "<td>".$value."</td>";
        }
        echo "</tr>";
     }
     ?>
   </table>
    </div>
</body>
</html>