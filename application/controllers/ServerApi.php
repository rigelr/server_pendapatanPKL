
<?php
defined('BASEPATH') or exit('No direct script access allowed');
class ServerApi extends CI_Controller
{

	//Fungsi Staff
	function loginStaff()
	{
		$username = $this->input->post('username');
		$password = $this->input->post('password');

		$this->db->where('username', $username);
		$this->db->where('password', $password);

		$q = $this->db->get('pasar');

		if ($q->num_rows() > 0) {
			$data['message'] = 'Login Success';
			$data['status'] = 200;
			$data['staff'] = $q->row();
			$data['pendapatan'] = $this->db->query(
				"SELECT * FROM pendapatan WHERE id_pasar = " . $data['staff']->id_pasar ." and status = 0 and realisasi = 0"
				)->result_array();
		} else {
			$data['message'] = 'Email atau Password Salah';
			$data['status'] = 404;
		}
		echo json_encode($data);
	}

	// fungsi untuk CREATE
	public function addStaff()
	{
		// deklarasi variable
		$name = $this->input->post('name');
		$hp = $this->input->post('hp');
		$alamat = $this->input->post('alamat');
		// isikan variabel dengan nama file
		$data['staff_name'] = $name;
		$data['staff_hp'] = $hp;
		$data['staff_alamat'] = $alamat;
		$q = $this->db->insert('tb_staff', $data);
		// check insert berhasil apa nggak
		if ($q) {
			$response['pesan'] = 'insert berhasil';
			$response['status'] = 200;
		} else {
			$response['pesan'] = 'insert error';
			$response['status'] = 404;
		}
		echo json_encode($response);
	}
	// fungsi untuk READ
	public function getDataStaff()
	{
		$q = $this->db->get('pasar');
		if ($q->num_rows() > 0) {
			$response['pesan'] = 'data ada';
			$response['status'] = 200;
			// 1 row
			$response['staff'] = $q->row();
			$response['staff'] = $q->result();
		} else {
			$response['pesan'] = 'data tidak ada';
			$response['status'] = 404;
		}
		echo json_encode($response);
	}
	// fungsi untuk DELETE
	public function deleteStaff()
	{
		$id = $this->input->post('id');
		$this->db->where('staff_id', $id);
		$status = $this->db->delete('tb_staff');
		if ($status == true) {
			$response['pesan'] = 'hapus berhasil';
			$response['status'] = 200;
		} else {
			$response['pesan'] = 'hapus error';
			$response['status'] = 404;
		}
		echo json_encode($response);
	}
	// fungsi untuk UPDATE
	public function updateStaff()
	{
		// deklarasi variable
		$id = $this->input->post('id');
		$name = $this->input->post('name');
		$hp = $this->input->post('hp');
		$alamat = $this->input->post('alamat');
		$this->db->where('staff_id', $id);
		// isikan variabel dengan nama file
		$data['staff_name'] = $name;
		$data['staff_hp'] = $hp;
		$data['staff_alamat'] = $alamat;
		$q = $this->db->update('tb_staff', $data);
		// check insert berhasil apa nggak
		if ($q) {
			$response['pesan'] = 'update berhasil';
			$response['status'] = 200;
		} else {
			$response['pesan'] = 'update error';
			$response['status'] = 404;
		}
		echo json_encode($response);
	}

	public function getDataPendapatan() { 	
		$id = $this->input->get('id');
		$query = "SELECT * FROM pendapatan WHERE id_pasar = $id and (realisasi = 0 or realisasi is null)";

		echo json_encode([
			'status' => 200,
			'data' => $this->db->query($query)->result_array()
		]);
	}

	public function updatePendapatan()
	{
		$input = $this->input->post();
		$data['realisasi'] = $input['realisasi'];
		$data['bukti_setor'] = $this->do_upload('bukti_setor');
		$data['sts'] = $this->do_upload('sts');
		$data['status'] = 1;

		$this->db->where('id_pendapatan', $input['id_pendapatan']);
		$q = $this->db->update('pendapatan', $data);
		if ($q) {
			$response['pesan'] = 'update berhasil';
			$response['status'] = 200;
			$response['data'] = true;
		} else {
			$response['pesan'] = 'update error';
			$response['status'] = 404;
			$response['data'] = false;
		}
		echo json_encode($response);
	}

	function do_upload($name)
	{
		$this->load->library('upload');
		$this->load->library('image_lib');

		$config_resize['image_library']	= 'gd2';
		$nama_folder = 'gambar';
		if (!file_exists('gambar')) {
			mkdir('gambar', true);
		}

		$config = array();
		$config['upload_path']	= $nama_folder . '/';
		$config['allowed_types'] = 'gif|jpg|png';
		$config['max_size']		= '2048';
		$config['overwrite']	= TRUE;

		$files = $_FILES;
		$_FILES[$name]['name']		= $files[$name]['name'];
		$_FILES[$name]['type']		= $files[$name]['type'];
		$_FILES[$name]['tmp_name']	= $files[$name]['tmp_name'];
		$_FILES[$name]['error']	    = $files[$name]['error'];
		$_FILES[$name]['size']		= $files[$name]['size'];

		$config['file_name'] = md5(rand(100, 1000) . $_FILES[$name]['name']);

		$this->load->library('upload', $config);
		$this->upload->initialize($config);

		if ($this->upload->do_upload($name)) {
			$var = $this->upload->data();

			$config_resize = array();
			$config_resize['source_image']		= $var['full_path'];
			$config_resize['width']				= 200;
			$config_resize['height']			= 200;
			$config_resize['maintain_ratio']	= TRUE;
			$config_resize['new_image'] 		= $var['file_path'] . 'preview_' . $var['file_name'];

			return $var['file_name'];
		}
	}
}
