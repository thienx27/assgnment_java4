use JAVA4
go

delete DonHangChiTiet
delete DonHang
delete khachHang
delete SanPham
delete LoaiSP
delete NhanVien
go

DBCC CHECKIDENT ('KhachHang', RESEED, 0)
DBCC CHECKIDENT ('DonHang', RESEED, 0)
DBCC CHECKIDENT ('DonHangChiTiet', RESEED, 0)
go

insert into NhanVien values (N'a@gmail.com',N'Nguyễn Văn A',N'123',0)
insert into NhanVien values (N'b@gmail.com',N'Nguyễn Văn B',N'123',0)
insert into NhanVien values (N'c@gmail.com',N'Nguyễn Văn C',N'123',0)
go

insert into LoaiSP values (N'TTNA',N'THỜI TRANG NAM')
insert into LoaiSP values (N'TTNU',N'THỜI TRANG NỮ')
insert into LoaiSP values (N'TTTE',N'THỜI TRANG TRẺ EM')
insert into LoaiSP values (N'TX',N'TÚI XÁCH')
insert into LoaiSP values (N'BIK',N'BIKINI')
insert into LoaiSP values (N'GD',N'GIÀY DÉP')
go

insert into SanPham values (N'SP01',N'Túi xách gucci',23,N'Còn hàng',N'TX',N'Gucci',N'product1.jpg',N'Túi xách gucci sẽ mang lại vẻ sành điệu và thời trang cho bạn!')
insert into SanPham values (N'SP02',N'Giày nike cho nữ',150,N'Còn hàng',N'GD',N'Nike',N'product2.jpg',N'Thời trang và sành điệu, không còn gì để nói!')
insert into SanPham values (N'SP03',N'Giày đôn chề cho nữ',130,N'Còn hàng',N'GD',N'Đôn chề',N'product3.jpg',N'Trất, phải nói là rất trất')
insert into SanPham values (N'SP04',N'Váy dạ hội nữ',500,N'Hết hàng',N'TTNU',N'Gucci',N'product4.jpg',N'Thời trang nữ siêu đẹp, đảm bảo sẽ làm các chàng thích mê!')
insert into SanPham values (N'SP05',N'Túi xách lv',70,N'Còn hàng',N'TX',N'LV',N'product5.jpg',N'Túi xách LV phiên bản limited sẽ làm cho bạn nổi bật trong đám đông!')
insert into SanPham values (N'SP06',N'BIKINI đỏ',20,N'Còn hàng',N'BIK',N'Gucci',N'product6.jpg',N'Thời trang đi biển siêu đẹp cho bạn!')
insert into SanPham values (N'SP07',N'Thời trang cho bé 01',150,N'Còn hàng',N'TTTE',N'LV',N'product7.jpg',N'Thời trang trẻ em siêu sành điệu cho bé của bạn!')
insert into SanPham values (N'SP08',N'Thời trang cho bé 02',150,N'Hết hàng',N'TTTE',N'Nike',N'product8.jpg',N'Thời trang trẻ em siêu sành điệu cho bé của bạn!')
insert into SanPham values (N'SP09',N'Thời trang đi học nữ',250,N'Còn hàng',N'TTNU',N'Đôn chề',N'product9.jpg',N'Sành điệu và quyến rũ, bộ cánh này sẽ giúp bạn qua môn một cách very easy!')
insert into SanPham values (N'SP10',N'Thời trang cho nam 01',350,N'Còn hàng',N'TTNA',N'Man',N'product10.jpg',N'Sang trọng và lãm, bộ cánh này sẽ làm cho các cô gái không thể rời mắt khỏi bạn!')
insert into SanPham values (N'SP11',N'Thời trang cho nam 02',270,N'Còn hàng',N'TTNA',N'Man',N'product11.jpg',N'Sang trọng và lãm, bộ cánh này sẽ làm cho các cô gái không thể rời mắt khỏi bạn!')
insert into SanPham values (N'SP12',N'BIKINI 2 mảnh',75,N'Còn hàng',N'BIK',N'Gucci',N'product12.jpg',N'Thời trang đi biển siêu sexy cho các nàng!')
go

insert into khachHang values (N'Lò Thị A',N'lta@gmail.com',N'111',N'Trần Duy Hưng',N'0000000000')
insert into khachHang values (N'Lò Thị B',N'ltb@gmail.com',N'111',N'Trần Duy Hưng',N'0000000001')
insert into khachHang values (N'Lò Thị C',N'ltc@gmail.com',N'111',N'Trần Duy Hưng',N'0000000002')
go

insert into DonHang values (N'Lò Thị A',N'0000000000',N'Trần Duy Hưng',50,GETDATE(),null)
insert into DonHang values (N'Lò Thị B',N'0000000001',N'Trần Duy Hưng',50,GETDATE(),null)
insert into DonHang values (N'Lò Thị C',N'0000000002',N'Trần Duy Hưng',50,GETDATE(),N'ahihi!')
go

insert into DonHangChiTiet values (N'1',N'SP11',50,1)
insert into DonHangChiTiet values (N'2',N'SP05',50,1)
insert into DonHangChiTiet values (N'3',N'SP09',50,1)
insert into DonHangChiTiet values ((select IDENT_CURRENT ('DonHang')),N'SP09',50,1)
go


