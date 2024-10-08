<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./img/TexFashion.png" sizes="32x32" type="image/png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="../style/inicio.css">
    <title>Acerca de Nosotros - Tex Fashion Confección</title>
    <style>
        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
        }

        /* Estilos del encabezado */
        header {
            background-color: #fff;
            padding: 15px 20px;
            border-bottom: 1px solid #ddd;
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo img {
            max-height: 50px;
        }

        nav ul {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            margin-left: 20px;
        }

        nav ul li a {
            text-decoration: none;
            color: #333;
            font-weight: 600;
            font-size: 14px;
        }

        .nav-link.active {
            color: #007bff;
        }

        /* Estilos del contenido principal */
        main {
            padding: 50px 20px;
        }

        .main-content {
            display: flex;
            max-width: 1200px;
            margin: 0 auto 50px;
            align-items: center;
        }

        .image-section,
        .text-section {
            flex: 1;
        }

        .image-section img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            transition: transform 0.3s ease, opacity 0.3s ease;
        }

        .image-section img:hover {
            transform: scale(1.05);
            opacity: 0.9;
        }

        .text-section {
            padding: 0 40px;
        }

        .text-section h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        .text-section p {
            margin-bottom: 20px;
            font-size: 1.1em;
        }

        /* Estilos del pie de página */
        footer {
            background-color: #f8f9fa;
            padding: 30px 0;
            text-align: center;
        }

        .main-social-footer-29 a {
            display: inline-block;
            margin: 0 10px;
            color: #333;
            font-size: 20px;
        }

        .copy-footer-29 {
            margin-top: 20px;
            font-size: 14px;
        }

        #movetop {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            font-size: 20px;
            cursor: pointer;
            display: none;
        }

        /* Estilos responsivos */
        @media (max-width: 768px) {
            .main-content {
                flex-direction: column;
            }

            .image-section,
            .text-section {
                width: 100%;
                padding: 0;
            }

            .text-section {
                margin-top: 30px;
            }
        }
    </style>
</head>

<body>
    <header>
        <section class="tank-bootstrap-header">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light py-lg-3 py-2">
                    <div class="logo">
                        <img src="../img/TexFashion.png" alt="Logo">
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link active" id="put" href="index.html">Inicio</a>
                            </li>
                         
                            <li class="nav-item">
                                <a class="nav-link" href="../VISTA/login.PHP">Iniciar sesión</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </section>
    </header>

    <main>
        <div class="main-content">
            <div class="image-section">
                <img src="https://mecaluxes.cdnwm.com/casos-practicos/ejemplo-almacen-picking-eurofirany-polonia/img-0.1.0.jpg?imdensity=1"
                    class="img-responsive animated-img" alt="Almacén">
            </div>
            <div class="text-section">
                <h1>What we believe</h1>
                <p>
                    We believe all travel makes us better. At Away, it's not only our job to make every one of those
                    journeys more seamless, but our responsibility to make a positive impact on the world. We do this
                    through
                    our products, through the platform we have, and the community we create. In fact, before selling a
                    single
                    suitcase, we made a promise to partner with organizations working to create a better world for
                    everyone.
                </p>
                <p>
                    Since then, we've worked with Global Giving, Peace Direct, International Medical Corps, God's Love
                    We
                    Deliver, and The Trevor Project. If you've bought anything from Away, you've also contributed to
                    that work.
                    The world is a shared place—together, we can leave it better than we found it.
                </p>
            </div>
        </div>

        <div class="main-content">
            <div class="text-section">
                <h1>What we believe</h1>
                <p>
                    We believe all travel makes us better. At Away, it's not only our job to make every one of those
                    journeys more seamless, but our responsibility to make a positive impact on the world. We do this
                    through our products, through the platform we have, and the community we create. In fact, before
                    selling
                    a single suitcase, we made a promise to partner with organizations working to create a better world
                    for
                    everyone.
                </p>
                <p>
                    Since then, we've worked with Global Giving, Peace Direct, International Medical Corps, God's Love
                    We
                    Deliver, and The Trevor Project. If you've bought anything from Away, you've also contributed to
                    that
                    work. The world is a shared place—together, we can leave it better than we found it.
                </p>
            </div>
            <div class="image-section">
                <img src="../img/detalles.jpeg" alt="Two women with suitcases">
            </div>
        </div>
    </main>

    <footer>
        <section class="tank-footer-29-main" id="footer">
            <div class="footer-29 text-center">
                <div class="container">
                    <div class="main-social-footer-29">
                        <a href="#" class="facebook"><span class="fa fa-facebook"></span></a>
                        <a href="#" class="instagram"><span class="fa fa-instagram"></span></a>
                        <a href="#" class="google-plus"><span class="fa fa-google-plus"></span></a>
                    </div>
                    <div class="bottom-copies text-center">
                        <p class="copy-footer-29">2024 Texfashion Seguridad <a href="#">Empresa</a></p>
                    </div>
                </div>
            </div>
            <button id="movetop" title="Go to top">
                <span class="fa fa-angle-up"></span>
            </button>
        </section>
    </footer>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var currentPath = window.location.pathname;
            var navLinks = document.querySelectorAll('.nav-link');

            navLinks.forEach(function (link) {
                if (link.getAttribute('href') === currentPath) {
                    link.classList.add('active');
                }
            });
        });
    </script>
</body>

</html>