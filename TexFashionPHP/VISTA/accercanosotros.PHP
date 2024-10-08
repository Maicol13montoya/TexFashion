<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contacto - TexFashion</title>

    <link rel="stylesheet" href="../style/inicio.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        main {
            margin-top: 10%;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        .contact-section {
            display: flex;
            max-width: 900px;
            width: 100%;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .image-section {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-right: 20px;
        }

        .image-section img {
            max-width: 100%;
            border-radius: 8px;
        }

        .form-section {
            flex: 2;
        }

        h2 {
            font-size: 1.8em;
            margin-bottom: 10px;
        }

        p {
            margin-bottom: 20px;
            color: #666;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        input,
        select,
        textarea {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1em;
            width: 100%;
        }

        textarea {
            resize: vertical;
        }

        .captcha-section {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .captcha-section input {
            margin-right: 10px;
        }

        .recaptcha-placeholder {
            width: 200px;
            height: 50px;
            background-color: #eee;
            display: inline-block;
            margin-left: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .privacy-policy {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .privacy-policy input {
            margin-right: 10px;
        }

        button {
            padding: 10px 20px;
            background-color: #d35400;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 1.1em;
            cursor: pointer;
        }

        button:hover {
            background-color: #e67e22;
        }

        .captcha-section,
        .privacy-policy {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            background-color: #f8f9fa;
            margin-bottom: 10px;
        }

        .recaptcha-placeholder {
            width: 150px;
            height: 35px;
            background-color: #e9ecef;
            border-radius: 5px;
        }

        label {
            margin-left: 10px;
        }

        input[type="checkbox"] {
            accent-color: #007bff;
            transform: scale(1.2);
            margin-right: 10px;
        }
    </style>
</head>

<body>


    <section class="tank-bootstrap-header">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light py-lg-3 py-2">
                <div class="logo">
                    <img src="../img/TexFashion.png" alt="Logo">
                </div>
                <!-- Botón de hamburguesa -->
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <ul class="navbar-nav ml-auto">

                        
                    <li class="nav-item">
                            <a class="nav-link" href="../VISTA/index.html">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../VISTA/login.PHP">Iniciar sesión</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </section>




    <main>
        <section class="contact-section">
            <div class="image-section">
                <img src="../img/TexFashion.png" alt="Logo TexFashion">
            </div>
            <div class="form-section">
                <h2>CONTÁCTANOS</h2>
                <p>Si tienes alguna duda, comentario o sugerencia, puedes contactarnos y nos comunicaremos contigo lo
                    antes posible.</p>
                <form action="#">
                    <label for="nombre">Nombre completo</label>
                    <input type="text" id="nombre" name="nombre" required>

                    <label for="email">Email*</label>
                    <input type="email" id="email" name="email" required>

                    <label for="area">Deseo contactar con el área de *</label>
                    <select id="area" name="area" required>
                        <option value="" disabled selected>Selecciona una opción</option>
                        <option value="ventas">Ventas</option>
                        <option value="soporte">Soporte</option>
                        <option value="general">General</option>
                    </select>

                    <label for="comentarios">Comentarios</label>
                    <textarea id="comentarios" name="comentarios" rows="4" required></textarea>



                    <button type="submit">Enviar</button>
                </form>
            </div>
        </section>
    </main>


    <section class="tank-footer-29-main" id="footer">
        <div class="footer-29 text-center">
            <div class="container">
                <div class="main-social-footer-29">
                    <a href="#" class="facebook"><span class="fa fa-facebook"></span></a>

                    <a href="#" class="instagram"><span class="fa fa-instagram"></span></a>
                    <a href="#" class="google-plus"><span class="fa fa-google-plus"></span></a>

                </div>
                <div class="bottom-copies text-center">
                    <p class="copy-footer-29"> 2024 Texfashi



                        on Seguridad <a href="#"> Empresa</a></p>
                </div>
            </div>
        </div>

        <button id="movetop" title="Go to top">
            <span class="fa fa-angle-up"></span>
        </button>



    </section>

</body>

</html>