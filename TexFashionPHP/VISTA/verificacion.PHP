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
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-bottom: 20px;
        }

        input[type="num"] {
            width: 75%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
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
<center> <h2>Verificacion de Codigo</h2> </center>
        <form action="login.html" method="post">
            <center><label for="num">Codigo</label> </center>
            <center><input type="num" id="" name="Codigo" required> </center>
            <br>
            
            <center> <button type="submit">Enviar</button> </center>
            <a href="login.html"></a>
            <br>
        </form>
    </div>
</body>

</html>