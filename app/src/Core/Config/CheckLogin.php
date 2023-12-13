<?php
if (!isset($_SESSION['LoggedInUser'])) {
    echo json_encode([
        'code' => 403,
        'message' => 'Unauthorized Request'
    ]);
    exit();
}
