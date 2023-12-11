<?php
if (!isset($_SESSION['LoggedInUser']['id'])) {
    echo json_encode([
        'code' => 403,
        'message' => 'Unauthorized Request'
    ]);
    exit();
}
