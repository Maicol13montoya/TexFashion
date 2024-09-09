<!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recuperar Contraseña</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background: linear-gradient(90deg, rgba(255, 255, 255, 1) 0%, rgba(255, 255, 255, 1) 0%, rgba(0, 100, 148, 1) 100%);
                background-size: 500%;
                animation: animacion 25s infinite;
                overflow: hidden;
            }

            @keyframes animacion {
        0% {
            background-position: 0% 50%;
        }

        50% {
            background-position: 100% 50%;
        }

        100% {
            background-position: 0% 50%;
        }
    }
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(17, 132, 226, 0.986);
            }
            h2 {
                margin-bottom: 20px;
            }
            input[type="email"] {
                width: 75%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                border-right: 200px;
            }
            button {
                border: 19px;
                padding: 12px 45px;
                margin-top: 20px;
                background-color: #8ccaf9;
                color: #000000;
                font-family: Arial, sans-serif;
                font-size: 14px;
                font-weight: bold;
                cursor: pointer;
                transition: transform 80ms ease-in;
                border-radius: 5px;
            }
            button:hover {
                background-color: #0056b3;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h2>
            <center>Recuperar Contraseña</center>
            </h2>
            <form action="verificacion.html" method="post">
                <center>  <label for="email">Correo Electrónico</label> </center>
                <center> <input type="email" id="email" name="email" required></center>
                <center>   <button type="submit">Enviar</button> </center>
                <center><a href="verificacion.html"></a></center>
                
            </form>
        </div>
    </body>
    </html>