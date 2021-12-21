<?php
if (preg_match('/\.(?:png|jpg|jpeg|gif|css|js)$/', $_SERVER["SCRIPT_FILENAME"])) {
    return false;    // serve the requested resource as-is.
} else if (preg_match('/\.php$/', $_SERVER["SCRIPT_FILENAME"])) {
    require $_SERVER["SCRIPT_FILENAME"];
} else {
    require "index.php";
}
