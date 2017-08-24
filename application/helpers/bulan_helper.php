<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/*
* konversi bulan ke bahasa indonesia
*/
if ( ! function_exists('tanggal')){
	function bulan($var = ''){
		// return $var;
		$tgl = array("Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","November","Desember");
		$pecah = explode("-", $var);
		return $pecah[2]." ".$tgl[$pecah[1] - 1]." ".$pecah[0];
	}
}