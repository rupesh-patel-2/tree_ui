<?php

namespace config;

class DatabaseHandler
{

    private $connection;

    public function __construct()
    {
        $servername = "localhost";
        $username   = "root";
        $password   = "12345678";
        $dbname     = "site_editor_db";

        $this->connection = mysqli_connect($servername, $username, $password, $dbname);

        if (!$this->connection) {
            die("Connection failed: " . mysqli_connect_error());
        }
    }

    public function insert($table, $data)
    {

        // Escape the data to prevent SQL injection
        $escapedData = array_map(array($this->connection, 'real_escape_string'), $data);

        $columns = implode(", ", array_keys($escapedData));
        $values = "'" . implode("', '", $escapedData) . "'";

        $sql = "INSERT INTO $table ($columns) VALUES ($values)";

        return mysqli_query($this->connection, $sql);
    }
}
