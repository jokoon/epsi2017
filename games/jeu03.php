<!DOCTYPE html>
<html>
<head>
    <title>Chain Reaction game</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
    <canvas id="id_canvas1" width="300" height="300"  style="display: none"></canvas>
    <canvas id="id_canvas2" width="16" height="10"></canvas>
    <SCRIPT type="text/javascript">
    <?php
     $MODE_DEBUG=1;
     echo 'var URL_POST_SCORE="url_post_score.php?random='.rand(0,500000).'";';
     echo 'var URL_END="url_end.php";';
     echo 'var random_seed=2000;';
     echo 'var MODE_DEBUG='.$MODE_DEBUG.';';
     if($MODE_DEBUG===1){
        echo "alert('MODE_DEBUG:'+MODE_DEBUG);";
        echo "alert('POST:'+URL_POST_SCORE);";
        echo "alert('END:'+URL_END);";
        echo "alert('seed:'+random_seed);";
     }
    ?>
    </SCRIPT>
    <a href="http://www.twitter.com/lapinchien" target="_blank"><img src="../../img/bt_twitter2.png"></a><br />
	<script type="text/javascript" src="jeu03.js"></script>
</body>
</html>
