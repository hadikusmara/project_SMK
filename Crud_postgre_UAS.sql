--nama data base db_nama_kamu


CREATE TYPE SK AS enum ('SKW','BKW');
CREATE TYPE SP AS enum ('Honorer','Tetap');

CREATE TABLE guru (
  id_guru serial PRIMARY KEY NOT NULL,
  nip varchar(15) NOT NULL,
  nama_guru varchar(50) NOT NULL,
  tempat_lahir varchar(25) NOT NULL,
  tgl_lahir date NOT NULL,
  alamat text NOT NULL,
  no_ktp varchar(35) NOT NULL,
  status_keluarga SK NOT NULL,
  id_jabatan varchar(8) NOT NULL,
  foto varchar(15) NOT NULL,
  status_pegawai SP NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
  
) 

INSERT INTO guru (id_guru, nip, nama_guru, tempat_lahir, tgl_lahir, alamat, no_ktp, status_keluarga, id_jabatan, foto, status_pegawai) VALUES
(1101, '1117286', 'Ade', 'Jakarta', '1989-01-10', 'Bintaro', '3216061001890001', 'SKW', '21', '1101.jpg', 'Honorer'),
(1103, '1117282', 'Kosasih Muchtar', 'Jakarta', '1984-06-18', 'Jalan Cempedak 1 Blok C NO.69 RT001/015 Perumahan Jatimulya Bekasi Timur', '3216062705970001', 'BKW', '21', '1103.jpg', 'Tetap'),
(1104, '1117285', 'Dedi Haryanto', 'Magetan', '1987-01-02', 'Margahayu', '32162511790002', 'SKW', '21', '1104.jpg', 'Tetap'),
(1106, '1117289', 'Halim Kusuma', 'Bandung', '1978-01-08', 'Jalan Agus Salim Bekasi', '3210060801780009', 'SKW', '12', '1106.jpg', 'Tetap'),
(1107, '1117259', 'Zakaria Bawazier', 'Jakarta', '1979-01-22', 'Jalan Margahayu Raya Bekasi Timur', '3216062201790001', 'BKW', '21', '1107.jpg', 'Tetap');



CREATE TABLE matpel (
  id_matpel varchar(15) NOT NULL,
  nama_matpel varchar(70) NOT NULL,
  status_pelajaran varchar(15) NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
) ;


INSERT INTO matpel (id_matpel, nama_matpel, status_pelajaran) VALUES
('M0001', 'Pemograman VB', 'Aktif'),
('M0002', 'MTK', 'Aktif'),
('M0003', 'Bahasa Indonesia', 'Aktif'),
('M0004', 'Bahasa Inggris', 'Aktif'),
('M0005', 'Bahasa Sunda', 'Tidak Aktif');



CREATE TABLE nilai_siswa (
  id_nilai_siswa int NOT NULL,
  nis int NOT NULL,
  id_matpel varchar(15) NOT NULL,
  id_kelas int NOT NULL,
  id_guru int NOT NULL,
  id_tahun_ajaran int NOT NULL,
  id_semester int NOT NULL,
  nilai_harian1 decimal(4,2) DEFAULT NULL,
  nilaiharian2 decimal(4,2) DEFAULT NULL,
  nilaiharian3 decimal(4,2) DEFAULT NULL,
  nilai_tugas1 decimal(4,2) DEFAULT NULL,
  nilai_tugas2 decimal(4,2) DEFAULT NULL,
  nilai_uts decimal(4,2) DEFAULT NULL,
  nilai_uas decimal(4,2) DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
) 
;

INSERT INTO nilai_siswa (id_nilai_siswa, nis, id_matpel, id_kelas, id_guru, id_tahun_ajaran, id_semester, nilai_harian1, nilaiharian2, nilaiharian3, nilai_tugas1, nilai_tugas2, nilai_uts, nilai_uas) VALUES
(1, 2016102247, 'M0001', 125, 1103, 1, 1, '80.50', '80.00', '80.00', '80.00', '80.00', '80.00', '80.00'),
(2, 2016102247, 'M0003', 125, 1101, 1, 1, '85.00', '78.00', '89.00', '75.00', '89.00', '85.00', '87.00'),
(3, 2016102247, 'M0004', 125, 1106, 1, 1, '95.00', '80.00', '85.00', '80.00', '80.00', '84.00', '81.00'),
(4, 2016102247, 'M0002', 125, 1107, 1, 1, '78.00', '80.00', '79.00', '85.00', '80.00', '77.00', '76.00');

create type jk as enum('L','W');
CREATE TABLE siswa (
  nis int NOT NULL,
  nama_siswa varchar(50) NOT NULL,
  jenis_kelamin jk NOT NULL,
  tempat_lahir varchar(30) NOT NULL,
  tgl_lahir date NOT NULL,
  alamat text NOT NULL,
  no_hp varchar(15) NOT NULL,
  foto varchar(255) NOT NULL,
  id_kelas int NOT NULL,
  asal_sekolah varchar(50) NOT NULL,
  nama_ortu varchar(50) NOT NULL,
  pekerjaan_ortu varchar(20) NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
) 
;


INSERT INTO siswa (nis, nama_siswa, jenis_kelamin, tempat_lahir, tgl_lahir, alamat, no_hp, foto, id_kelas, asal_sekolah, nama_ortu, pekerjaan_ortu) VALUES
(2016102239, 'Raden Faris Jatmika', 'L', 'Bekas', '1998-01-08', 'Perumnas 1 Bekasi Timur', '085715150857', '2016102239.jpg', 124, 'SMPN 4 Tamsel', 'Jati', 'Pegawai Swasta'),
(2016102247, 'Khairunissa', 'W', 'Jakarta', '1998-12-13', 'Pondok Gede', '085814887522', '2016102247.jpg', 125, 'SMPN 12 Jatimakmur', 'Badriah', 'Guru'),
(2016102250, 'Dwi Sulistyo Nugroho', 'L', 'Bekasi Timur', '1997-05-27', 'Jalan Cempedak 1 Blok C No. 69RT007/015 Perumahan Jatimulya Bekasi Timur', '08111102723', '2016102250.jpg', 123, 'SMPN 4 Tamsel', 'Riyono', 'Wiraswasta'),
(2016103130, 'Vica Apriyanto', 'W', 'Bekasi', '1997-03-23', 'Jalan Toyogiri Selatan Bekasi Timur', '082728191887', '2016103130.jpg', 123, 'SMP Mandalahayu', 'Sumiati', 'Pegawai Swasta');



CREATE TABLE tahun_ajaran (
  id_tahun_ajaran int NOT NULL,
  nama_tahun_ajaran varchar(15) NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
) 
;


INSERT INTO tahun_ajaran (id_tahun_ajaran, nama_tahun_ajaran) VALUES
(1, '2021/2022');

CREATE TYPE JS AS enum ('SMA','SMK');
CREATE TABLE profil_sekolah (
  id_profil_sekolah int NOT NULL,
  nama_sekolah varchar(35) NOT NULL,
  alamat1 varchar(50) NOT NULL,
  alamat2 varchar(50) NOT NULL,
  telp  varchar(50) NOT NULL,
  jenis_sekolah  JS NOT NULL,
  nama_kepala_sekolah  varchar(50) NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
) ;



INSERT INTO profil_sekolah ( id_profil_sekolah , nama_sekolah , alamat1 ,  alamat2 ,  telp ,
  jenis_sekolah  ,  nama_kepala_sekolah 
 ) VALUES
(1, 'Pasundan Malam','Jl. Riung Beksi no. 40 ','Des Bojong,kec. babakan, kab.Bekasi Kota','021-62525277',
'SMA','Udin  Bin Nawi');
