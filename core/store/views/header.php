<!doctype html>

<html lang="en">
<head>
    <meta charset="utf-8">

    <title><?php echo $params['title']; ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,700,700i" rel="stylesheet">
    <link href="<?php echo BASE_URL . '/public/css/styles.css'; ?>" rel="stylesheet" type="text/css">
</head>

<body class="<?php echo str_replace( ' ', '', strtolower($params['title']) ); ?>">