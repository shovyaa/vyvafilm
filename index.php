<?php
include 'koneksi.php';
include 'layout/header.php';

// Ambil semua genre
$genresQuery = "SELECT * FROM genres";
$genresResult = $conn->query($genresQuery);

// Ambil semua film banner
$bannerQuery = $conn->query("SELECT * FROM movies WHERE is_banner = 1 ORDER BY created_at DESC");
?>

<main id="mainContent" class="opacity-0 translate-y-6 transition-all duration-1000 ease-out">
  <!-- HERO SLIDER -->
  <section class="hero-slider">
    <div class="slides" style="display: flex; transition: transform 0.5s ease;">
      <?php while ($banner = $bannerQuery->fetch_assoc()): ?>
        <a href="detail.php?id=<?= $banner['id']; ?>" style="min-width: 100%; position: relative; display: block; text-decoration: none; color: inherit;">
          <div class="hero-slide" style="min-width: 100%; position: relative;">
            <img src="<?= htmlspecialchars($banner['banner_url']); ?>"
                 alt="<?= htmlspecialchars($banner['title']); ?>"
                 class="hero-img scale-95 opacity-0 transition-all duration-1000 ease-out">
            <div class="hero-content">
              <h1><?= htmlspecialchars($banner['title']); ?> (<?= $banner['release_year']; ?>)</h1>
              <p>
                <?php
                $movie_id = $banner['id'];
                $genre_result = $conn->query("SELECT name FROM genres 
                                              JOIN movie_genres ON genres.id = movie_genres.genre_id 
                                              WHERE movie_genres.movie_id = $movie_id");
                $genres = [];
                while ($g = $genre_result->fetch_assoc()) {
                  $genres[] = $g['name'];
                }
                echo htmlspecialchars(implode(', ', $genres));
                ?>
              </p>
            </div>
          </div>
        </a>
      <?php endwhile; ?>
    </div>
    <button class="prev" onclick="plusSlides(-1)">&#10094;</button>
    <button class="next" onclick="plusSlides(1)">&#10095;</button>
  </section>

  <!-- SECTION PER GENRE -->
  <?php while ($genre = $genresResult->fetch_assoc()): ?>
    <section class="category opacity-0 translate-y-4 transition-all duration-700 ease-out">
      <h2><?= htmlspecialchars($genre['name']) ?><i class="arrow right"></i></h2>
      <div class="movie-list">
        <?php
        $genreId = $genre['id'];
        $moviesQuery = "
          SELECT m.*
          FROM movies m
          JOIN movie_genres mg ON m.id = mg.movie_id
          WHERE mg.genre_id = $genreId
          ORDER BY m.created_at DESC
         LIMIT 5
        ";
        $moviesResult = $conn->query($moviesQuery);
        while ($movie = $moviesResult->fetch_assoc()):
        ?>
          <div class="movie">
            <a href="detail.php?id=<?= $movie['id']; ?>">
              <img src="<?= htmlspecialchars($movie['poster_url']); ?>" alt="<?= htmlspecialchars($movie['title']); ?>" style="
                  width: 100%;
                  aspect-ratio: 5 / 7;
                  object-fit: cover;
                  border-radius: 6px;
                  display: block;
                ">
              <p class="movie-title"><?= htmlspecialchars($movie['title']); ?><br>(<?= $movie['release_year']; ?>)</p>
            </a>
          </div>
        <?php endwhile; ?>
      </div>
    </section>
  <?php endwhile; ?>
  <button onclick="scrollToTop()" id="scrollTopBtn" title="Go to top">&#8679;</button>
</main>

<script>
let slideIndex = 0;
const slides = document.querySelector('.slides');
const totalSlides = document.querySelectorAll('.hero-slide').length;

function showSlide(index) {
  if (index >= totalSlides) slideIndex = 0;
  else if (index < 0) slideIndex = totalSlides - 1;
  else slideIndex = index;
  slides.style.transform = `translateX(-${slideIndex * 100}%)`;
}

function plusSlides(n) {
  showSlide(slideIndex + n);
}

// Auto slide
setInterval(() => {
  plusSlides(1);
}, 5000);

// Scroll ke atas
window.onscroll = function () {
  const scrollBtn = document.getElementById("scrollTopBtn");
  if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
    scrollBtn.style.display = "block";
  } else {
    scrollBtn.style.display = "none";
  }
};

function scrollToTop() {
  window.scrollTo({ top: 0, behavior: 'smooth' });
}

// Animasi saat halaman dimuat
window.addEventListener('load', () => {
  const main = document.getElementById('mainContent');
  main.classList.remove('opacity-0', 'translate-y-6');
  main.classList.add('opacity-100', 'translate-y-0');

  // Efek zoom untuk gambar banner
  document.querySelectorAll('.hero-img').forEach(img => {
    img.classList.remove('opacity-0', 'scale-95');
    img.classList.add('opacity-100', 'scale-100');
  });

  // Efek muncul bertahap tiap section
  const sections = document.querySelectorAll('.category');
  sections.forEach((section, i) => {
    setTimeout(() => {
      section.classList.remove('opacity-0', 'translate-y-4');
      section.classList.add('opacity-100', 'translate-y-0');
    }, 300 * (i + 1));
  });
});

// Tampilkan slide pertama
showSlide(slideIndex);
</script>

<?php
include 'layout/footer.php';
$conn->close();
?>
