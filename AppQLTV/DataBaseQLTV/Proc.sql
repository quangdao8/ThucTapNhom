﻿use QuanLyThuVien
go

--1.Chi Tiet Muon
create proc them_CTM(@sopmt char(10),@macs char(10),@tiencoc money,@tienttoan money)
as
begin
	insert into ChiTietMuon values(@sopmt,@macs,@tiencoc,@tienttoan)
end
go

create proc sua_CTM(@sopmt char(10),@macs char(10),@ngayhtra date,@ngaytra date,@tiencoc money,@tienttoan money,@ttm nvarchar(4))
as
begin
	update ChiTietMuon
	set 
		tienCoc=@tiencoc,
		tienTToan=@tienttoan
	where soPMT=@sopmt and maCS=@macs
end
go

create proc xoa_CTM(@sopmt char(10),@macs char(10))
as
begin
	delete ChiTietMuon
	where soPMT=@sopmt and maCS=@macs
end
go

create proc get_CTM
as
begin
select soPMT as [Số PMT], maCS as [Mã cuốn sách],  tienCoc as [Tiền cọc], tienTToan as [Tiền thanh toán] from ChiTietMuon
end
go

--2.Chi Tiet Nhap
create proc get_CTN
as
begin
	select soPN as [Số PN], maTS as [Mã tựa sách], soLuong as [Số lượng], donGia as [Đơn giá] from ChiTietNhap
end
go

create proc get_CTNcuaPN(@soPN char(10))
as
begin
	select soPN as [Số PN], maTS as [Mã tựa sách], soLuong as [Số lượng], donGia as [Đơn giá]
	from ChiTietNhap
	where soPN=@soPN
end
go		

create proc them_CTN(@sopn char(10),@mats char(10),@soluong int,@dongia money)
as
begin
	insert into ChiTietNhap values(@sopn,@mats,@soluong,@dongia)
end
go

create proc sua_CTN(@sopn char(10),@mats char(10),@soluong int,@dongia money)
as
begin
	update ChiTietNhap
	set	maTS=@mats,
		soLuong=@soluong,
		donGia=@dongia
	where soPN=@sopn
end
go

create proc xoa_CTN(@sopn char(10))
as
begin
	delete ChiTietNhap
	where soPN=@sopn
end
go

--3.Cuon Sach
create proc get_CS
as
begin
	select maCS as [Mã CS], trangThai as [Trạng thái], maTS as [Mã TS] from CuonSach
end
go			

create proc them_CS(@macs char(10),@trangthai nvarchar(4),@mats char(10))
as
begin
	insert into CuonSach values(@macs,@trangthai,@mats)
end
go

create proc sua_CS(@macs char(10),@trangthai nvarchar(4),@mats char(10))
as
begin
	update CuonSach
	set trangThai=@trangthai,
		maTS=@mats
	where maCS=@macs
end
go

create proc xoa_CS(@macs char(10))
as
begin
	delete ChiTietMuon
	where maCS=@macs

	delete CuonSach
	where maCS=@macs
end
go

--4.Doc Gia
create proc them_DG(@madg char(10),@tendg nvarchar(30),@gioitinhdg nvarchar(3),@ngaysinhdg date,@diachidg nvarchar(50), @sdtdg char(13), @loaidg nvarchar(8))
as
begin
	insert into DocGia values (@madg,@tendg,@gioitinhdg,@ngaysinhdg,@diachidg,@sdtdg,@loaidg)
end
go

create proc sua_DG(@madg char(10),@tendg nvarchar(30),@gioitinhdg nvarchar(3),@ngaysinhdg date,@diachidg nvarchar(50), @sdtdg char(13), @loaidg nvarchar(8))
as
begin
	update DocGia
	set tenDG=@tendg,
		gioiTinh=@gioitinhdg,
		ngaySinh=@ngaysinhdg,
		diaChi=@diachidg,
		SDT=@sdtdg,
		loaiDG=@loaidg
	where maDG=@madg
end
go

create proc xoa_DG(@madg char(10))
as
begin
	declare @tb table(soPMT char(10))
	insert @tb select soPMT from PhieuMuonTra where maDG=@madg
	delete ChiTietMuon
	where soPMT in (select soPMT from @tb)

	delete PhieuMuonTra
	where maDG=@madg

	delete DocGia
	where maDG=@madg
end
go

create proc get_DG
as
begin
	select maDG as [Mã ĐG], tenDG as [Tên ĐG], gioiTinh as [Giới tính], ngaySinh as [Ngày sinh], diaChi as [Địa chỉ], SDT as [SĐT], loaiDG as [Loại ĐG] from DocGia
end
go

--5.NCC
create proc get_NCC
as
begin
	select maNCC as [Mã NCC], tenNCC as [Tên NCC], diaChi as [Địa chỉ], SDT as [SĐT], email as [Email] from NCC
end									
go

create proc them_NCC(@mancc char(10),@tenncc nvarchar(50),@diachincc nvarchar(50),@sdtncc char(13),@emailncc char(50))
as
begin
	insert into NCC values (@mancc,@tenncc,@diachincc,@sdtncc,@emailncc)
end
go

create proc sua_NCC(@mancc char(10),@tenncc nvarchar(50),@diachincc nvarchar(50),@sdtncc char(13),@emailncc char(50))
as
begin 
	update NCC
	set tenNCC=@tenncc,
	diaChi=@diachincc,
	SDT=@sdtncc,
	email=@emailncc
	where maNCC=@mancc
end		
go

create proc xoa_NCC(@mancc char(10))
as
begin
	delete ChiTietNhap
	where soPN in (select soPN from PhieuNhap where maNCC=@mancc)

	delete PhieuNhap
	where maNCC=@mancc

	update SachCN
	set maNCC=null
	where maNCC=@mancc

	delete NCC
	where maNCC=@mancc
end		
go

--6.NXB
create proc get_NXB
as
begin
	select maNXB as [Mã NXB], tenNXB as [Tên NXB], diaChi as [Địa chỉ], SDT as [SĐT], email as [Email] from NXB
end
go

create proc them_NXB(@manxb char(10),@tennxb nvarchar(50),@diachinxb nvarchar(30),@sdtnxb char(13),@emailnxb char(50))
as
begin
	insert into NXB(maNXB,tenNXB,diaChi,SDT,email) values(@manxb,@tennxb,@diachinxb,@sdtnxb,@emailnxb)
end
go

create proc sua_NXB(@manxb char(10),@tennxb nvarchar(50),@diachinxb nvarchar(30),@sdtnxb char(13),@emailnxb char(50))
as
begin
	update NXB
	set tenNXB=@tennxb,
		diaChi=@diachinxb,
		SDT=@sdtnxb,
		email=@emailnxb
	where maNXB=@manxb
end
go

create proc xoa_NXB(@manxb char(10))
as
begin
	delete TuaSach
	where maNXB=@manxb

	delete NXB
	where maNXB=@manxb
end
go

--7.Phieu Muon Tra
create proc them_PMT(@sopmt char(10),@ngaylappmt date,@ngayhtra date,@ngaytra date,@madg char(10),@matt char(10))
as
begin
	insert into PhieuMuonTra values(@soPMT,@ngaylappmt,@ngayhtra,@ngaytra,@madg,@matt)
end
go

create proc sua_PMT(@sopmt char(10),@ngaylappmt date,@ngayhtra date,@ngaytra date,@madg char(10),@matt char(10))
as
begin
	update PhieuMuonTra
	set ngayLap=@ngaylappmt,
		ngayHTra=@ngayhtra,
		ngayTra=@ngaytra,
		maDG=@madg,
		maTT=@matt
	where soPMT=@sopmt
end
go

create proc xoa_PMT(@sopmt char(10))
as
begin
	delete ChiTietMuon
	where soPMT=@sopmt

	delete PhieuPhat
	where soPMT=@sopmt

	delete PhieuMuonTra
	where soPMT=@sopmt
end
go

create proc get_PMT
as
begin
	select soPMT as [Số PMT], ngayLap as [Ngày lập],ngayHTra as [Ngày hẹn trả], ngayTra as [Ngày trả], maDG as [Mã độc giả], maTT as [Mã thủ thư] from PhieuMuonTra
end
go

--8.Phieu Nhap
create proc get_PN
as
begin
	select soPN as [Số PN], ngayLap as [Ngày lập], maTT as [Mã thủ thư], maNCC as [Mã NCC] from PhieuNhap
end
go

create proc them_PN(@sopn char(10),@ngaylap date,@matt char(10),@mancc char(10))
as
begin
	insert into PhieuNhap values(@sopn,@ngaylap,@matt,@mancc)
end		
go

create proc sua_PN(@sopn char(10),@ngaylap date,@matt char(10),@mancc char(10))
as
begin
	update PhieuNhap
	set ngayLap=@ngaylap,
	maTT=@matt,
	maNCC=@mancc
	where soPN=@sopn
end		
go

create proc xoa_PN(@sopn char(10))
as
begin
	delete ChiTietNhap
	where soPN=@sopn

	delete PhieuNhap
	where soPN=@sopn
end
go

--9.Phieu Phat
create proc them_PP(@sopp char(10),@ngaylap date,@loivp nvarchar(8),@tienphat money, @tensach nvarchar(50),@sopmt char(10))
as
begin
	insert into PhieuPhat values(@sopp,@ngaylap,@loivp,@tienphat,@tensach,@sopmt)
end
go

create proc sua_PP(@sopp char(10),@ngaylap date,@loivp nvarchar(8),@tienphat money, @tensach nvarchar(50),@sopmt char(10))
as
begin
	update PhieuPhat
	set ngayLap=@ngaylap,
		loiVP=@loivp,
		tienPhat=@tienphat,
		tenSach=@tensach,
		soPMT=@sopmt
	where soPP=@sopp
end
go

create proc xoa_PP(@sopp char(10))
as
begin
	delete PhieuPhat
	where soPP=@sopp
end
go

create proc get_PP
as
begin
	select soPP as [Số PP], ngayLap as [Ngày lập], loiVP as [Lỗi VP], tienPhat as [Tiền phạt], tenSach as [Tên sách], soPMT as [Số PMT] from PhieuPhat
end
go

--10.Sach Can Nhap
create proc get_SCN
as
begin
	select tenSach as [Tên sách], tacGia as [Tác giả], theLoai as [Thể loại], loaiHinhNhap as [Loại hình nhập], maTT as [Mã thủ thư], maNCC as [Mã NCC] from SachCN
end          
go

create proc them_SCN(@tensach nvarchar(50),@tacgia ntext,@theloai nvarchar(20),@loainhap nvarchar(9),@matt char(10),@mancc char(10))
as
begin
	insert into SachCN values(@tensach,@tacgia,@theloai,@loainhap,@matt,@mancc)
end  
go

create proc sua_SCN(@tensach nvarchar(50),@tacgia ntext,@theloai nvarchar(20),@loainhap nvarchar(9),@matt char(10),@mancc char(10))
as
begin
	update SachCN
	set tacGia=@tacgia,
		theLoai=@theloai,
		loaiHinhNhap=@loainhap,
		maTT=@matt,
		maNCC=@mancc
	where tenSach=@tensach
end	   
go

create proc xoa_SCN(@tensach nvarchar(50))
as
begin
	delete SachCN
	where tenSach=@tensach
end        	
go

--11.Tac Gia
create proc get_TG
as
begin
	select maTG as [Mã TG], tenTG as [Tên TG], gioiTinh as [Giới tính], ngaySinh as [Ngày sinh], queQuan as [Quê quán] from TacGia
end
go

create proc get_TGcuaTS(@maTS char(10))
as
begin
	select maTG as [Mã TG], tenTG as [Tên TG], gioiTinh as [Giới tính], ngaySinh as [Ngày sinh], queQuan as [Quê quán]
	from TacGia where maTG in (select maTG from Viet where maTS = @maTS)
end
go

create proc them_TG(@matg char(10),@tentg nvarchar(50),@gioitinhtg nvarchar(3),@ngaysinhtg date,@quequantg nvarchar(50))
as
begin
	insert into TacGia(maTG,tenTG,gioiTinh,ngaySinh,queQuan) values(@matg,@tentg,@gioitinhtg,@ngaysinhtg,@quequantg)
end
go

create proc sua_TG(@matg char(10),@tentg nvarchar(50),@gioitinhtg nvarchar(3),@ngaysinhtg date,@quequantg nvarchar(50))
as
begin
	update TacGia
	set tenTG=@tentg,
	gioiTinh=@gioitinhtg,
	ngaySinh=@ngaysinhtg,
	queQuan=@quequantg
	where maTG=@matg
end
go

create proc xoa_TG(@matg char(10))
as
begin
	delete Viet
	where maTG=@matg

	delete TacGia
	where maTG=@matg
end
go

--12.The Loai
create proc get_TL
as
begin
	select maTL as [Mã TL], tenTL as [Tên TL] from TheLoai
end
go      

create proc get_TLcuaTS(@maTS char(10))
as
begin
	select maTL as [Mã TL], tenTL as [Tên TL]
	from TheLoai where maTL in (select maTL from TS_TL where maTS = @maTS)
end
go

create proc them_TL(@matl char(10),@tentl nvarchar(50))
as
begin
	insert into TheLoai(maTL,tenTL) values(@matl,@tentl)
end
go

create proc sua_TL(@matl char(10),@tentl nvarchar(50))
as
begin 
	update TheLoai
	set tenTL=@tentl
	where maTL=@matl
end
go

create proc xoa_TL(@matl char(10))
as
begin
	delete TS_TL
	where maTL=@matl

	delete TheLoai
	where maTL=@matl
end
go

--13.Thu Thu
create proc them_TT(@matt char(10),@tentt nvarchar(30),@gioitinhtt nvarchar(3),@ngaysinhtt date,@diachitt nvarchar(50),@sdttt char(13),@capbac nvarchar(30))
as
begin
	insert into ThuThu values(@matt,@tentt,@gioitinhtt,@ngaysinhtt,@diachitt,@sdttt,@capbac)
end
go

create proc sua_TT(@matt char(10),@tentt nvarchar(30),@gioitinhtt nvarchar(3),@ngaysinhtt date,@diachitt nvarchar(50),@sdttt char(13),@capbac nvarchar(30))
as
begin
	update ThuThu
	set tenTT=@tentt,
		gioiTinh=@gioitinhtt,
		ngaySinh=@ngaysinhtt,
		diaChi=@diachitt,
		SDT=@sdttt,
		capBac=@capbac
	where maTT=@matt
end
go

create proc xoa_TT(@matt char(10))
as
begin
	delete PhieuMuonTra
	where maTT=@matt

	delete PhieuNhap
	where maTT=@matt

	delete ThuThu
	where maTT=@matt
end
go

create proc get_TT
as
begin
	select maTT as [Mã TT], tenTT as [Tên TT], gioiTinh as [Giới tính], ngaySinh as [Ngày sinh], diaChi as [Địa chỉ], SDT as [SĐT], capBac as [Cấp bậc] from ThuThu
end
go

--14.TS_TL
create proc get_TSTL
as
begin
	select maTS as [Mã TS], maTL as [Mã TL] from TS_TL
end
go
								
create proc them_TSTL(@mats char(10),@matl char(10))
as
begin
	insert into TS_TL(maTS,maTL) values(@mats,@matl)
end 
go

create proc sua_TSTL(@mats char(10),@matl char(10))
as
begin
	update TS_TL
	set maTL=@matl
	where maTS=@mats
end
go

create proc xoa_TSTL(@mats char(10),@matl char(10))
as
begin
	delete TS_TL
	where maTS=@mats and maTL=@matl
end
go

--15.TuaSach
create proc get_TS
as
begin
	select maTS as [Mã TS], tenTS as [Tên TS], namXB as [Năm XB], Gia as [Giá], viTri as [Vị trí], noiDungTT as [Nội dung TT], nnChinh as [Ngôn ngữ chính], maNXB as [Mã NXB] from TuaSach
end
go

create proc them_TS(@mats char(10),@tents nvarchar(50),@namxb int,@gia smallmoney,@vitri char(8),@noidung ntext,@nnchinh nvarchar(20),@manxb char(10))
as
begin
	insert into TuaSach values(@mats,@tents,@namxb,@gia,@vitri,@noidung,@nnchinh,@manxb)
end
go

create proc sua_TS(@mats char(10),@tents nvarchar(50),@namxb int,@gia smallmoney,@vitri char(8),@noidung ntext,@nnchinh nvarchar(20),@manxb char(10))
as
begin
	update TuaSach
	set tenTS=@tents,
		namXB=@namxb,
		Gia=@gia,
		viTri=@vitri,
		noiDungTT=@noidung,
		nnChinh=@nnchinh,
		maNXB=@manxb
	where maTS=@mats
end
go

create proc xoa_TS(@mats char(10))
as
begin
	delete TS_TL
	where maTS=@mats

	delete Viet
	where maTS=@mats

	delete CuonSach
	where maTS=@mats

	delete ChiTietNhap
	where maTS=@mats

	delete TuaSach
	where maTS=@mats
end
go

--16.Viet
create proc get_V
as
begin
	select maTS as [Mã TS], maTG as [Mã TG] from Viet
end		
go

create proc them_V(@mats char(10),@matg char(10))
as
begin
	insert into Viet values(@mats,@matg)
end
go

create proc xoa_V(@mats char(10),@matg char(10))
as
begin
	delete Viet
	where maTS=@mats and maTG=@matg
end
go

--17. ...

create proc get_CTMcuaPM(@soPMT char(10))
as
begin
	select ChiTietMuon.maCS as [Mã cuốn sách],  tenTS as [Tên Sách], tienCoc as [Tiền cọc], tienTToan as [Tiền thanh toán]
	from CuonSach	join ChiTietMuon
				on CuonSach.maCS=ChiTietMuon.maCS
					join TuaSach
				on CuonSach.maTS=TuaSach.maTS
	where soPMT=@soPMT
end
go

create proc get_PMTcuaDG(@maDG char(10))
as
begin
	select soPMT as [Số PMT], ngayLap as [Ngày lập],ngayHTra as [Ngày hẹn trả], ngayTra as [Ngày trả], maDG as [Mã độc giả], maTT as [Mã thủ thư]
	from PhieuMuonTra
	where maDG=@maDG
end
go

create proc get_DGcoMa(@maDG char(10))
as
begin
	select maDG as [Mã ĐG], tenDG as [Tên ĐG], gioiTinh as [Giới tính], ngaySinh as [Ngày sinh], diaChi as [Địa chỉ], SDT as [SĐT], loaiDG as [Loại ĐG]
	from DocGia
	where maDG=@maDG
end
go

create proc sua_TrangThaiCS(@maCS char(10), @trangthai nvarchar(4))
as
begin
	update CuonSach
	set trangThai=@trangthai
	where maCS=@maCS
end
go

create proc get_TenSach(@maCS char(10))
as
begin
	select tenTS from CuonSach join TuaSach on CuonSach.maTS=TuaSach.maTS
	where maCS=@maCS
end
go

create proc get_tien(@soPN char(10), @tongtien money output)
as
begin
	select @tongtien= SUM(soLuong*donGia) from ChiTietNhap where soPN=@soPN
end
go

create proc kiemtra_CS(@maCS char(10))
as
begin
	if exists (select maCS from CuonSach where maCS=@maCS and trangThai in (N'Tốt',N'Cũ'))
	select * from ChiTietMuon join PhieuMuonTra on ChiTietMuon.soPMT=PhieuMuonTra.soPMT
	where ngayTra is null and maCS=@maCS
end
go
--
create proc tinhTien_PMT(@soPMT char(10))
as
begin
	declare @dateLap char(10), @dateTra char(10), @dateHtra char(10)
	if exists (select * from PhieuMuonTra where soPMT=@soPMT)
		begin
			select @dateLap=ngayLap, @dateHtra=ngayHTra, @dateTra=ngayTra
			from PhieuMuonTra
			where soPMT=@soPMT
			if @dateTra is null 
				update ChiTietMuon
				set tienTToan=null
				where soPMT=@soPMT
			else if DATEDIFF(DD,@dateHtra,@dateTra)>=0
				update ChiTietMuon
				set tienTToan= DATEDIFF(DD,@dateLap,@dateHtra)*1000
				where soPMT=@soPMT
			else
				update ChiTietMuon
				set tienTToan= DATEDIFF(DD,@dateLap,@dateTra)*1000
				where soPMT=@soPMT
		end
end
go

----------------------------------Thongke tim kiem
create proc search(@tenTS nvarchar(50),@nn nvarchar(20),@maTL char(10),@maTG char(10))
as
begin
	declare @tb1 table(maTS char(10), tenTS nvarchar(50),namXB int,Gia money,viTri char(10))
	declare @tb2 table(maTS char(10), tenTS nvarchar(50),namXB int,Gia money,viTri char(10))
	declare @tb3 table(maTS char(10), tenTS nvarchar(50),namXB int,Gia money,viTri char(10))
	declare @tb4 table(maTS char(10), tenTS nvarchar(50),namXB int,Gia money,viTri char(10))
	if(@tenTS ='')
		insert into @tb1
		select maTS,tenTS,namXB,Gia,viTri
		from TuaSach
	else
		insert into @tb1
		select maTS,tenTS,namXB,Gia,viTri
		from TuaSach
		where tenTS like @tenTS+'%'

	if(@nn ='')
		insert	into @tb2
		select TuaSach.maTS,tenTS,namXB,Gia,viTri
		from TuaSach
	else
		insert	into @tb2
		select TuaSach.maTS,tenTS,namXB,Gia,viTri
		from TuaSach
		where nnChinh like @nn+'%'
		
			
	if(@maTL ='')
		insert into @tb3
		select TuaSach.maTS,tenTS,namXB,Gia,viTri
		from TuaSach 
	
	else	
		insert into @tb3
		select TuaSach.maTS,tenTS,namXB,Gia,viTri
		from TuaSach ,TS_TL
		where TuaSach.maTS = TS_TL.maTS and maTL=@maTL
	if(@maTG ='')
		insert into @tb4
		select TuaSach.maTS,tenTS,namXB,Gia,viTri
		from TuaSach
	
	else
		insert into @tb4
		select TuaSach.maTS,tenTS,namXB,Gia,viTri
		from TuaSach ,Viet
		where TuaSach.maTS = Viet.maTS and maTG=@maTG

	select maTS as[Mã Tựa Sách],tenTS as[Tên Tựa Sách],namXB as[Năm Xuất Bản],Gia as[Giá],viTri as[Vị Trí] from @tb1
	intersect
	select maTS as[Mã Tựa Sách],tenTS as[Tên Tựa Sách],namXB as[Năm Xuất Bản],Gia as[Giá],viTri as[Vị Trí] from @tb2
	intersect
	select maTS as[Mã Tựa Sách],tenTS as[Tên Tựa Sách],namXB as[Năm Xuất Bản],Gia as[Giá],viTri as[Vị Trí] from @tb3
	intersect
	select maTS as[Mã Tựa Sách],tenTS as[Tên Tựa Sách],namXB as[Năm Xuất Bản],Gia as[Giá],viTri as[Vị Trí] from @tb4
end
go


---------------------thong ke nhung doc gia muon sach------------------------
create proc tkdocgiadangmuon
as
begin
select maDG as [Mã ĐG], tenDG as [Tên ĐG], gioiTinh as [Giới tính], ngaySinh as [Ngày sinh], diaChi as [Địa chỉ], SDT as [SĐT]
from DocGia
where maDG in(select maDG from PhieuMuonTra where ngayTra is null)
end
go
---------------------thong ke doc gia khong tra sach dung han

create proc tkdocgiamuonquahan
as
begin
select DocGia.maDG as [Mã ĐG], tenDG as [Tên ĐG], gioiTinh as [Giới tính], ngaySinh as [Ngày sinh], diaChi as [Địa chỉ], SDT as [SĐT],soPMT as[Số Phiếu Mượn Trả]
from DocGia,PhieuMuonTra
where DocGia.maDG=PhieuMuonTra.maDG and (select DATEDIFF(day,ngayHTra,getdate()))>1 and ngayTra is null
end
go

--------------------thong ke so luong sach dang duoc muon theo ten sach
create proc tksachdangmuon
as
begin
select TuaSach.maTS as[Mã Tựa Sách],tenTS as[Tên Tựa Sách],count(CuonSach.maCS) as[Số Lượng Đang Được Mượn]
from TuaSach,CuonSach,ChiTietMuon,PhieuMuonTra
where TuaSach.maTS=CuonSach.maTS and CuonSach.maCS=ChiTietMuon.maCS and ChiTietMuon.soPMT=PhieuMuonTra.soPMT and PhieuMuonTra.ngayTra is null
group by TuaSach.maTS,tenTS
end
go

---thong ke sach duoc muon trong ngay
create proc tksachmuontrongngay(@date date)
as
begin
	declare @tb table([Ngày] date,[Số Lượng Sách Được Mượn] int)
	--if(@date='')
	--insert into @tb
	--select ngayLap,count (ChiTietMuon.soPMT)
	--from PhieuMuonTra,ChiTietMuon
	--where PhieuMuonTra.soPMT=ChiTietMuon.soPMT
	--group by ngayLap
	--else
	insert into @tb
	select ngayLap,count (ChiTietMuon.soPMT)
	from PhieuMuonTra,ChiTietMuon
	where PhieuMuonTra.soPMT=ChiTietMuon.soPMT and ngayLap=@date
	group by ngayLap

	select *from @tb
end

go