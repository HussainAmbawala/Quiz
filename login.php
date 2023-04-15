<!-- Author:Hussain Ambawala -->

<?php
include 'connection.php';

require_once 'vendor/autoload.php';
 
// init configuration 
$clientID = '161815194627-sja4585ume7bkd0artomp81prh2l13mv.apps.googleusercontent.com';
$clientSecret = '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';
$redirectUri = $base_url.'dashboard.php';
  
// create Client Request to access Google API 
$client = new Google_Client();
$client->setClientId($clientID);
$client->setClientSecret($clientSecret);
$client->setRedirectUri($redirectUri);
$client->addScope("email");
$client->addScope("profile");

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo $base_url.'assets/css/bootstrap.css'; ?>">
    <link rel="stylesheet" href="<?php echo $base_url.'assets/vendors/bootstrap-icons/bootstrap-icons.css';?>">
    <link rel="stylesheet" href="<?php echo $base_url.'assets/css/app.css'?>">
    <link rel="stylesheet" href="<?php echo $base_url.'assets/css/pages/auth.css'?>">

    <!-- SweetAlert -->
    <script src="<?php echo $base_url.'assets/js/sweetalert/sweetalert.min.js'; ?>"></script>
    <script src="<?php echo $base_url.'assets/js/sweetalert/sweetalert.js'; ?>"></script>
    <!-- SweetAlert -->

</head>

<body>
    <div id="auth">

        <div class="row h-100">
            <div class="col-lg-5 col-12">
                <div id="auth-left">

                    <h1 class="auth-title">Sign in with Google</h1>
                    
                    <a class="btn btn-custom btn-block btn-lg shadow-lg mt-5" href="<?php echo $client->createAuthUrl(); ?>">Sign In</a>

                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right" style="background-repeat: no-repeat; background-size: cover; 
                                            background-position:center; ">
                </div>
            </div>
        </div>

    </div>
</body>

</html>

