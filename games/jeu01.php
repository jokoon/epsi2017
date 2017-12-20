<!DOCTYPE html>
<html>
<head>
    <title>The Island game </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
    <canvas id="id_canvas1" width="400" height="300" style="display: none"></canvas>
    <canvas id="id_canvas2" width="4" height="3"></canvas>
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
	<script type="text/javascript" src="js/soundjs-0.6.2.min.js"></script>
	<script type="text/javascript" src="jeu01.js"></script>
</body>
</html>
