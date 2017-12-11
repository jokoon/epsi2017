<?php
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
	else
	if(isset($_POST['password']) and isset($_POST['login']))
	{
		$h = hash('sha256', $_POST['password']);
		$bdd = new PDO('mysql:host=localhost;dbname=bicgame', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
		try
		{
			$reponse = $bdd->query('SELECT * FROM users WHERE name = \''.$_POST['login'].'\'');
		}
		catch(Exception $e)
		{
			// die('Erreur : ' . $e->getMessage());
			// echo mysql_error($bdd);
			// print_r($bdd->errorInfo());
			print_r($e->getMessage());
		}
		if ($donnees = $reponse->fetch())
		{
			if($donnees['password'] == hash('sha256',$_POST['password']))
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
	else
	{
		echo '<a href="./create_account.php">creer compte</a>';
		// echo '<p>creez un compte:</p>';
		echo "<form method='POST' action=".$_SERVER['PHP_SELF'].">";
		echo "login:<input type='text' name='login' value=".hasform_post('login')."></input>";
		echo "password:<input type='password' name='password'></input>";
		echo "<input type='submit' name='valider' value='OK'/>";
		echo "</form>";
	}
?>