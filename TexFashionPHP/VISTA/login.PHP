<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login y Registro</title>
    <link rel="stylesheet" href="../style/login.css">
    
</head>
<body>
    <div class="container">
        <div class="form-container sign-up-container">
            <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejemplo de Logo</title>
    <style>
        .logo {
            max-width: 100px; /* Ajusta el tamaño máximo del logo */
            height: auto; /* Mantiene la relación de aspecto */
        }
        .header {
            text-align: center; /* Centra el logo horizontalmente */
            padding: 20px; /* Espacio alrededor del logo */
        }

        
    </style>
    <header class="header">
        
    </header>
            <form action="#"> 
                <h1>Regístrate</h1>
                <input type="text" placeholder="Nombre" />
                <input type="email" placeholder="Correo" />
                <input type="password" placeholder="Contraseña" />
                <br>
                <select name="" id="">
                    <option value="Escoge un Rol">Escoge un Rol</option>
                    <option value="1.Usuario">Usuario</option>
                    <option value="2.Administrador">Administrador</option>
                    <option value="3.Jefe de Bodega">Jefe de Bodega</option>
                    <option value="4.Confeccionista">Confeccionista</option>
                </select>
                <button>Registrarse</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form action="#">
                <h1>Inicia Sesión</h1>
                <input type="email" placeholder="Correo" />
                <input type="password" placeholder="Contraseña" />
                <button>Iniciar Sesión</button>
                <br>
                <a href="Contraseña.html" class="link-text">¿Olvido su Contraseña?</a>

            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    
                    <button class="ghost" id="signIn"> Iniciar Sesión</button>
                </div>
                <div class="overlay-panel overlay-right">
                <button class="ghost" id="signUp">Regístrate</button>
                </div>
            </div>
        </div>
    </div>
    <script src="../js/login.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <a href="index.html" class="icon-link">
        <i class="fas fa-home"></i>
    </a>
</body>
</html>