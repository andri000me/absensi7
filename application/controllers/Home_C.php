<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home_C extends CI_Controller {

	/**
	 * home sebelum login
	 * handling pengajuan absen, ijin, login, logout
	 */
	public function __construct(){
		parent::__construct();
		date_default_timezone_set("Asia/Jakarta");
    }
    /**
    * untuk load halaman home/absen.php
    */
	public function index()
	{
		$this->load->view('html/header');
		$this->load->view('html/menu');
		$this->load->view('home/absen');
		$this->load->view('html/footer');
	}
	/**
    * untuk menangani form dari halaman home/absen.php
    * dipanggil melalui ajax di halaman absen.php
    */
	public function create_absen()
	{
		if ($this->input->post() != null) {
			# code...
		}
		else{
			# code...
		}
	}
	public function ijin()
	{
		# code...
	}
	public function create_ijin()
	{
		if ($this->input->post() != null) {
			# code...
		}
		else{
			# code...
		}
	}
	public function login()
	{
		# code...
	}
	public function logout()
	{
		# code...
	}
}
