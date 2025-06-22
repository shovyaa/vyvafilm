<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>VyVaFilms</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> <!-- Font Awesome -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="icon" type="image/png" href="logo.jpeg">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  
</head>
<body>

  <header class="main-header">
    <div class="nav-left">
      <a href="index.php" class="nav-button"><i class="fas fa-home"></i> Home</a>
      <a href="genre.php" class="nav-button"><i class="fas fa-folder"></i> Genre</a>
      <a href="year.php" class="nav-button"><i class="fas fa-folder"></i> Year</a>
      <a href="mylist.php" class="nav-button"><i class="fas fa-bookmark"></i> Mylist</a>
    </div>
    <div class="nav-right">
      <form action="search.php" method="GET" style="display: flex; align-items: center;">
        <input class="search" type="text" name="query" placeholder="Cari Film Favoritmu......">
        <button class="search-btn" type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>

  </header>
