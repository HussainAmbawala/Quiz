<?php
header("Content-Type:application/json");
include('connection.php');

if (isset($_POST['tId']) && $_POST['tId']!="") {
	
	$tId = $_POST['tId'];
	$lId = $_POST['lId'];
	$questionId = $_POST['qId'];

	$result = mysqli_query( $con , "SELECT * FROM `questions` WHERE 
										qId > $questionId AND topic = $tId AND level = $lId  LIMIT 1");

	if(mysqli_num_rows($result)>0){
        $row = mysqli_fetch_array($result);
        $question = $row['question'];
		$qId = $row['qId'];

		$options = mysqli_query( $con , "SELECT * FROM `answers` WHERE qId = $qId LIMIT 4");
		
		if(mysqli_num_rows($options)==4){

			while($row_data = mysqli_fetch_array($options))
			{
				$option_rows[] = array(
					"answer" => $row_data['answer'],
					"isCorrect" => $row_data['isCorrect'],
				);
			}

			response($qId, $question,$questionId,$option_rows,200);
		}else{
			response(NULL, NULL, NULL, NULL, 400);
		}
	}else{
		response(NULL, NULL, NULL, NULL, 400);
    }
}else{
	response(NULL, NULL, NULL, NULL, 400);
}

function response($qId,$question,$questionId,$option_rows,$response_code){
	$response['qId'] = $qId;
	$response['question'] = $question;
	$response['questionId'] = $questionId;
	$response['options'] = $option_rows;
	$response['response_code'] = $response_code;

	
	$json_response = json_encode($response);
	echo $json_response;
}
?>