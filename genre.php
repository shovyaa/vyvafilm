<?php include 'layout/header.php'; ?>
<?php include 'koneksi.php'; ?>

<main class="genre-section px-6 py-10 text-white animate-page">
  <h2 class="border-b-2 border-red-600 pb-2 text-xl font-semibold">Genre</h2>

  <div class="genre-grid mt-6 flex flex-wrap gap-4">
    <?php
      $genreResult = mysqli_query($conn, "SELECT * FROM genres ORDER BY name ASC");
      $index = 0;
      while ($genre = mysqli_fetch_assoc($genreResult)) {
        $genreName = htmlspecialchars($genre['name']);
        $delay = $index * 100; // Delay bertahap
        echo "<a href='genre.php?genre=" . urlencode($genreName) . "'
          class='bg-[#2b2b2b] text-white py-2 px-4 rounded-lg text-base inline-block 
          transition-transform duration-200 hover:scale-105 opacity-0 translate-y-4'
          style='animation: fadeInUp 0.6s ease-out forwards; animation-delay: {$delay}ms;'>
          $genreName
        </a>";
        $index++;
      }
    ?>
  </div>

  <?php
    if (isset($_GET['genre'])) {
      $genreName = mysqli_real_escape_string($conn, $_GET['genre']);
      $genreQuery = "SELECT id FROM genres WHERE name = '$genreName'";
      $genreResult = mysqli_query($conn, $genreQuery);
      $genreRow = mysqli_fetch_assoc($genreResult);

      if ($genreRow) {
        $genreId = $genreRow['id'];

        $query = "
          SELECT movies.id AS movie_id, movies.title, movies.poster_url, movies.release_year
          FROM movies
          JOIN movie_genres ON movies.id = movie_genres.movie_id
          WHERE movie_genres.genre_id = $genreId
        ";
        $result = mysqli_query($conn, $query);

        echo "<h3 class='mt-10 text-lg font-medium'>Menampilkan film untuk genre: 
              <span class='text-red-500'>$genreName</span></h3>";
        echo "<div class='film-grid mt-6 flex flex-wrap gap-5'>";

        $i = 0;
        while ($row = mysqli_fetch_assoc($result)) {
          $title = htmlspecialchars($row['title']);
          $poster = htmlspecialchars($row['poster_url']);
          $releaseYear = $row['release_year'];
          $movieId = $row['movie_id'];
          $delay = $i * 100;

          echo "
            <a href='detail.php?id=$movieId'
              class='bg-[#1e1e1e] p-3 rounded-lg w-[180px] text-white no-underline block 
              transition-transform duration-200 hover:scale-105 opacity-0 translate-y-4'
              style='animation: fadeInUp 0.6s ease-out forwards; animation-delay: {$delay}ms;'>
              <img src='$poster' alt='$title' class='w-full rounded-md aspect-[5/7] object-cover'>
              <h4 class='mt-2 mb-1 text-base font-semibold'>$title</h4>
              <small class='text-gray-300'>$releaseYear</small>
            </a>
          ";
          $i++;
        }

        echo "</div>";
      } else {
        echo "<p class='text-red-500 mt-6'>Genre tidak ditemukan.</p>";
      }
    } else {
      echo "<p class='mt-10'>Silakan pilih genre untuk melihat daftar film.</p>";
    }
  ?>
</main>

<!-- Animasi CSS -->
<style>
  .animate-page {
    animation: fadePage 0.7s ease-out forwards;
    opacity: 0;
    transform: translateY(20px);
  }

  @keyframes fadePage {
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  @keyframes fadeInUp {
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }
</style>

<?php include 'layout/footer.php'; ?>
