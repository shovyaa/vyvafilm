<?php
session_start();
include 'koneksi.php';
include 'layout/header.php';

if (!isset($_GET['id'])) {
    echo "<p>Film tidak ditemukan.</p>";
    include 'layout/footer.php';
    exit;
}

$movie_id = intval($_GET['id']);

// Ambil detail film
$query = "SELECT * FROM movies WHERE id = $movie_id";
$result = $conn->query($query);
if ($result->num_rows === 0) {
    echo "<p>Film tidak ditemukan.</p>";
    include 'layout/footer.php';
    exit;
}
$movie = $result->fetch_assoc();

// Ambil genre film
$genre_result = $conn->query("SELECT name FROM genres
                              JOIN movie_genres ON genres.id = movie_genres.genre_id
                              WHERE movie_genres.movie_id = $movie_id");
$genres = [];
while ($g = $genre_result->fetch_assoc()) {
    $genres[] = $g['name'];
}

// Ambil rating
$rating_result = $conn->query("SELECT AVG(rating) AS avg_rating, COUNT(*) AS vote_count FROM ratings WHERE movie_id = $movie_id");
$rating_data = $rating_result->fetch_assoc();
$average_rating = $rating_data['avg_rating'] ?? 0;
$vote_count = $rating_data['vote_count'] ?? 0;

// Ambil film terkait
$genre_ids = $conn->query("SELECT genre_id FROM movie_genres WHERE movie_id = $movie_id");
$genre_id_list = [];
while ($g = $genre_ids->fetch_assoc()) {
    $genre_id_list[] = $g['genre_id'];
}

$relatedMovies = false;
if (!empty($genre_id_list)) {
    $genre_id_str = implode(',', $genre_id_list);
    $relatedQuery = "
        SELECT DISTINCT m.*
        FROM movies m
        JOIN movie_genres mg ON m.id = mg.movie_id
        WHERE mg.genre_id IN ($genre_id_str) AND m.id != $movie_id
        LIMIT 6
    ";
    $relatedMovies = $conn->query($relatedQuery);
}

// Sinopsis pendek
$full_synopsis = htmlspecialchars($movie['description']);
$short_synopsis_limit = 200;
$short_synopsis = $full_synopsis;
$needs_truncation = false;
if (strlen($full_synopsis) > $short_synopsis_limit) {
    $short_synopsis = substr($full_synopsis, 0, $short_synopsis_limit);
    $short_synopsis = substr($short_synopsis, 0, strrpos($short_synopsis, ' '));
    $needs_truncation = true;
}
?>

<link rel="stylesheet" href="/css/detail.css">

<style>
  .fade-in, .zoom-in, .slide-up {
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.8s ease, transform 0.8s ease;
  }
  .fade-in.show, .zoom-in.show, .slide-up.show {
    opacity: 1;
    transform: translateY(0);
  }
  .zoom-in {
    transform: scale(0.95);
  }
  .zoom-in.show {
    transform: scale(1);
  }
</style>

<main class="detail-page fade-in" id="mainContent">
    <div class="detail-container zoom-in" id="detailContainer">
        <img src="<?= htmlspecialchars($movie['poster_url']); ?>" alt="<?= htmlspecialchars($movie['title']); ?>" class="detail-poster">
        <div class="detail-info">
            <h1 class="text-3xl font-bold"><?= htmlspecialchars($movie['title']); ?> (<?= $movie['release_year']; ?>)</h1>
            <p style="color: #ccc; margin-top: 10px;"><?= htmlspecialchars($movie['tagline'] ?? ''); ?></p>
            <p style="font-weight: 300;">
                <span><?= date('d M Y', strtotime($movie['release_date'])); ?></span>
                <span style="font-weight: bold; margin: 0 10px;"><?= htmlspecialchars($movie['language']); ?></span>
                <span><?= $movie['duration']; ?> Min</span>
            </p>

            <div style="margin-top: 10px; padding: 15px 0; position: relative;">
                <div style="height: 2px; background: linear-gradient(to right, #999999, #ff0000); position: absolute; top: 0; left: 0; right: 0;"></div>

                <div class="rating-info">
                    <div class="rating-score"><?= number_format($average_rating, 1); ?></div>
                    <div class="star-rating">
                        <?php
                        $filledStars = floor($average_rating);
                        for ($i = 1; $i <= 10; $i++) {
                            echo '<i class="fa-solid fa-star' . ($i <= $filledStars ? ' filled' : '') . '"></i>';
                        }
                        ?>
                    </div>
                    <div class="votes-info">
                        <i class="fa-solid fa-users"></i> <?= $vote_count; ?> votes
                    </div>
                </div>

                <div style="height: 2px; background: linear-gradient(to right, #999999, #ff0000); position: absolute; bottom: 0; left: 0; right: 0;"></div>
            </div>

            <div style="position: relative; margin: 10px 0; padding-bottom: 10px;">
                <?php foreach ($genres as $g): ?>
                    <span class="genre-badge"><?= htmlspecialchars($g); ?></span>
                <?php endforeach; ?>
                <div style="height: 3px; background: linear-gradient(to right, #999999, #ff0000); position: absolute; bottom: 0; left: 0; right: 0;"></div>
            </div>

            <form action="add_to_mylist.php" method="POST">
                <input type="hidden" name="movie_id" value="<?= $movie['id']; ?>">
                <button type="submit" class="btn-mylist">
                    <i class="fa-solid fa-bookmark" style="margin-right: 8px;"></i> Tambahkan Ke MyList
                </button>
            </form>
        </div>
    </div>

    <section class="slide-up" id="sinopsisSection">
        <div class="synopsis-header" id="synopsisHeader">
            <span>Synopsis</span>
            <i class="fa-solid fa-chevron-down"></i>
        </div>
        <div class="synopsis-content" id="synopsisContent">
            <p class="synopsis-paragraph" id="shortSynopsisText">
                <?= nl2br($short_synopsis); ?>
                <?php if ($needs_truncation): ?>
                    <span class="read-more-btn" id="readMoreBtn">Read More...</span>
                <?php endif; ?>
            </p>
            <?php if ($needs_truncation): ?>
                <p class="synopsis-paragraph full-synopsis-text" style="display: none;">
                    <?= nl2br($full_synopsis); ?>
                </p>
            <?php endif; ?>
        </div>
    </section>

    <?php if (!empty($movie['video_url'])): ?>
        <?php
        preg_match('/(?:youtu\.be\/|youtube\.com\/(?:watch\?v=|embed\/))([^\&\?\/]+)/', $movie['video_url'], $matches);
        $youtube_id = $matches[1] ?? '';
        $embed_url = $youtube_id ? "https://www.youtube.com/embed/$youtube_id" : '';
        ?>
        <?php if ($embed_url): ?>
        <div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; border-radius: 10px; margin: 30px 0;">
            <iframe src="<?= $embed_url ?>" frameborder="0" allowfullscreen
                style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
            </iframe>
        </div>
        <?php endif; ?>
    <?php endif; ?>

    <?php if ($relatedMovies && $relatedMovies->num_rows > 0): ?>
    <section>
        <h2 style="border-bottom: 1px solid red; padding-bottom: 5px;">Film terkait</h2>
        <div class="related-movies slide-up" id="relatedSection" style="display: flex; flex-wrap: wrap; gap: 20px;">
            <?php while ($related = $relatedMovies->fetch_assoc()): ?>
                <a href="detail.php?id=<?= $related['id']; ?>" style="
                    width: 150px;
                    text-decoration: none;
                    color: white;
                    text-align: center;
                ">
                    <img src="<?= htmlspecialchars($related['poster_url']); ?>" alt="<?= htmlspecialchars($related['title']); ?>" style="
                        width: 100%;
                        border-radius: 8px;
                        object-fit: cover;
                    ">
                    <div style="
                        margin-top: 8px;
                        font-size: 14px;
                        line-height: 1.3;
                        word-wrap: break-word;
                        white-space: normal;
                        overflow-wrap: break-word;
                    ">
                        <?= htmlspecialchars($related['title']); ?> (<?= $related['release_year']; ?>)
                    </div>
                </a>
            <?php endwhile; ?>
        </div>
    </section>
    <?php endif; ?>
</main>

<script>
document.addEventListener('DOMContentLoaded', function () {
    const synopsisHeader = document.getElementById('synopsisHeader');
    const synopsisContent = document.getElementById('synopsisContent');
    const readMoreBtn = document.getElementById('readMoreBtn');
    const fullSynopsisText = document.querySelector('.full-synopsis-text');
    const shortSynopsisText = document.getElementById('shortSynopsisText');
    const chevronIcon = synopsisHeader.querySelector('i');

    function toggleSynopsis() {
        synopsisContent.classList.toggle('expanded');
        if (synopsisContent.classList.contains('expanded')) {
            if (fullSynopsisText) fullSynopsisText.style.display = 'block';
            if (shortSynopsisText) shortSynopsisText.style.display = 'none';
            if (readMoreBtn) readMoreBtn.style.display = 'none';
            chevronIcon.classList.replace('fa-chevron-down', 'fa-chevron-up');
        } else {
            if (fullSynopsisText) fullSynopsisText.style.display = 'none';
            if (shortSynopsisText) shortSynopsisText.style.display = 'block';
            if (readMoreBtn) readMoreBtn.style.display = 'inline';
            chevronIcon.classList.replace('fa-chevron-up', 'fa-chevron-down');
        }
    }

    synopsisHeader.addEventListener('click', toggleSynopsis);
    if (readMoreBtn) {
        readMoreBtn.addEventListener('click', function (event) {
            event.stopPropagation();
            toggleSynopsis();
        });
    }

    // Animasi on load
    setTimeout(() => {
        document.getElementById('mainContent')?.classList.add('show');
        document.getElementById('detailContainer')?.classList.add('show');
        document.getElementById('sinopsisSection')?.classList.add('show');
        document.getElementById('relatedSection')?.classList.add('show');
    }, 100);
});
</script>

<?php
include 'layout/footer.php';
$conn->close();
?>
