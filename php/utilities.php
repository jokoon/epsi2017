<?php
function hasform_get($s) {if(isset($_GET[$s])) return $_GET[$s];}
function hasform_post($s) {if(isset($_POST[$s])) return $_POST[$s];}
function make_form_post($names)
{
	echo "<form method='GET' action=".$_SERVER['PHP_SELF'].">";
	foreach ($names as $value)
		echo $value.":<input type='text' name='".$value."' value=".hasform($value)."/>";
	echo "<input type='submit' name='valider' value='OK'/>";
	echo "</form>";
}
?>