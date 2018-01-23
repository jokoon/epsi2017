<?php
	include("utilities.php");
	if(isset($_SESSION['login']))
	{
		if(isset($_GET['logout']))
		{
			session_unset();
			session_destroy();
		}
		else
		{
			echo 'bonjour ' . $_SESSION['login'].'<br/>';
			echo '<a href=".?logout">logout</a>';
		}
	}
	else if(isset($_POST['pwd']) and isset($_POST['login']))
	{
		$h = hash('sha256', $_POST['pwd']);
		$bdd = new PDO('mysql:host=localhost:3306;dbname=bicgame', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
		// $db = new PDO('mysql:host=mysql.montpellier.epsi.fr:5206;dbname=bicgame', 'jonas.orinovski', 'bicgame', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
		$login = $_POST['login'];
		try
		{
			$reponse = $db->query("SELECT * FROM users WHERE u_name = '$login'");
		}
		catch(Exception $e)
		{
			// die('Erreur : ' . $e->getMessage());
			// echo mysql_error($bdd);
			// print_r($bdd->errorInfo());
			print_r($e->getMessage());
		}
		if($reponse === false)
		{
			echo "this user doesn't exist!";
		}
		else if ($donnees = $reponse->fetch())
		{
			if($donnees['pwd'] == hash('sha256',$_POST['pwd']))
			{
				if($donnees['active'] == FALSE)
				{
					echo "votre compte n'est pas activé, veuillez cliquer sur le lien envoye par email!";
				}
				else
				{
					$_SESSION['login'] = $_POST['login'];
					echo 'login success!';
				}
			}
			else echo 'bad password!';
		}
	}
	else if(isset($_GET['create_account']))
	{
		include("create_account.php");
	}
	else
	{
		// echo '<p>creez un compte:</p>';
		// echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
		echo '<form method="POST" action="/bicgame/home.php">';
		echo 	'<input class="field01" type="text" name="login" value="'.hasform_post('login').'" placeholder="login"></input><br/>';
		echo 	'<input class="field01" type="password" name="password" placeholder="password"></input><br/>';
		echo 	'<input type="submit" name="valider" value="OK"/><br/>';
		echo '</form>';
		echo '<a href="./home.php?create_account">creer compte</a>';
	}
?>