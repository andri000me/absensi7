<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Absen_M extends CI_Model {
    public function __construct(){
        parent::__construct();
    }

    public function readS($table){
        $query = $this->db->get($table);
        return $query;
    }
    public function read($table,$dataCondition){
        $this->db->where($dataCondition);
        $query = $this->db->get($table);
        return $query;
    }
    public function create($table,$data){
        $query = $this->db->insert($table, $data);
        return $query;
        //return $this->db->set($data)->get_compiled_insert($table);
    }
    public function createId($table,$data){
        $result = $this->db->insert($table, $data);
        $insert_id = $this->db->insert_id();
        
        return $insert_id;
    }
    public function delete($table,$dataCondition){
        $this->db->where($dataCondition);
        $result = $this->db->delete($table);
        if (!$result) {
             $error = $this->db->error();
             return $error;
        }
        else{
            return $result;
        }
        //return $this->db->get_compiled_delete($table);
    }
    public function update($table,$dataCondition,$dataUpdate){
        $this->db->where($dataCondition);
        $result = $this->db->update($table,$dataUpdate);
        if (!$result) {
            return json_encode(array("status"=>false, "error_message"=>$this->db->error()));
        }else{
            return json_encode(array("status"=>true, "error_message"=>""));
        }
    }
    public function whereLike($table,$where,$like){
        $this->db->where($where);
        $this->db->like($like);
        $query = $this->db->get($table);
        return $query->result();
    }
    public function rawQuery($query){
        $result = $this->db->query($query);
        return $result;
    }
}
?>