<?php
	include("utilities.php");

	function show_form()
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
	// this function return array(bool, message). bool being login success, message is a clue to the user.
	function handle_login() 
	{
		$h = hash('sha256', $_POST['password']);
		require('pdo.php');

		// $db = new PDO('mysql:host=localhost:3306;dbname=bicgame', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
		// $db = new PDO('mysql:host=mysql.montpellier.epsi.fr:5206;dbname=bicgame', 'jonas.orinovski', 'bicgame', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
		$login = $_POST['login'];
		try
		{
			$response = $db->query("SELECT * FROM users WHERE u_name = '$login'");
			if($response === false or ($donnees = $response->fetch()) === false)
			{
				return array(false,"this user doesn't exist!");
			}
			else
			{
				if($donnees['pwd'] == hash('sha256',$_POST['password']))
				{
					if($donnees['active'] == FALSE)
					{
						return array(false, "votre compte n'est pas activé, veuillez cliquer sur le lien envoye par email!");
					}
					else
					{
						$_SESSION['login'] = $_POST['login'];
						return array(true,'login success!');
					}
				}
				else
				{
					return array(false, 'bad password!');
				}
			}
		}
		catch(Exception $e)
		{
			// die('Erreur : ' . $e->getMessage());
			// echo mysql_error($bdd);
			// print_r($bdd->errorInfo());
			print_r($e->getMessage());
			die('error: ' . $e->getMessage());
		}
	}

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
	else if(isset($_GET['create_account']))
	{
		include("create_account.php");
	}
	else if(isset($_POST['password']) and isset($_POST['login']))
	{
		$login_result = handle_login();
		echo $login_result[1];
		if($login_result[0] === false)
		{
			show_form();
		}
	}
	else
	{
		show_form();
	}
?>