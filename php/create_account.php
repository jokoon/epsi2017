<?php
	include('utilities.php');
	error_reporting(E_ALL);

	// function sendmail($address,$message)
	// {
	// 	use PHPMailer\PHPMailer\PHPMailer;
	// 	use phpMailer\PHPMailer\PHPMailer;
	// 	require '../vendor/autoload.php';
	// 	//Create a new PHPMailer instance
	// 	$mail = new PHPMailer;
	// 	//Set who the message is to be sent from
	// 	$mail->setFrom('from@example.com', 'First Last');
	// 	//Set an alternative reply-to address
	// 	$mail->addReplyTo('replyto@example.com', 'First Last');
	// 	//Set who the message is to be sent to
	// 	$mail->addAddress('whoto@example.com', 'John Doe');
	// 	//Set the subject line
	// 	$mail->Subject = 'PHPMailer mail() test';
	// 	//Read an HTML message body from an external file, convert referenced images to embedded,
	// 	//convert HTML into a basic plain-text alternative body
	// 	$mail->msgHTML(file_get_contents('contents.html'), __DIR__);
	// 	//Replace the plain text body with one created manually
	// 	$mail->AltBody = 'This is a plain-text message body';
	// 	//Attach an image file
	// 	$mail->addAttachment('images/phpmailer_mini.png');
	// 	//send the message, check for errors
	// 	if (!$mail->send()) {
	// 	    echo "Mailer Error: " . $mail->ErrorInfo;
	// 	} else {
	// 	    echo "Message sent!";
	// 	}
	// }
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
		return $token;
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
			sendmail($_POST['email'], "a dada");
			{
				// $token = ins
				$headers = "From: <" . $_POST['email'] . ">\r\n";
				if(mail($email,
					"bicgame validation",
					'<a href="'.$token.'">click here to activate your account</a>',
					$headers))
				{
					echo "<p class='err'>validation sent, check your email!</p>";
				}
				
				else echo "<p class='err'>mail sending failed!</p>";					
				
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