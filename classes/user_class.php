<?php
require("../settings/db_class.php");

class user_class extends db_connection
{
	public function registerUser($username, $email, $password, $gender, $contact)
    {
        $ndb = new db_connection(); 
        
        $username = mysqli_real_escape_string($ndb->db_conn(), $username);
        $email = mysqli_real_escape_string($ndb->db_conn(), $email);
        $gender = mysqli_real_escape_string($ndb->db_conn(), $gender);
        $contact = mysqli_real_escape_string($ndb->db_conn(), $contact);
        $password = password_hash($password, PASSWORD_DEFAULT);
       

        
        $sql = "INSERT INTO `users`(`username`, `email`, `password_hash`, `gender`, `contact`) 
        VALUES ('$username', '$email', '$password', '$gender', '$contact')";
        return $this->db_query($sql);
	}
 
	
    public function loginUser($username, $password)
    {
        $ndb = new db_connection();
        
        $username = mysqli_real_escape_string($ndb->db_conn(), $username);
        $password = mysqli_real_escape_string($ndb->db_conn(), $password);
        
        $sql = "SELECT * FROM `users` WHERE `username` = '$username'";
        $result = $this->db_fetch_one($sql);
        
        if (!$result) {
            return false;
        }
        
        if ($result != null){

            $user = $result;
            if (password_verify($password, $user['password_hash'])) {
                return $user;
            } else {
                echo "password is wrong";
                return false;
            }
        } else {
            echo "Not Found";
            return false;
        }
    }

    public function viewAllCustomers(){
        $ndb = new db_connection();
        $sql = "SELECT * FROM users";
        return $this->db_fetch_all($sql); 

    }
      
}




