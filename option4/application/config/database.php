<?php

defined('BASEPATH') OR exit('No direct script access allowed');


if ($_SERVER['HTTP_HOST'] == 'localhost' || $_SERVER['HTTP_HOST'] == '127.0.0.1' || $_SERVER['HTTP_HOST'] == '192.168.50.53' || $_SERVER['HTTP_HOST'] == '192.168.50.33') {

    $host = 'localhost';
    $userName = 'root';
    $password = '';
    $database = 'dionescollection_fashion';
} else {
    $host = 'localhost';
    $userName = 'dionescollection_fashion';
    $password = 'I1tONGu&T)(Y';
    $database = 'dionescollection_fashion';
}
///jilan_db
///.J4QR1vzsu7O
///User: fakirxwb_jilan_db
///Database: fakirxwb_jilan_fashion


$active_group = 'default';
$query_builder = TRUE;

$db['default'] = array(
    'dsn' => '',
    'hostname' => $host,
    'username' => $userName,
    'password' => $password,
    'database' => $database,
    'dbdriver' => 'mysqli',
    'dbprefix' => '',
    'pconnect' => FALSE,
    'db_debug' => (ENVIRONMENT !== 'production'),
    'cache_on' => FALSE,
    'cachedir' => '',
    'char_set' => 'utf8',
    'dbcollat' => 'utf8_general_ci',
    'swap_pre' => '',
    'encrypt' => FALSE,
    'compress' => FALSE,
    'stricton' => FALSE,
    'failover' => array(),
    'save_queries' => TRUE
);
