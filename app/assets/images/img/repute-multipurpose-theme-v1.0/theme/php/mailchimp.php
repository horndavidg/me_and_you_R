<?php

if ( isset($_POST['email']) && $_POST['email'] != '' )
{
  // mailchimp API class
  require_once('inc/MCAPI.class.php');

  // Your API Key: http://admin.mailchimp.com/account/api/
  $api = new MCAPI('7f32cf0a2c8cd476213a4f6a9f62028d-us7');

  // Your List Unique ID: http://admin.mailchimp.com/lists/ (Click "settings")
  $list_id = "a651d5389d";

  // Variables in your form that match up to variables on your subscriber
  // list. You might have only a single 'name' field, no fields at all, or more
  // fields that you want to sync up.
  // Example: 
  /*
  
    $merge_vars = array(
    'FNAME' => $_POST['firstName'],
    'LNAME' => $_POST['lastName']
    );
  
  */

  $merge_vars = array();
  $result = false;

  // SUBSCRIBE TO LIST
  if ( $api->listSubscribe($list_id, $_POST['email'], $merge_vars) === true ){

    $mailchimp_result = 'Success! Check your email to confirm sign up.';
    $result = true;
  
  } else {
  
    $mailchimp_result = 'Error. ' . $api->errorMessage;
  }

  header("Content-type: application/json");
  echo json_encode( array( 'message' => $mailchimp_result, 'result' => $result ));
  die();

}else {

  header("Content-type: application/json");
  echo json_encode( array( 'message' => 'Please provide your email to subscribe to our newsletter.', 'result' => false ));
  die();
  
}

?>