<!-- Author:Hussain Ambawala -->

<?php 
include 'connection.php';  //db connection
require_once 'vendor/autoload.php';

$topics_fetch = mysqli_query( $con , "SELECT * FROM `topics` ");

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

// check authentication
if (isset($_GET['code'])) {
    $token = $client->fetchAccessTokenWithAuthCode($_GET['code']);
    if(!isset($token['access_token'])){

        // Reset OAuth access token
        $client->revokeToken();

        header("Location: ".$base_url."login.php");
    }
}else{
    header("Location: ".$base_url."login.php");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo $base_url.'assets/css/bootstrap.css';?>">

    <!-- SweetAlert -->
    <script src="<?php echo $base_url.'assets/js/sweetalert/sweetalert.min.js'; ?>"></script>
    <script src="<?php echo $base_url.'assets/js/sweetalert/sweetalert.js'; ?>"></script>
    <!-- SweetAlert -->

    <style>
        .wrapper{
            width: 100%;
            min-height: 100vh;
            background-image: -webkit-gradient(linear, left top, right top, from(rgba(38, 142, 255, 0.8)), to(rgba(91, 117, 255, 0.7))), url(bg_0.png);
            background-image: linear-gradient(to right, rgba(38, 142, 255, 0.8), rgba(91, 117, 255, 0.7)), url(bg_0.png);
            background-repeat: no-repeat;
            background-position: center right;
            background-size: cover;
            overflow: hidden;
        }

        .rounded-pill {
            border-radius: 50rem!important;
            background-color: #fff!important;
            color: #000a38;
            font-size: 1.6875rem;
            padding: 1.4rem 5rem;
            margin-top: 1rem;
        }

        label{
            width: auto;
            padding: 1.4rem 5rem;
            color: #004e7f;
            font-size: 1.5rem;
            font-weight: 500;
            background-color: #ffffff;
            /* margin-left: 6rem;
            margin-top: 1rem; */
            cursor: pointer;
            z-index: 2;
            border: 2px solid transparent;
            -webkit-transition: 0.5s cubic-bezier(0.25, 1, 0.5, 1);
            transition: 0.5s cubic-bezier(0.25, 1, 0.5, 1);
            overflow: hidden;
            border-radius: 50rem!important;

        }

        .form-check-input:checked {
            background-color: #000a38;
            border-color: #000a38;
        }

        input[type="radio"]{
            margin-top: 2rem;
        }
        .custom-color{
            background-color: #000a38;
            color: #fff!important;
        }
        .form-check{
            margin-left: 5rem;
        }
    </style>

</head>

<body>
    <div id="app">

        <div class="wrapper d-flex justify-content-center align-items-center">

            <div class="container h-100">

                <div class="row m-0 " id="start_quiz" >
                    <div class="col-xl-12 col-md-12 col-sm-12">
                        <div class="card card_height content-center">
                            <div class="card-content">
                                <div class="card-body">
                                    <hr>
                                    <h4 class="card-title my-4">Start Quiz</h4>

                                    <div class="form-group mb-4">
                                        <p class="col-md-6 p-0 m-0" for="topic">Select Topic</p>
                                        
                                        <select id="topic" class="form-select" >
                                            <option value="">Select...</option>
                                            <?php while($data = mysqli_fetch_array($topics_fetch))
                                                    { ?>
                                                <option value="<?php echo $data['tId']; ?>"><?php echo $data['topic']; ?></option>
                                            <?php } ?>
                                        </select>                                    
                                    </div>

                                    <a class="btn custom-color btn-lg" onclick="quiz()" >Start</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row m-0" id="score_quiz" >
                    <div class="col-xl-12 col-md-12 col-sm-12">
                        <div class="card card_height content-center">
                            <div class="card-content">
                                <div class="card-body">

                                    <div class="text-center">
                                        <img  src="checkmark.png" height="250" width="250" alt="image_not_found">
                                        <hr>
                                        <div class="sub_title">
                                            <span>Your submission has been received</span>
                                        </div>
                                        <div class="title pt-1">
                                            <h3>Thankyou For Giving the Quiz</h3>
                                        </div>
                                        <p class="card-text my-4">
                                            <h3><strong> Your Score : <span id="marks" class="text-info"></span></strong></h3>
                                        </p>
                                        <hr>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row m-0" id="quiz_content" >
                    <div class="col-xl-12 col-md-12 col-sm-12">
                        <input type="hidden" id="question_id" value="0">
                        <input type="hidden" id="question_number" value="0">
                        <input type="hidden" id="answer_option" >
                        <input type="hidden" id="score" value="0">
                        <h1 id="question" class="rounded-pill" > </h1>

                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="1" id="option0" >
                            <label class="form-check-label" id="labeloption0" for="option0">
                                option 1
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="2"  id="option1"  >
                            <label class="form-check-label" id="labeloption1" for="option1">
                                option 2
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="3" id="option2"  >
                            <label class="form-check-label" id="labeloption2" for="option2">
                                option 3
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="4" id="option3"  >
                            <label class="form-check-label" id="labeloption3" for="option3">
                                option 4
                            </label>
                        </div>
                        
                        <div class="row form-check mt-5">
                            <a id="next_button" class="btn custom-color w-25 ml-5" onclick="quiz()" >Next</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="<?php echo $base_url.'assets/js/bootstrap.bundle.min.js';?>"></script>

    <script>
        $('#score_quiz').hide();  //
        $('#quiz_content').hide();

        function quiz(){

            var option1 = $('#option0').is(':checked');
            var option2 = $('#option1').is(':checked');
            var option3 = $('#option2').is(':checked');
            var option4 = $('#option3').is(':checked');
            var question_number = $('#question_number');
            var question_id = $('#question_id');
            var topic = $('#topic');
            var answer = '';

            if(topic.val() != '' ){

                if(question_number.val() < 10 ){

                    if (option1 != false || option2 != false 
                            || option3 != false || option4 != false || question_number.val() == 0 ) {

                        if (option1 != false) {
                            answer = 1;
                        }
                        if (option2 != false) {
                            answer = 2;
                        }
                        if (option3 != false) {
                            answer = 3;
                        }
                        if (option4 != false) {
                            answer = 4;
                        }

                        var lId = 1;
                        if( question_number.val() > 3 && question_number.val() < 7 ){
                            lId = 2 
                        }else if ( question_number.val() > 6 ){
                            lId = 3
                        }
    
                        if ( question_number.val() == 9 ){
                            $('#next_button').text('Submit');
                        }

                        if($('#answer_option').val() != 0 && $('#answer_option').val() == answer ){

                            $('#score').val(parseInt($('#score').val()) + 1);
                        }
                        
                        $.ajax({
                            type:"POST",
                            data:{
                                'qId': question_id.val(),
                                'tId': topic.val(),
                                'lId': lId,
                            },
                            url:"<?php echo $base_url.'questionApi.php'; ?>",
                            success:function(responseText){
                                
                                if(responseText.response_code != 200){
                                    swal({
                                        title: 'Something went wrong, Please try again later!',
                                        icon: 'warning',
                                        buttons: true,
                                        dangerMode: true,
                                    });
                                }else{
                                    $('#quiz_content').show();
                                    $('#start_quiz').hide();
                                    $('#question').text(responseText.question);
                                    question_id.val(responseText.qId);
                                    question_number.val(parseInt(question_number.val()) + 1);
    
                                    $.each( responseText.options, function( key, value ) {
                                        $('#labeloption'+key).text(value.answer);
                                        if(value.isCorrect == 1){
                                            $('#answer_option').val(parseInt(key)+1);
                                        }
                                    });

                                    $('input[name="option"]').prop('checked', false);
                                }
                            },
                            error: function (e) {
                                $('#start_quiz').show();
                                swal({
                                    title: 'Something went wrong, Please try again later!',
                                    icon: 'warning',
                                    buttons: true,
                                    dangerMode: true,
                                });
                            }
                        });
                    }else{
                        swal({
                            title: 'Please select an Answer!',
                            icon: 'warning',
                            buttons: true,
                            dangerMode: true,
                        });
                    }

                }else{
                    $('#score_quiz').show();
                    $('#quiz_content').hide();
                    $('#marks').text($('#score').val());
                }

            }else{
                swal({
                    title: 'Please select Topic first to start the Quiz!',
                    icon: 'warning',
                    buttons: true,
                    dangerMode: true,
                });
            }
        }
    </script>

</body>

</html>