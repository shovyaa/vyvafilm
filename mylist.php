<?php
include 'koneksi.php';
include 'layout/header.php';

$result = $conn->query("
    SELECT m.*, ml.id_list
    FROM movies m
    JOIN my_list ml ON m.id = ml.movie_id
    ORDER BY ml.added_at DESC
");
?>

<style>
.movie-list {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}

.movie {
  width: 150px;
  display: flex;
  flex-direction: column;
  background-color: #1e1e1e;
  border-radius: 8px;
  overflow: hidden;
  transition: transform 0.6s ease, opacity 0.6s ease;
  opacity: 0;
  transform: translateY(20px);
  min-height: 280px;
}
.movie.show {
  opacity: 1;
  transform: translateY(0);
}

.movie a {
  flex-grow: 1;
  text-decoration: none;
  color: inherit;
  padding: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.movie img {
  width: 100%;
  border-radius: 8px;
}
.movie p {
  margin-top: 10px;
  font-weight: bold;
  font-size: 14px;
  text-align: center;
  min-height: 38px;
}
.movie form {
  padding: 10px;
  text-align: center;
}
.movie button {
  background-color: #ff4444;
  color: white;
  border: none;
  padding: 5px 10px;
  border-radius: 5px;
  font-size: 12px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}
.movie button:hover {
  background-color: #e33434;
}
</style>

<main class="mylist-page" style="padding: 20px;">
    <h2 style="margin-bottom: 20px;">Daftar Film Saya</h2>

    <?php if ($result->num_rows === 0): ?>
        <p>Belum ada film dalam daftar MyList.</p>
    <?php else: ?>
        <div class="movie-list">
            <?php while ($movie = $result->fetch_assoc()): ?>
                <div class="movie">
                    <a href="detail.php?id=<?= $movie['id']; ?>">
                        <img src="<?= htmlspecialchars($movie['poster_url']); ?>" alt="<?= htmlspecialchars($movie['title']); ?>">
                        <p><?= htmlspecialchars($movie['title']); ?> (<?= $movie['release_year']; ?>)</p>
                    </a>
                    <form action="hapus_mylist.php" method="POST" onsubmit="return confirm('Yakin ingin menghapus film ini dari MyList?');">
                        <input type="hidden" name="id_list" value="<?= $movie['id_list']; ?>">
                        <button type="submit">Hapus</button>
                    </form>
                </div>
            <?php endwhile; ?>
        </div>
    <?php endif; ?>
</main>

<!-- ANIMASI JAVASCRIPT -->
<script>
document.addEventListener("DOMContentLoaded", () => {
  const cards = document.querySelectorAll(".movie");
  cards.forEach((card, i) => {
    setTimeout(() => {
      card.classList.add("show");
    }, i * 150); // Delay antar kartu 150ms
  });
});
</script>

<?php include 'layout/footer.php'; ?>
