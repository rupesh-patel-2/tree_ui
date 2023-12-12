<?php

namespace Core;

class DatabaseHandler
{

    private $connection;
    private $servername;
    private $username;
    private $password;
    private $dbname;

    public function __construct()
    {
        $config = require_once __DIR__ . '/Config/Database.php';
        $this->servername = $config['servername'];
        $this->username = $config['username'];
        $this->password = $config['password'];
        $this->dbname = $config['dbname'];

        $this->connection = mysqli_connect($this->servername, $this->username, $this->password, $this->dbname);


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
