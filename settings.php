<?php include('header.php'); ?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paramètres | Arcane Breaker</title>
    <!-- Lien vers le fichier CSS dynamique -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="styles.css" id="theme-link">
    <style>
        .theme-option button {
            margin: 10px;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .theme-option button.light-theme-btn {
            background-color: #f0be73;
            color: #000;
        }
        .theme-option button.dark-theme-btn {
            background-color: #e94560;
            color: #fff;
        }
        .theme-option button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <header>
        <h1>Arcane Breaker</h1>
        <nav>
            <ul>
                <li><a href="index.php">Accueil</a></li>
                <div class="profile-container" style="display: flex; align-items: center;">
            <?php if ($user_id): ?>
                <a href="profile.php">
                    <img src="<?php echo $profile_picture; ?>" alt="Photo de profil" style="width: 40px; height: 40px; border-radius: 50%; margin-right: 10px;">
                </a>
            <?php endif; ?>
        </div>
        <div class="menu-links" style="display: flex; align-items: center;">
            <?php if ($user_id): ?>
                <li><a href="logout.php">Se déconnecter</a></li>
            <?php else: ?>
                <li><a href="login.php">Connexion</a></li>
            <?php endif; ?>
            <li><a href="settings.php" style="margin-left: 20px;"><i class="bi bi-gear nav-icon"></i></a></li>
        </div>
    </ul>

        </nav>
    </header>

    <main class="settings-container">
        <h2>Paramètres</h2>
        <p>Changez le thème du site selon vos préférences :</p>
        <div class="theme-option">
            <button class="light-theme-btn" onclick="switchTheme('light')">Thème Clair</button>
            <button class="dark-theme-btn" onclick="switchTheme('dark')">Thème Sombre</button>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 Arcane Breaker. Tous droits réservés.</p>
    </footer>
</body>
</html>
