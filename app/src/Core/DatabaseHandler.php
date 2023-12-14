<?php

namespace Core;

class DatabaseHandler
{

    private $connection;
    private $servername;
    private $username;
    private $password;
    private $dbname;

    protected static $inst = false;

    public static function inst(){
        if(!self::$inst){
            self::$inst = new self();
        }
        return self::$inst;
    }

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

    public function select($table, $conditions = [], $orderBy = '', $joins = [], $columns = '*')
    {
        $query = "SELECT " . ($columns ? $columns : '*') . " FROM " . $table;

        if (!empty($joins)) {
            foreach ($joins as $join) {
                $query .= " " . $join;
            }
        }

        if (!empty($conditions)) {
            $whereClause = array();
            foreach ($conditions as $column => $value) {
                if ($value === null) {
                    $whereClause[] = "$column IS NULL";
                } else {
                    $value = mysqli_real_escape_string($this->connection, $value);
                    $whereClause[] = "$column = '$value'";
                }
            }
            $query .= " WHERE " . implode(" AND ", $whereClause);
        }

        if (!empty($orderBy)) {
            $query .= " ORDER BY " . $orderBy;
        }
        // echo $query; die;
        $result = mysqli_query($this->connection, $query);

        if (!$result) {
            return $query . "<br>" . mysqli_error($this->connection);
        }

        $data = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
        return $data;
    }


    public function update($table, $updateData, $conditions)
    {
        $query = "UPDATE " . $table . " SET ";

        $setClause = array();
        foreach ($updateData as $column => $value) {
            $value = mysqli_real_escape_string($this->connection, $value);
            $setClause[] = "$column = '$value'";
        }
        $query .= implode(", ", $setClause);

        if (!empty($conditions)) {
            $whereClause = array();
            foreach ($conditions as $column => $value) {
                $value = mysqli_real_escape_string($this->connection, $value);
                $whereClause[] = "$column = '$value'";
            }
            $query .= " WHERE " . implode(" AND ", $whereClause);
        }

        $result = mysqli_query($this->connection, $query);

        if (!$result) {
            return $query . "<br>" . mysqli_error($this->connection);
        }
        return $result;
    }

    public function prepareQuery($query = '', $params = [])
    {
        foreach ($params as $key => $value) {
            $replacements = '';
            if (isset($params[$key - 1])) {
                $replacements = mysqli_real_escape_string($this->connection, $params[$key - 1]);
            }
            $query = str_replace("##" . $key . "##", $replacements, $query);
        }
        return $query;
    }

    public static function generateUUId()
    {
        return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex(random_bytes(16)), 4));
    }

    public function delete($table)
    {
        $query = "DELETE FROM " . $table;

        if (!empty($conditions)) {
            $whereClause = array();
            foreach ($conditions as $column => $value) {
                $value = mysqli_real_escape_string($this->connection, $value);
                $whereClause[] = "$column = '$value'";
            }
            $query .= " WHERE " . implode(" AND ", $whereClause);
        }

        $result = mysqli_query($this->connection, $query);

        if (!$result) {
            return $query . "<br>" . mysqli_error($this->connection);
        }

        return $result;
    }

    public function beginTransaction()
    {
        $this->connection->begin_transaction();
    }

    public function commit()
    {
        $this->connection->commit();
    }

    public function rollback()
    {
        $this->connection->rollback();
    }
}
