<?php
class Sesion 
{
	private static $data;

	function __construct()
	{
		session_start();
		$data = array();
	}

	public function set($data) 
	{
		$_SESSION['usuario'] = $data['usuario'];
		$_SESSION['id'] = $data['id'];
		$_SESSION['cedula'] = $data['cedula'];
		$_SESSION['fullname'] = $data['fullname'];
		$_SESSION['rol'] = $data['rol'];
		$_SESSION['status'] = 1;
	}

	public function get($nombre) 
	{

		if (isset ($_SESSION[$nombre])) {
			return $_SESSION[$nombre];
		} 
		else 
		{
			return false;
		}
	}
	public function borrarVariables() 
	{
		unset($_SESSION['usuario']);
		unset($_SESSION['id']);
		unset($_SESSION['cedula']);
		unset($_SESSION['fullname']);
		unset($_SESSION['rol']);
		unset($_SESSION['status']);
	}
	public function cerrarSesion() 
	{
		session_destroy ();
	}
}
?>