<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SeeUPlay - subscribe</title>
    <link rel="stylesheet" type="text/css" href="seeuplay.css">
    <link rel="stylesheet" type="text/css" href="hiscore.css">
</head>
<body>
    <div>
        <img id="img_home" src="img/home.jpg" width="100%">
    </div>
    
    <div class="pres_jeux">
        <div id="form01">
             <h1>Welcome Nickname</h1>
             <a href="home.php">Logout</a> 
        </div>
        <div class="img_jeu">
            <img class="img_jeu2" src="img/game01.png">
            <div class="pres_btn">
                <a href="../games/jeu01.php"><img class="bt_jeux" src="img/button_play.png"></a>
                <img class="bt_jeux" src="img/button_rules.png" onclick="fct_show_rules(1)">
                <img class="bt_jeux" src="img/button_hiscore.png" onclick="fct_show_hiscore(1)">
            </div>
        </div>
        <div class="img_jeu">
            <img class="img_jeu2" src="img/game02.png">
            <div class="pres_btn">
                <a href="../games/jeu02.php"><img class="bt_jeux" src="img/button_play.png"></a>
                <img class="bt_jeux" src="img/button_rules.png" onclick="fct_show_rules(2)">
                <img class="bt_jeux" src="img/button_hiscore.png" onclick="fct_show_hiscore(2)">
            </div>
        </div>
        <div class="img_jeu">
            <img class="img_jeu2" src="img/game03.png">
            <div class="pres_btn">
                <a href="../games/jeu03.php"><img class="bt_jeux" src="img/button_play.png"></a>
                <img class="bt_jeux" src="img/button_rules.png" onclick="fct_show_rules(3)">
                <img class="bt_jeux" src="img/button_hiscore.png" onclick="fct_show_hiscore(3)">
            </div>
        </div>
    </div>
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
   <a href="javascript:fct_hide_hiscore();">Close</a>
</div>
<div class="rules" id="rules1">
    <h1>The Island</h1>
    <p>You have to defeat the red team to score points. In order to win you have to use the weapons to throw all your enemies into the sea.</p>
    <a href="javascript:fct_hide_rules();">Close</a>
</div>
<div class="rules" id="rules2">
    <h1>Blocked</h1>
    <p>You should defeat the CPU to validate your score. Click on the biggest areas. The first to reach 1000 points is the winner.</p>
    <a href="javascript:fct_hide_rules();">Close</a>
</div>
<div class="rules" id="rules3">
    <h1>Chain Reaction</h1>
    <p>You should defeat the CPU to validate your score. Create the bigger chain reactions. The first to reach 2000 points is the winner.</p>
    <a href="javascript:fct_hide_rules();">Close</a>
</div>
<script>
    var popupshown=0;
    //affiche le container des hiscores
    function fct_show_hiscore(game){
        if(popupshown==0){
            document.getElementById("hicontainer").style="display:block";
            popupshown=1;
        }
    }
    //fait disparaitre le container des hiscores
    function fct_hide_hiscore(){
        document.getElementById("hicontainer").style="display:none";
        popupshown=0;
    }
    //fait apparaitre les rêgles
    function fct_show_rules(rules){
        if(popupshown==0){
            var rl="rules"+rules;
            document.getElementById(rl).style="display:block";
            popupshown=1;
        }
    }
    //fait disparaitre les rêgles
    function fct_hide_rules(){
        document.getElementById("rules1").style="display:none";
        document.getElementById("rules2").style="display:none";
        document.getElementById("rules3").style="display:none";
        popupshown=0;
    }
</script>
</body>
</html>