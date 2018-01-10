<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>hiscore</title>
    <link rel="stylesheet" type="text/css" href="hiscore.css">
</head>
<body>
    <div>
        <img id="img_home" src="img/home.jpg" width="100%">
    </div>
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

</body>
</html>