<?php
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;

function sendData($data = false, $status = false, $msg = null)
{
    if (!$status) {
        $status = $data ? true : false;
    }
    echo json_encode([
        "success" => $status,
        "result"  => $data ? $data : null,
        "msg"     => $msg,
    ]);
    exit();
}

function sendEmpty()
{
    return sendData([
        "success" => false,
        "result"  => null,
    ]);
}
function sendMail($to = '', $user = '', $message = '')
{

    $mail = new PHPMailer(true);
    try {
        //$mail->SMTPDebug = SMTP::DEBUG_SERVER;
        $mail->IsSMTP();
        $mail->SMTPDebug  = false;
        $mail->SMTPAuth   = true;
        $mail->charSet    = "utf-8";
        $mail->SMTPSecure = "ssl";
        $mail->Host       = "smtp.gmail.com";
        $mail->Port       = 587;
        $mail->Username   = USER_MAIL;
        $mail->Password   = USER_PASSWORD;
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;

        $mail->SetFrom(USER_MAIL, USER_NAME);
        $mail->AddReplyTo(USER_MAIL, USER_NAME);
        $mail->isHTML(true);
        $mail->Subject = "Confirmación de pedido en " . APP_NAME;
        $mail->MsgHTML($message);
        $mail->AddAddress($to, $user);
        $result = $mail->Send();
        
        if ($result) {
            return true;
        }
        return false;

    } catch (Exception $e) {
        return false;
    }

}
