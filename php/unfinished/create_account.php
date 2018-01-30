<!-- <pre> -->
<?php
    // error_reporting(E_ALL);
    error_reporting(E_STRICT|E_ALL);
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);    
	
	// include('utilities.php');
    
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;
	
	require 'phpmailer/Exception.php';
	require 'phpmailer/PHPMailer.php';
	require 'phpmailer/SMTP.php';
    
	function sendmail($address,$message, $username){
		// use PHPMailer\PHPMailer\PHPMailer;
		// use phpMailer\PHPMailer\PHPMailer;
		// require '../vendor/autoload.php';
		//Create a new PHPMailer instance
        // echo "trying to send to $address\n";
        try
        {
			$mail = new PHPMailer;
			//Set who the message is to be sent from
			$mail->setFrom('jonas.orinovski@epsi.fr', 'epsi.fr');
			//Set an alternative reply-to address
			$mail->addReplyTo('jonas.orinovski@epsi.fr', 'BicGames');
			//Set who the message is to be sent to
			$mail->addAddress($address, $username);
			//Set the subject line

			$mail->Subject = 'account validation link';
			//Read an HTML message body from an external file, convert referenced images to embedded,
			//convert HTML into a basic plain-text alternative body
			$mail->msgHTML($message, __DIR__);
			//Replace the plain text body with one created manually
			$mail->AltBody = $message;
			//Attach an image file
			// $mail->addAttachment('images/phpmailer_mini.png');
			//send the message, check for errors
			$mail->send();
		}
		catch (phpmailerException $e) 
		{
			echo $e->errorMessage();
			return false;
		}
		return true;
	}
	function get_user_id($user, $db){
		$user_id = '';
		try{
			$query_get_user_id =
			"SELECT * FROM users WHERE users.u_name = '$user'";
			$response = $db->query($query_get_user_id);
			// print_r($response);
			if ($response == FALSE or $response->rowCount() == 0)
			{
				// echo "no such user!";
				throw new Exception("no such user!", 1);
			}
			else
			{
				$data = $response->fetch();
				$user_id = $data['id'];
				// echo "user id:$user_id";
			}
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
			$query_user_create = "INSERT INTO users (u_name, email, pwd, active)
			VALUES ('$user' ,'$email' ,'$h', true)";
			// echo $query;
			$response = $db->query($query_user_create);
		}
		catch(Exception $e)
		{
			print_r($e->getMessage());
		}
		return $response;
	}
	function insert_token($user, $db, $token){
		// $token = bin2hex(random_bytes(256));
		$user_id = get_user_id($user, $db);
		// echo "user id: '$user_id'";
		try
		{
			$query_token_create =
			"INSERT INTO tokens (id_user, token) VALUES ($user_id , '$token')";
			// echo "query: $query_token_create\n";
			// echo "user_id: $user_id\n";
			// echo "token: $token\n";
			$reponse = $db->query($query_token_create);
		}
		catch(Exception $e)
		{
			print_r($e->getMessage());
		}
	}
	function create_account(){
		$email = $_POST['email'];
        $password = $_POST['password'];
        $login = $_POST['login'];
		if (!filter_var($email, FILTER_VALIDATE_EMAIL))
        {
  			return array(false, "email syntax validation failed! $email");
		}
		else
		{
			// $db = new PDO('mysql:host=mysql.montpellier.epsi.fr:3306;dbname=bicgame', 'jonas.orinovski', 'bicgame', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
			// $db = new PDO('mysql:host=localhost:3306;dbname=bicgame', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
			require('pdo.php');
			// token creation
			// $token = insert_token($login,$db);
			$token = bin2hex(openssl_random_pseudo_bytes(128));

			// link to mail
			$link = '<a href="http://localhost:8080/bicgame/validate.php?token=$token">click here to validate your account</a>';
			// try to send an email

			if(insert_user(
				$login, $email,
				hash('sha256', $_POST['password']),
				$db))
			{
				insert_token($login,$db,$token);
				if(sendmail($_POST['email'], $link, $_POST['login']) === true)
				{
					return array(true,"validation sent, check your email!");
				}
				else
				{
					return array(false,"mail sending failed!");
				}				
				// header('Location:/bicgame/home.php');
				// echo '<p>'.$reponse.'</p>';
			}
			else
			{
				return array(false,'account not created');
			}
		}		
	}
	if(isset($_POST['password']) 
		and isset($_POST['login'])
		and isset($_POST['email'])
	) {
		create_account();
	}
	else {
		echo "please fill in all fields!";
	}
	// echo '<p>creez un compte:</p>';
	// echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
	echo '<form method="POST">';
	echo 	'<input class="field01" type="text" name="login" value="'.hasform_post('login').'" placeholder="login"></input>';
	echo 	'<input class="field01" type="text" name="email" placeholder="email"></input>';
	echo 	'<input class="field01" type="password" name="password" placeholder="password"></input>';
	echo 	'<input type="submit" name="valider" value="OK"/>';
	echo "</form>";
	
?>
<!-- </pre> -->