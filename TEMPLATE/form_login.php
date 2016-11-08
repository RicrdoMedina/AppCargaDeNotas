			<div class="registro-usuario">
				<div class="titulos"><i class="fa fa-user"></i> Usuarios registrados</div>
				<form method="post" action="index.php">
					<span class="span-block login">
						<label for="usuario">Usuario:</label>
						<input type="text" id="usuario" name="usuario" placeholder="Ingrese su usuario" value="<?php if(isset($_POST['usuario'])) { echo $_POST['usuario']; } ?>" required/>
					</span>
					<span class="span-block login">
						<label for="pass">Clave:</label>
						<input type="password" id="pass" name="pass" placeholder="Ingrese su clave" required/>
					</span>

					<?php
					if (! empty($mensaje)) {
					?>
						<div class="alert alert-danger" style="font-size: 14px; padding:3px;"> <?php echo $mensaje; ?></div>
					<?php
					}
							
					?>
					
					<span class="iconos-form">
							<input type="submit" value="Aceptar" />
					</span> 
				</form>
				<span class="reset-password"><a href="reset_password.php">¿Olvido su contrasena?</a></span>
			</div>

			<aside class="publicidad">
				<div class="titulos"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> Enlaces</div>
				<figure class="logo-img fade-img">
					<a href="https://www.youtube.com/channel/UCBYh1i2ED2dMK6deja6FBjA" target="_blank">
						<img class="imagen" src="IMAGENES/publicidad/ahorroenergetico.png" title="Ahorro Energético 2016">
					</a>
				</figure>

				<figure class="logo-img fade-img">
					<a href="http://gobiernoenlinea.gob.ve/home/homeG.dot" target="_blank">
						<img class="imagen" src="IMAGENES/publicidad/gobierno-en-linea.jpg" title="Gobierno en linea">
					</a>
				</figure>
			</aside>