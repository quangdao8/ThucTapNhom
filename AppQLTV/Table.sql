create database QuanLyThuVien
go

use QuanLyThuVien
go

create table DocGia(
	maDG char(10) not null,
	tenDG nvarchar(30) not null,
	gioiTinh nvarchar(3) not null,
	ngaySinh date not null,
	diaChi nvarchar(50),
	SDT char(13) not null,
	loaiDG nvarchar(8) not null
	constraint PK_DocGia primary key(maDG),
	constraint CK_DocGia_gioiTinh check (gioiTinh in (N'Nam',N'Nữ')),
	constraint CK_DocGia_loaiDG check( loaiDG in (N'Đọc',N'Mượn/Đọc'))
)

create table ThuThu(
	maTT char(10) not null,
	tenTT nvarchar(30) not null,
	gioiTinh nvarchar(3) not null,
	ngaySinh date not null,
	diaChi nvarchar(50),
	SDT char(13) not null,
	capBac nvarchar(30)
	constraint PK_ThuThu primary key(maTT),
	constraint CK_gioiTinh  check (gioiTinh in (N'Nam',N'Nữ'))
)

create table PhieuMuonTra(
	soPMT char(10) not null,
	ngayLap date not null,
	ngayHTra date not null,
	ngayTra date,
	maDG char(10) not null,
	maTT char(10) not null
	constraint PK_PhieuMuonTra primary key(soPMT)
)

create table PhieuPhat(
	soPP char(10) not null,
	ngayLap date not null,
	loiVP nvarchar(8) not null,
	tienPhat money not null,
	tenSach nvarchar(50) not null,
	soPMT char(10) not null
	constraint PK_PhieuPhat primary key(soPP),
	constraint CK_PhieuPhat_loiVP check (loiVP in (N'Làm mất',N'Làm hỏng',N'Trả muộn'))
)

create table ChiTietMuon(
	soPMT char(10) not null,
	maCS char(10) not null,
	tienCoc money,
	tienTToan money
	constraint PK_ChiTietMuon primary key(soPMT,maCS)
)

create table CuonSach(
	maCS char(10) not null,
	trangThai nvarchar(4) not null,
	maTS char(10) not null
	constraint PK_CuonSach primary key(maCS),
	constraint CK_CuonSach_trangThai check (trangThai in (N'Tốt',N'Cũ',N'Hỏng',N'Mất'))
)

create table TheLoai(
	maTL char(10) not null,
	tenTL nvarchar(20) not null
	constraint PK_TheLoai primary key(maTL)
)

create table TS_TL(
	maTS char(10) not null,
	maTL char(10) not null
	constraint PK_TS_TL primary key(maTS,maTL)
)

create table TuaSach(
	maTS char(10) not null,
	tenTS nvarchar(50) not NULL,
	namXB int,
	Gia smallmoney,
	viTri char(8) not null,
	noiDungTT ntext,
	nnChinh nvarchar(20),
	maNXB char(10) not null
	constraint PK_TuaSach primary key(maTS)
)

create table NXB(
	maNXB char(10) not null,
	tenNXB nvarchar(30) not null,
	diaChi nvarchar(50),
	SDT char(13) not null,
	email char(50)
	constraint PK_NXB primary key(maNXB)

)

create table Viet(
	maTS char(10) not null,
	maTG char(10) not null
	constraint PK_Viet primary key(maTS,maTG)
)

create table TacGia(
	maTG char(10) not null,
	tenTG nvarchar(30) not null,
	gioiTinh nvarchar(3) not null,
	ngaySinh date,
	queQuan nvarchar(50)
	constraint PK_TacGia primary key(maTG),
	constraint CK_TacGia_gioiTinh check(gioiTinh in(N'Nam',N'Nữ'))
)

create table ChiTietNhap(
	soPN char(10) not null,
	maTS char(10) not null,
	soLuong int not null,
	donGia money not null
	constraint PK_ChiTietNhap primary key(soPN,maTS)
)

create table PhieuNhap(
	soPN char(10) not null,
	ngayLap date not null,
	maTT char(10) not null,
	maNCC char(10) not null
	constraint PK_PhieuNhap primary key(soPN)
)

create table SachCN(
	tenSach char(10) not null,
	tacGia ntext not null,
	theLoai nvarchar(20),
	loaiHinhNhap nvarchar(9) not null,
	maTT char(10) not null,
	maNCC char(10)
	constraint PK_SachCN primary key(tenSach),
	constraint CK_SachCN_loaiHinhNhap check(loaiHinhNhap in(N'Nhập mới',N'Nhập thêm'))
)

create table NCC(
	maNCC char(10) not null,
	tenNCC nvarchar(30) not null,
	diaChi nvarchar(50),
	SDT char(13) not null,
	email char(50)
	constraint PK_NCC primary key(maNCC)
)

alter table PhieuMuonTra add
	constraint FK_PhieuMuonTra_DocGia_maDG foreign key(maDG) references DocGia(maDG),
	constraint FK_PhieuMuonTra_TheLoai_maTT foreign key(maTT) references ThuThu(maTT)

alter table PhieuPhat add
	constraint FK_PhieuPhat_PhieuMuonTra_soPMT foreign key(soPMT) references PhieuMuonTra(soPMT)

alter table ChiTietMuon add
	constraint FK_ChiTietMuon_PhieuMuonTra_soPMT foreign key(soPMT) references PhieuMuonTra(soPMT),
	constraint FK_ChiTietMuon_CuonSach_maCS foreign key(maCS) references CuonSach(maCS)

alter table CuonSach add
	constraint FK_CuonSach_TuaSach_maTS foreign key(maTS) references TuaSach(maTS)

alter table TS_TL add
	constraint FK_TS_TL_TuaSach_maTS foreign key(maTS) references TuaSach(maTS),
	constraint FK_TS_TL_TheLoai_maTL foreign key(maTL) references TheLoai(maTL)

alter table TuaSach add
	constraint FK_TuaSach_NXB_maNXB foreign key(maNXB) references NXB(maNXB)

alter table Viet add
	constraint FK_Viet_TuaSach_maTS foreign key(maTS) references TuaSach(maTS),
	constraint FK_Viet_TuaSach_maTG foreign key(maTG) references TacGia(maTG)

alter table ChiTietNhap add
	constraint FK_ChiTietNhap_PhieuNhap_soPN foreign key(soPN) references PhieuNhap(soPN),
	constraint FK_ChiTietNhap_TuaSach_maTS foreign key(maTS) references TuaSach(maTS)

alter table PhieuNhap add
	constraint FK_PhieuNhap_ThuThu_maTT foreign key(maTT) references ThuThu(maTT),
	constraint FK_PhieuNhap_NCC_maNCC foreign key(maNCC) references NCC(maNCC)

alter table SachCN add
	constraint FK_SachCN_ThuThu_maTT foreign key(maTT) references ThuThu(maTT),
	constraint FK_SachCN_NCC_maNCC foreign key(maNCC) references NCC(maNCC)