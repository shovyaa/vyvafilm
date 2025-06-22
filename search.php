<?php
include 'koneksi.php';
include 'layout/header.php';

// Ambil kata kunci pencarian dari parameter GET
$keyword = isset($_GET['query']) ? mysqli_real_escape_string($conn, $_GET['query']) : '';

// Query pencarian film berdasarkan judul
$query = "SELECT * FROM movies WHERE title LIKE '%$keyword%'";
$result = mysqli_query($conn, $query);
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Hasil Pencarian - VyVaFilms</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-950 text-white">

  <div class="max-w-6xl mx-auto px-4 py-10">
    <h1 class="text-3xl font-bold mb-6">Hasil Pencarian untuk: <em class="text-yellow-400"><?= htmlspecialchars($keyword) ?></em></h1>

    <?php if (mysqli_num_rows($result) > 0): ?>
      <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-6">
        <?php while ($row = mysqli_fetch_assoc($result)) : ?>
          <div class="bg-gray-900 rounded-xl overflow-hidden shadow hover:scale-105 transition-transform duration-300">
            <a href="detail.php?id=<?= $row['id'] ?>">
              <img src="<?= htmlspecialchars($row['poster_url']) ?>" alt="<?= htmlspecialchars($row['title']) ?>"
                   class="w-full aspect-[2/3] object-cover">
              <div class="p-3">
                <h2 class="text-sm font-semibold truncate"><?= htmlspecialchars($row['title']) ?></h2>
                <p class="text-xs text-gray-400"><?= $row['release_year'] ?? '-' ?></p>
              </div>
            </a>
          </div>
        <?php endwhile; ?>
      </div>
    <?php else: ?>
      <div class="mt-10 p-6 bg-red-900 text-red-100 rounded-lg shadow text-center">
        <p class="text-lg font-semibold">Film tidak ditemukan.</p>
        <p class="text-sm">Tidak ada hasil untuk judul <strong><?= htmlspecialchars($keyword) ?></strong>.</p>
      </div>
    <?php endif; ?>
  </div>

<?php include 'layout/footer.php'; ?>
</body>
</html>
