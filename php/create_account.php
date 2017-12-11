<?php
	include('utilities.php');

	if(isset($_POST['password']) and isset($_POST['login']))
	{
		$reponse = null;
		$h = hash('sha256', $_POST['password']);
		$bdd = new PDO('mysql:host=localhost;dbname=bicgame', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
		try
		{
			// $reponse = $bdd->query('INSERT INTO users (name, email, password) VALUES (\''.$_POST['login'].'\',\''.$h.'\')');
			$query = "INSERT INTO users (name, email, password) VALUES ('"
				.$_POST['login']
				."' ,'"
				.$_POST['email']
				."' ,'"
				.$h
				."')";
			echo $query;
			$reponse = $bdd->query($query);
		}
		catch(Exception $e)
		{
			// die('Erreur : ' . $e->getMessage());
			// echo mysql_error($bdd);
			// print_r($bdd->errorInfo());
			print_r($e->getMessage());
		}
		if($reponse)
			echo 'account created';
		else echo 'account not created';
		// echo '<p>'.$reponse.'</p>';

	}
	echo '<p>creez un compte:</p>';
	echo "<form method='POST' action=".$_SERVER['PHP_SELF'].">";
	echo "login:<input type='text' name='login' value=".hasform_post('login')."></input>";
	echo "email:<input type='text' name='email'></input>";
	echo "password:<input type='password' name='password'></input>";
	echo "<input type='submit' name='valider' value='OK'/>";
	echo "</form>";
	
?>