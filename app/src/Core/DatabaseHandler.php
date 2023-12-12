<?php

namespace Core;

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
        $escapedData = array_map(array($this->connection, 'real_escape_string'), $data);

        $columns = implode(", ", array_keys($escapedData));
        $values = "'" . implode("', '", $escapedData) . "'";

        $sql = "INSERT INTO $table ($columns) VALUES ($values)";

        $result = mysqli_query($this->connection, $sql);
        if ($result) {
            return true;
        } else {
            return $sql . "<br>" . mysqli_error($this->connection);
        }
    }
}
