<?php
	include('utilities.php');

	function get_user_id($user, $db ){
		$user_id = '';
		try{
			$query_get_user_id =
			"SELECT * FROM users WHERE users.name = ".$user.";";
			$response = $db->query($query_get_user_id);			
			$data = $response->fetch();
			$user_id = $data['id'];
		}
		catch(Exception $e)
		{
			print_r($e->getMessage());
		}		
		return $user_id;
	}
	function insert_user($user, $email, $password, $db){
		$response = null;
		try
		{
			// $reponse = $bdd->query('INSERT INTO users (name, email, password) VALUES (\''.$_POST['login'].'\',\''.$h.'\')');
			$h = hash('sha256', $password);

			$query_user_create = "INSERT INTO users (name, email, password) VALUES ('"
				// .$_POST['login']
				.$user
				."' ,'"
				// .$_POST['email']
				.$email
				."' ,'"
				.$h
				."')";
			// echo $query;
			$response = $db->query($query_user_create);
		}
		catch(Exception $e)
		{
			print_r($e->getMessage());
		}
		return $response;
	}
	function insert_token($user, $db)
	{
		$token = bin2hex(random_bytes(256));

		// create user
		try
		{
			$query_token_create =
			"INSERT INTO tokens (id_user, token) VALUES ('"
				.$user_id
				.", '"
				.$token
				."')";
			// echo $query;
			$reponse = $db->query($query_token_create);
		}
		catch(Exception $e)
		{
			print_r($e->getMessage());
		}
	}

	if(isset($_POST['password']) 
		and isset($_POST['login'])
		and isset($_POST['email'])
	)
	{
		$email = $_POST['email'];
		if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
  			echo "email syntax validation failed!";
		}
		else
		{
			{
				$headers = "From: <" . $_POST['addr'] . ">\r\n";
				if(mail($email,
					"bicgame validation",
					'<a href="'.$token.'">click here to activate your account</a>',
					$headers))
				{
					echo "<p class='err'>validation sent, check your email!</p>";
				}
				{
					else echo "<p class='err'>mail sending failed!</p>";					
				}
			}			
			// $reponse = null;
			$bdd = new PDO('mysql:host=localhost;dbname=bicgame', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
			
			// get user id
			$user_id = '';


			// create token


			if($reponse)
				echo 'account created';
			else echo 'account not created';
			// echo '<p>'.$reponse.'</p>';
		}
	}
	else
	{
		echo "please fill in all fields!";
	}
	echo '<p>creez un compte:</p>';
	echo "<form method='POST' action=".$_SERVER['PHP_SELF'].">";
	echo "login:<input type='text' name='login' value=".hasform_post('login')."></input>";
	echo "email:<input type='text' name='email'></input>";
	echo "password:<input type='password' name='password'></input>";
	echo "<input type='submit' name='valider' value='OK'/>";
	echo "</form>";
	
?>