<?php
	if(!isset($_SESSION['status']) and $_SESSION['status'] != 1) {
		header('Location: index.php');
	}
?>