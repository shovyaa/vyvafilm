<?php include 'layout/header.php'; ?>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Kritik dan Saran</title>
  <link rel="stylesheet" href="css/kritik.css">
</head>
<body>

<div class="kritik-form">
  <h2>Kritik dan Saran</h2>
  <form action="" method="POST">
    <label for="nama">Nama:</label>
    <input type="text" name="nama" required>

    <label for="tanggapan">Tanggapan:</label>
    <textarea name="tanggapan" rows="6" placeholder="Tulis kritik dan/atau saran Anda di sini..." required></textarea>

    <button type="submit" name="submit">Kirim</button>
  </form>

  <?php
    include 'koneksi.php';

    if (isset($_POST['submit'])) {
        $nama = htmlspecialchars($_POST['nama']);
        $tanggapan = htmlspecialchars($_POST['tanggapan']);

        $query = "INSERT INTO kritik_saran (nama, tanggapan) VALUES ('$nama', '$tanggapan')";
        $result = mysqli_query($conn, $query);

        if ($result) {
            echo '<div class="success-message">Terima kasih atas masukan Anda!</div>';
        } else {
            echo '<div class="error-message">Terjadi kesalahan. Silakan coba lagi.</div>';
        }
    }
  ?>
</div>

</body>
</html>
<?php include 'layout/footer.php'; ?>
