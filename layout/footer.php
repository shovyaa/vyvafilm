<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Footer VyVaFilms</title>
  <!-- Font Awesome CDN -->
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    integrity="sha512-xxx"
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
  />
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
    }

    footer {
      background: linear-gradient(to right, #2c0000, #800000);
      padding: 50px 20px;
      color: #f0f0f0;
    }

    .footer-container {
      max-width: 1200px;
      margin: 0 auto;
      display: flex;
      flex-wrap: wrap;
      align-items: flex-start;
      justify-content: space-between;
      gap: 40px;
    }

    .footer-logo {
      font-size: 55px;
      font-weight: bold;
      color: #fff;
      text-align: center;
      width: 100%;
    }

    .footer-sections {
      display: flex;
      flex-wrap: wrap;
      gap: 40px;
      justify-content: space-between;
      width: 100%;
      margin-top: 30px;
    }

    .footer-section {
      min-width: 200px;
    }

    .footer-section h4 {
      font-size: 24px;
      margin-bottom: 14px;
    }

    .footer-section a,
    .footer-contact p {
      font-size: 18px;
      margin-bottom: 10px;
      display: inline-block;
      color: #f0f0f0;
      text-decoration: none;
    }

    .footer-contact p i {
      margin-left: 10px;
      background: rgba(255, 255, 255, 0.1);
      padding: 8px;
      border-radius: 8px;
    }

    .social-icons a {
      font-size: 20px;
      margin-right: 10px;
      color: #fff;
      background: rgba(255, 255, 255, 0.1);
      padding: 8px;
      border-radius: 8px;
      display: inline-block;
      transition: 0.3s;
    }

    .social-icons a:hover {
      background: rgba(255, 255, 255, 0.3);
    }

    .footer-bottom {
      text-align: center;
      margin-top: 40px;
      font-size: 14px;
      color: #ccc;
    }
  </style>
</head>
<body>

  <footer>
    <div class="footer-container">
      <div class="footer-logo">VyVaFilms</div>

      <div class="footer-sections">
        <!-- Kontak -->
        <div class="footer-section footer-contact">
          <h4>Kontak</h4>
          <p>+62 892-7616-5423 <i class="fas fa-phone"></i></p><br />
          <p>vyvaofficial@gmail.com <i class="fas fa-envelope"></i></p><br />
          <p>VyVaFilms_Official <i class="fab fa-instagram"></i></p>
        </div>

        <!-- Tautan Penting -->
        <div class="footer-section">
          <h4>Tautan Penting</h4>
          <br />
          <a href="about.php">Tentang Kami</a><br />
          <br>
          <a href="kebijakan_privasi.php">Kebijakan Privasi</a><br />
          <br />
          <a href="#">Kritik dan Saran</a>
        </div>

        <!-- Ikuti Kami -->
        <div class="footer-section">
          <h4>Ikuti Kami</h4>
          <div class="social-icons">
            <a href="https://facebook.com/vyvafilms" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://twitter.com/vyvafilms" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="https://tiktok.com/@vyvafilms" target="_blank"><i class="fab fa-tiktok"></i></a>
            <a href="https://youtube.com/@vyvafilms" target="_blank"><i class="fab fa-youtube"></i></a>
          </div>
        </div>
      </div>
    </div>

    <div class="footer-bottom">
      &copy; 2025 VyVaFilmsEntertainment. All Rights Reserved
    </div>
  </footer>

</body>
</html>
