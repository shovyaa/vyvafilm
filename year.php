<?php include 'layout/header.php'; ?>
<?php include 'koneksi.php'; ?>

<main class="px-6 py-10 text-white animate-page">
  <!-- Year section -->
  <h2 class="text-xl font-semibold border-b-2 border-red-600 pb-2">Year</h2>

  <div class="mt-6 flex flex-wrap gap-4">
    <?php
      $queryYears = "SELECT DISTINCT release_year FROM movies ORDER BY release_year DESC";
      $resultYears = mysqli_query($conn, $queryYears);

      if (mysqli_num_rows($resultYears) > 0) {
        $i = 0;
        while ($rowYear = mysqli_fetch_assoc($resultYears)) {
          $year = $rowYear['release_year'];
          $delay = $i * 100;

          echo "
            <a href='year.php?year=$year'
              class='bg-[#2b2b2b] text-white py-2 px-4 rounded-lg text-base inline-block transition-transform duration-200 hover:scale-105 opacity-0 translate-y-4'
              style='animation: fadeUp 0.8s ease-out forwards; animation-delay: {$delay}ms;'>
              $year
            </a>
          ";
          $i++;
        }
      } else {
        echo "<p class='text-gray-400'>Belum ada data tahun film.</p>";
      }
    ?>
  </div>

  <?php
    if (isset($_GET['year'])) {
      $selectedYear = (int) $_GET['year'];
      $query = "SELECT * FROM movies WHERE release_year = $selectedYear";
      $result = mysqli_query($conn, $query);

      echo "<h3 class='mt-10 text-lg'>Film Tahun: <span class='text-red-500 font-semibold'>$selectedYear</span></h3>";
      echo "<div class='mt-6 flex flex-wrap gap-6'>";

      if (mysqli_num_rows($result) > 0) {
        $j = 0;
        while ($row = mysqli_fetch_assoc($result)) {
          $title = htmlspecialchars($row['title']);
          $poster = htmlspecialchars($row['poster_url']);
          $movieId = $row['id'];
          $releaseYear = $row['release_year'];
          $delay = $j * 100;

          echo "
            <div class='bg-[#1e1e1e] p-3 rounded-lg w-[180px] transition-transform duration-200 hover:scale-105 opacity-0 translate-y-4'
              style='animation: fadeUp 0.8s ease-out forwards; animation-delay: {$delay}ms;'>
              <a href='detail.php?id=$movieId' class='text-white no-underline block'>
                <img src='$poster' alt='$title' class='w-full rounded-md aspect-[5/7] object-cover'>
                <h4 class='mt-2 mb-1 text-base font-semibold'>$title</h4>
              </a>
              <small class='text-gray-300'>$releaseYear</small>
            </div>
          ";
          $j++;
        }
      } else {
        echo "<p class='text-gray-400 mt-6'>Tidak ada film di tahun tersebut.</p>";
      }

      echo "</div>";
    } else {
      echo "<p class='mt-10'>Silakan pilih tahun untuk melihat daftar film.</p>";
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

  @keyframes fadeUp {
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }
</style>

<?php include 'layout/footer.php'; ?>
