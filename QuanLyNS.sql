use QLNS
go

CREATE TABLE PHONG_BAN (
	MaPB		CHAR(10) PRIMARY KEY,
	TenPB		NVARCHAR(150) NOT NULL,
	DiaChi		NVARCHAR(100)
)

CREATE TABLE BO_PHAN (
	MaBP		CHAR(10) PRIMARY KEY NOT NULL,
	TenBP		NVARCHAR(150) NOT NULL,
	NgayTL		DATE,
	GhiChu		NVARCHAR(500),
	MaPB		CHAR(10) NOT NULL FOREIGN KEY REFERENCES PHONG_BAN(MaPB)
)

CREATE TABLE NHAN_VIEN (
	MaNV			CHAR(10) PRIMARY KEY NOT NULL,
	TenNV			NVARCHAR(50) NOT NULL,
	GioiTinh		NVARCHAR(20) NOT NULL,
	NgaySinh		DATE NOT NULL,
	QueQuan		NVARCHAR(100) NOT NULL,
	SDT			CHAR(10) NOT NULL,
	DiaChi			NVARCHAR(100) NOT NULL,
	CCCD			CHAR(12) NOT NULL,
	Email			NVARCHAR(50) NOT NULL,
	TrinhDo		NVARCHAR(100) NOT NULL,
	ChuyenNganh	NVARCHAR(100) NOT NULL,
	ChucVu			NVARCHAR(100) NOT NULL,
	TinhTrang		NVARCHAR(100) NOT NULL,
	NgayVaoLam	DATE NOT NULL,
	MaPB			CHAR(10) NOT NULL FOREIGN KEY REFERENCES PHONG_BAN(MaPB),
	MaBP			CHAR(10) NOT NULL FOREIGN KEY REFERENCES BO_PHAN(MaBP)
)
CREATE TABLE ACCOUNT (
	MaTK			CHAR(10) PRIMARY KEY,
	TenDangNhap	NVARCHAR(50) NOT NULL,
	TenHienThi	NVARCHAR(20) NOT NULL,
	MatKhau		NVARCHAR(50) NOT NULL,
	MaNV CHAR(10) NOT NULL REFERENCES NHAN_VIEN(MaNV)
)

CREATE TABLE CHAM_CONG (
	MaCC		CHAR(10) PRIMARY KEY NOT NULL,
	NgayCham	DATE NOT NULL,
	GioVao		TIME,
	GioRa		TIME,
	GhiChu		NVARCHAR(500),
	MaNV		CHAR(10) NOT NULL FOREIGN KEY REFERENCES NHAN_VIEN(MaNV) ON DELETE CASCADE
)

CREATE TABLE BAO_HIEM (
	MaBH			CHAR(10) PRIMARY KEY NOT NULL,
	LoaiBH			NVARCHAR(50) NOT NULL,
	MaTheBH			CHAR(15) NOT NULL,
	NgayCap			DATE NOT NULL,
	NgayHetHan		DATE NOT NULL,
	NoiCap			NVARCHAR(100) NOT NULL,
	PhiBaoHiem		FLOAT,
	MaNV			CHAR(10) NOT NULL FOREIGN KEY REFERENCES NHAN_VIEN(MaNV) ON DELETE CASCADE
)

CREATE TABLE KHEN_THUONG (
	MaThuong		CHAR(10) PRIMARY KEY NOT NULL,
	NgayThuong		DATE NOT NULL,
	LyDo			NVARCHAR(100),
	HinhThuc		NVARCHAR(100),
	TienThuong		FLOAT,
	MaNV			CHAR(10) NOT NULL FOREIGN KEY REFERENCES NHAN_VIEN(MaNV) ON DELETE CASCADE
)

CREATE TABLE KY_LUAT (
	MaKyLuat		CHAR(10) PRIMARY KEY NOT NULL,
	NgayKyLuat		DATE NOT NULL,
	LyDo			NVARCHAR(100),
	HinhThuc		NVARCHAR(100),
	TienPhat		FLOAT,
	MaNV			CHAR(10) NOT NULL FOREIGN KEY REFERENCES NHAN_VIEN(MaNV) ON DELETE CASCADE
)

CREATE TABLE HOP_DONG (
	MaHD			CHAR(10) PRIMARY KEY NOT NULL,
	LoaiHD			NVARCHAR(100) NOT NULL,
	NgayBD			DATE NOT NULL,
	NgayKT			DATE NOT NULL,
	MaNV			CHAR(10) NOT NULL FOREIGN KEY REFERENCES NHAN_VIEN(MaNV) ON DELETE CASCADE,
	MaBP			CHAR(10) NOT NULL FOREIGN KEY REFERENCES BO_PHAN(MaBP) ON DELETE CASCADE
)

CREATE TABLE THAI_SAN (
	MaThaiSan	CHAR(10) PRIMARY KEY NOT NULL,
	NgayBatDau	DATE NOT NULL,
	NgayKetThuc	DATE NOT NULL,
	TrangThai	NVARCHAR(100) NOT NULL,
	MaNV		CHAR(10) NOT NULL FOREIGN KEY REFERENCES NHAN_VIEN(MaNV) ON DELETE CASCADE
)
CREATE TABLE LUONG (
    MaLuong CHAR(10) PRIMARY KEY NOT NULL,
    LuongCB FLOAT NOT NULL,
ChucVu NVARCHAR(100) NOT NULL,
    MaNV CHAR(10) NOT NULL FOREIGN KEY REFERENCES NHAN_VIEN(MaNV) ON DELETE CASCADE,
    TenNV NVARCHAR(50) NOT NULL
);

-----------INSERT DATA-------
INSERT INTO PHONG_BAN (MaPB, TenPB, DiaChi) VALUES
('PB001', N'Hành chính - Nhân sự', N'Tầng 1 - Tòa A'),
('PB002', N'Kỹ thuật',              N'Tầng 2 - Khu kỹ thuật'),
('PB003', N'Tài chính - Kế toán',   N'Tầng 3 - Tòa B'),
('PB004', N'Kinh doanh',            N'Tầng 4 - Khu thương mại'),
('PB005', N'Marketing',             N'Tầng 5 - Khu sáng tạo');
INSERT INTO BO_PHAN (MaBP, TenBP, NgayTL, GhiChu, MaPB) VALUES
('BP001', N'Nhân sự',                 '2020-01-01', N'', 'PB001'),
('BP002', N'Pháp chế',                '2020-03-01', N'', 'PB001'),
('BP003', N'Công nghệ thông tin',     '2020-05-01', N'', 'PB002'),
('BP004', N'Kế toán',                 '2020-07-01', N'', 'PB003'),
('BP005', N'Content Marketing',       '2021-02-15', N'', 'PB005'),
('BP006', N'Kinh doanh tổng hợp',     '2021-06-01', N'', 'PB004');
INSERT INTO NHAN_VIEN
(MaNV, TenNV, GioiTinh, NgaySinh, QueQuan, SDT, DiaChi, CCCD, Email, TrinhDo, ChuyenNganh, ChucVu, TinhTrang, NgayVaoLam, MaPB, MaBP) VALUES
('NV001', N'Nguyễn Văn An',    N'Nam', '1990-05-10', N'Hà Nội',     '0912345678', N'123 Lê Duẩn',            '012345678901', 'nguyenvan.an@congty.com',   N'Đại học',  N'Quản trị',     N'Nhân viên',          N'Đang làm', '2020-08-01', 'PB001', 'BP001'),
('NV002', N'Trần Thị Bích',    N'Nữ',  '1995-03-15', N'Hải Phòng',  '0987654321', N'45 Trần Nguyên Hãn',     '098765432112', 'tranthi.bich@congty.com',   N'Cao đẳng', N'Kế toán',      N'Kế toán viên',       N'Đang làm', '2021-01-15', 'PB003', 'BP004'),
('NV003', N'Lê Minh Châu',     N'Nam', '1992-11-20', N'Đà Nẵng',    '0901111222', N'12 Nguyễn Văn Linh',     '111111111119', 'leminh.chau@congty.com',    N'Đại học',  N'CNTT',         N'Lập trình viên',     N'Đang làm', '2022-02-01', 'PB002', 'BP003'),
('NV004', N'Phạm Thu Dung',    N'Nữ',  '1998-06-02', N'Hà Nội',     '0903333444', N'89 Kim Mã',              '222222222229', 'phamthu.dung@congty.com',   N'Đại học',  N'Marketing',    N'Nhân viên',          N'Đang làm', '2023-04-10', 'PB005', 'BP005'),
('NV005', N'Hoàng Văn Đạt',    N'Nam', '1991-09-09', N'Nam Định',   '0905555666', N'2 Trần Phú',             '333333333339', 'hoangvan.dat@congty.com',   N'Thạc sĩ',  N'Tài chính',    N'Chuyên viên',        N'Đang làm', '2019-12-01', 'PB003', 'BP004'),
('NV006', N'Vũ Thị Hạnh',      N'Nữ',  '1996-12-25', N'Nghệ An',    '0907777888', N'7 Quang Trung',          '444444444449', 'vuthi.hanh@congty.com',      N'Đại học',  N'Nhân sự',      N'Chuyên viên',        N'Đang làm', '2020-03-01', 'PB001', 'BP001'),
('NV007', N'Đỗ Mạnh Hùng',     N'Nam', '1993-08-18', N'TP.HCM',     '0910000111', N'5 Lê Lai',               '555555555559', 'domanh.hung@congty.com',     N'Đại học',  N'CNTT',         N'Quản trị hệ thống',  N'Đang làm', '2021-06-01', 'PB002', 'BP003'),
('NV008', N'Bùi Lan Hương',    N'Nữ',  '1997-10-05', N'Hải Dương', '0912222333', N'10 Hai Bà Trưng',        '666666666669', 'builan.huong@congty.com',    N'Đại học',  N'Kế toán',      N'Kế toán trưởng',     N'Đang làm', '2018-05-20', 'PB003', 'BP004'),
('NV009', N'Ngô Quốc Khánh',   N'Nam', '1994-04-14', N'Bắc Ninh',  '0914444555', N'2 Trưng Trắc',           '777777777779', 'ngoquoc.khanh@congty.com',   N'Đại học',  N'Kinh doanh',   N'Nhân viên',          N'Đang làm', '2022-12-01', 'PB004', 'BP006'),
('NV010', N'Phan Mỹ Linh',     N'Nữ',  '1999-01-30', N'Hà Nam',    '0916666777', N'88 Cầu Giấy',            '888888888889', 'phanmy.linh@congty.com',     N'Cao đẳng', N'Content',      N'Chuyên viên',        N'Đang làm', '2024-01-10', 'PB005', 'BP005'),
('NV011', N'Tạ Hữu Long',      N'Nam', '1989-07-07', N'Thái Bình', '0920000001', N'1 Láng Hạ',              '999999999991', 'tahuul.long@congty.com',     N'Đại học',  N'Tài chính',    N'Chuyên viên',        N'Đang làm', '2017-09-01', 'PB003', 'BP004'),
('NV012', N'Lương Thu Mai',    N'Nữ',  '1996-02-22', N'Quảng Ninh','0920000002', N'3 Hoàng Hoa Thám',       '121212121212', 'luongthu.mai@congty.com',    N'Đại học',  N'Nhân sự',      N'Nhân viên',          N'Đang làm', '2020-10-01', 'PB001', 'BP001'),
('NV013', N'Đinh Văn Nam',     N'Nam', '1993-03-03', N'Hà Tĩnh',   '0920000003', N'4 Phan Bội Châu',        '131313131313', 'dinhvan.nam@congty.com',     N'Đại học',  N'CNTT',         N'Lập trình viên',     N'Đang làm', '2021-08-15', 'PB002', 'BP003'),
('NV014', N'Nguyễn Ánh Ngọc',  N'Nữ',  '1997-05-05', N'Ninh Bình', '0920000004', N'5 Nguyễn Trãi',          '141414141414', 'nguyenanh.ngoc@congty.com',  N'Đại học',  N'Marketing',    N'Nhân viên',          N'Đang làm', '2023-03-20', 'PB005', 'BP005'),
('NV015', N'Phùng Đức Phát',   N'Nam', '1992-02-12', N'Phú Thọ',   '0920000005', N'6 Bạch Mai',             '151515151515', 'phungduc.phat@congty.com',   N'Thạc sĩ',  N'Tài chính',    N'Chuyên viên',        N'Đang làm', '2019-11-11', 'PB003', 'BP004'),
('NV016', N'Cao Thị Quỳnh',    N'Nữ',  '1998-09-19', N'Bắc Giang', '0920000006', N'7 Nguyễn Lương Bằng',    '161616161616', 'caothi.quynh@congty.com',    N'Đại học',  N'Kinh doanh',   N'Nhân viên',          N'Đang làm', '2022-04-04', 'PB004', 'BP006'),
('NV017', N'La Công Quang',    N'Nam', '1990-10-10', N'Hòa Bình',  '0920000007', N'8 Phạm Văn Đồng',        '171717171717', 'lacong.quang@congty.com',    N'Đại học',  N'CNTT',         N'Kỹ sư hệ thống',     N'Đang làm', '2020-07-07', 'PB002', 'BP003'),
('NV018', N'Hồ Minh Sơn',      N'Nam', '1991-12-01', N'Huế',       '0920000008', N'9 Lê Quý Đôn',           '181818181818', 'hominh.son@congty.com',      N'Đại học',  N'Quản trị',     N'Nhân viên',          N'Đang làm', '2021-02-02', 'PB001', 'BP002'),
('NV019', N'Kiều Thảo Trang',  N'Nữ',  '1996-08-28', N'Quảng Trị', '0920000009', N'10 Huỳnh Thúc Kháng',    '191919191919', 'kieuthao.trang@congty.com',  N'Đại học',  N'Kế toán',      N'Nhân viên',          N'Đang làm', '2022-09-09', 'PB003', 'BP004'),
('NV020', N'Đoàn Mai Uyên',    N'Nữ',  '1999-04-18', N'Vĩnh Phúc', '0920000010', N'11 Lạch Tray',           '202020202020', 'doanmai.uyen@congty.com',    N'Cao đẳng', N'Content',      N'Nhân viên',          N'Đang làm', '2024-05-15', 'PB005', 'BP005');
INSERT INTO ACCOUNT (MaTK, TenDangNhap, TenHienThi, MatKhau, MaNV) VALUES
('TK001',  N'nguyenvan.an',    N'Nguyễn Văn An',     '123456', 'NV001'),
('TK002',  N'tranthi.bich',    N'Trần Thị Bích',     '123456', 'NV002'),
('TK003',  N'leminh.chau',     N'Lê Minh Châu',      '123456', 'NV003'),
('TK004',  N'phamthu.dung',    N'Phạm Thu Dung',     '123456', 'NV004'),
('TK005',  N'hoangvan.dat',    N'Hoàng Văn Đạt',     '123456', 'NV005'),
('TK006',  N'vuthi.hanh',      N'Vũ Thị Hạnh',       '123456', 'NV006'),
('TK007',  N'domanh.hung',     N'Đỗ Mạnh Hùng',      '123456', 'NV007'),
('TK008',  N'builan.huong',    N'Bùi Lan Hương',     '123456', 'NV008'),
('TK009',  N'ngoquoc.khanh',   N'Ngô Quốc Khánh',    '123456', 'NV009'),
('TK010',  N'phanmy.linh',     N'Phan Mỹ Linh',      '123456', 'NV010'),
('TK011',  N'tahuul.long',     N'Tạ Hữu Long',       '123456', 'NV011'),
('TK012',  N'luongthu.mai',    N'Lương Thu Mai',     '123456', 'NV012'),
('TK013',  N'dinhvan.nam',     N'Đinh Văn Nam',      '123456', 'NV013'),
('TK014',  N'nguyenanh.ngoc',  N'Nguyễn Ánh Ngọc',   '123456', 'NV014'),
('TK015',  N'phungduc.phat',   N'Phùng Đức Phát',    '123456', 'NV015'),
('TK016',  N'caothi.quynh',    N'Cao Thị Quỳnh',     '123456', 'NV016'),
('TK017',  N'lacong.quang',    N'La Công Quang',     '123456', 'NV017'),
('TK018',  N'hominh.son',      N'Hồ Minh Sơn',       '123456', 'NV018'),
('TK019',  N'kieuthao.trang',  N'Kiều Thảo Trang',   '123456', 'NV019'),
('TK020',  N'doanmai.uyen',    N'Đoàn Mai Uyên',     '123456', 'NV020');
INSERT INTO CHAM_CONG (MaCC, NgayCham, GioVao, GioRa, GhiChu, MaNV) VALUES
('CC001', '2025-08-08', '08:00', '17:00', N'Đúng giờ',     'NV001'),
('CC002', '2025-08-08', '08:05', '17:10', N'Đi trễ',   'NV002'),
('CC003', '2025-08-08', '07:55', '17:00', N'Đúng giờ',     'NV003'),
('CC004', '2025-08-08', '08:20', '17:30', N'Tăng ca',      'NV004'),
('CC005', '2025-08-08', '08:00', '16:45', N'Về sớm',       'NV005');
INSERT INTO BAO_HIEM (MaBH, LoaiBH, MaTheBH, NgayCap, NgayHetHan, NoiCap, PhiBaoHiem, MaNV) VALUES
('BH001', N'BHXH', 'BH123456789', '2023-01-01', '2025-01-01', N'Hà Nội',     1500000, 'NV001'),
('BH002', N'BHYT', 'BH987654321', '2024-01-01', '2025-12-31', N'Hải Phòng',  1000000, 'NV002'),
('BH003', N'BHTN', 'BH555555555', '2024-06-01', '2026-06-01', N'Đà Nẵng',    1200000, 'NV003'),
('BH004', N'BHYT', 'BH444444444', '2025-01-01', '2026-01-01', N'Hà Nội',      900000, 'NV004'),
('BH005', N'BHXH', 'BH333333333', '2023-09-01', '2025-09-01', N'TP.HCM',     1400000, 'NV005');
INSERT INTO KHEN_THUONG (MaThuong, NgayThuong, LyDo, HinhThuc, TienThuong, MaNV) VALUES
('KT001', '2025-01-01', N'Hoàn thành xuất sắc', N'Tiền mặt',      2000000, 'NV001'),
('KT002', '2025-03-08', N'Sáng kiến cải tiến',  N'Tiền mặt',      1500000, 'NV003'),
('KT003', '2025-05-20', N'Dẫn dắt dự án tốt',   N'Chuyển khoản',  3000000, 'NV007'),
('KT004', '2025-06-10', N'Bán hàng vượt KPI',   N'Tiền mặt',      1800000, 'NV009'),
('KT005', '2025-07-15', N'Đóng góp nội dung',   N'Voucher',        500000, 'NV020');
INSERT INTO KY_LUAT (MaKyLuat, NgayKyLuat, LyDo, HinhThuc, TienPhat, MaNV) VALUES
('KL001', '2025-04-01', N'Đi trễ nhiều lần',         N'Khiển trách bằng văn bản',  0,       'NV002'),
('KL002', '2025-02-14', N'Không tuân thủ quy trình', N'Nhắc nhở bằng văn bản',     0,       'NV016'),
('KL003', '2025-03-05', N'Vi phạm bảo mật',          N'Khấu trừ lương',            800000,  'NV013'),
('KL004', '2025-05-22', N'Nghỉ không phép',          N'Cảnh cáo',                  0,       'NV018'),
('KL005', '2025-07-01', N'Gây mất đoàn kết',         N'Khiển trách bằng văn bản',  0,       'NV011');
INSERT INTO HOP_DONG (MaHD, LoaiHD, NgayBD, NgayKT, MaNV, MaBP) VALUES
('HD001', N'Không thời hạn', '2022-01-01', '2026-01-01', 'NV001', 'BP001'),
('HD002', N'1 năm',          '2024-01-01', '2025-12-31', 'NV002', 'BP004'),
('HD003', N'3 năm',          '2023-03-01', '2026-03-01', 'NV003', 'BP003'),
('HD004', N'1 năm',          '2024-05-01', '2025-04-30', 'NV004', 'BP005'),
('HD005', N'2 năm',          '2023-10-01', '2025-09-30', 'NV005', 'BP004');
INSERT INTO THAI_SAN (MaThaiSan, NgayBatDau, NgayKetThuc, TrangThai, MaNV) VALUES
('TS001', '2025-06-01', '2025-12-01', N'Đang nghỉ', 'NV002'),
('TS002', '2025-07-15', '2026-01-15', N'Đang nghỉ', 'NV004'),
('TS003', '2025-08-01', '2026-02-01', N'Đang nghỉ', 'NV010'),
('TS004', '2025-05-10', '2025-11-10', N'Đang nghỉ', 'NV014'),
('TS005', '2025-09-01', '2026-03-01', N'Kế hoạch',  'NV019');
INSERT INTO LUONG (MaLuong, LuongCB, ChucVu, MaNV, TenNV) VALUES
('L001',  8000000,  N'Nhân viên',          'NV001', N'Nguyễn Văn An'),
('L002', 10000000,  N'Kế toán viên',       'NV002', N'Trần Thị Bích'),
('L003', 14000000,  N'Lập trình viên',     'NV003', N'Lê Minh Châu'),
('L004',  8000000,  N'Nhân viên',          'NV004', N'Phạm Thu Dung'),
('L005', 12000000,  N'Chuyên viên',        'NV005', N'Hoàng Văn Đạt'),
('L006', 12000000,  N'Chuyên viên',        'NV006', N'Vũ Thị Hạnh'),
('L007', 13000000,  N'Quản trị hệ thống',  'NV007', N'Đỗ Mạnh Hùng'),
('L008', 15000000,  N'Kế toán trưởng',     'NV008', N'Bùi Lan Hương'),
('L009',  8000000,  N'Nhân viên',          'NV009', N'Ngô Quốc Khánh'),
('L010', 12000000,  N'Chuyên viên',        'NV010', N'Phan Mỹ Linh'),
('L011', 12000000,  N'Chuyên viên',        'NV011', N'Tạ Hữu Long'),
('L012',  8000000,  N'Nhân viên',          'NV012', N'Lương Thu Mai'),
('L013', 14000000,  N'Lập trình viên',     'NV013', N'Đinh Văn Nam'),
('L014',  8000000,  N'Nhân viên',          'NV014', N'Nguyễn Ánh Ngọc'),
('L015', 12000000,  N'Chuyên viên',        'NV015', N'Phùng Đức Phát'),
('L016',  8000000,  N'Nhân viên',          'NV016', N'Cao Thị Quỳnh'),
('L017', 14500000,  N'Kỹ sư hệ thống',     'NV017', N'La Công Quang'),
('L018',  8000000,  N'Nhân viên',          'NV018', N'Hồ Minh Sơn'),
('L019',  8000000,  N'Nhân viên',          'NV019', N'Kiều Thảo Trang'),
('L020',  8000000,  N'Nhân viên',          'NV020', N'Đoàn Mai Uyên');


--------THỦ TỤC ĐĂNG NHẬP VÀO CSDL-----------
GO
CREATE PROC sp_DangNhap
	@tendangnhap NVARCHAR(50),
	@matkhau NVARCHAR(50)
AS
BEGIN
	SELECT * FROM ACCOUNT
	WHERE TenDangNhap = @tendangnhap AND MatKhau = @matkhau
END
-------THỦ TỤC THAY ĐỔI MẬT KHẨU--------------
GO
CREATE PROC sp_DoiMatKhau
	@matk CHAR(10),
	@matkhaucu NVARCHAR(50),
	@matkhaumoi NVARCHAR(50)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM ACCOUNT WHERE MaTK = @matk AND MatKhau = @matkhaucu)
	BEGIN
		UPDATE ACCOUNT
		SET MatKhau = @matkhaumoi
		WHERE MaTK = @matk
	END
END
-------THỦ TỤC KIỂM TRA CHẤM CÔNG----------
GO
CREATE PROC sp_CheckChamCong
	@manv CHAR(10),
	@ngay DATE
AS
BEGIN
	SELECT * FROM CHAM_CONG
	WHERE MaNV = @manv AND NgayCham = @ngay
END
--------THỦ TỤC KIỂM TRA BẢO HIỂM ĐÃ QUÁ HẠN----------
GO
CREATE PROC sp_KiemTraBaoHiemQuaHan
	@MaNV CHAR(10)
AS
BEGIN
	SELECT *
	FROM BAO_HIEM
	WHERE MaNV = @MaNV
	  AND (
			NgayHetHan < GETDATE()         
			OR MaTheBH IS NULL             
			OR LoaiBH IS NULL              
			OR NgayCap IS NULL
			OR NgayHetHan IS NULL
		)
END
---------THỦ TỤC KIỂM TRA HỢP ĐỒNG---------
GO
CREATE PROC sp_KiemTraHopDongHetHan
	@TuNgay DATE,
	@DenNgay DATE
AS
BEGIN
	SELECT *
	FROM HOP_DONG
	WHERE NgayKT BETWEEN @TuNgay AND @DenNgay
END
-------------RA SOAT DU LIEU-------------
-- RBTV1: TinhTrang chỉ trong tập cho phép
SELECT * FROM dbo.NHAN_VIEN 
WHERE TinhTrang NOT IN (N'Đang làm', N'Nghỉ việc', N'Nghỉ thai sản') OR TinhTrang IS NULL;
-- RBTV2: GioiTinh
SELECT * FROM dbo.NHAN_VIEN 
WHERE GioiTinh NOT IN (N'Nam', N'Nữ') OR GioiTinh IS NULL;

-- RBTV3: HĐ: NgayKT >= NgayBD
SELECT * FROM dbo.HOP_DONG WHERE NgayKT < NgayBD;

-- RBTV4: NgayBD HĐ >= NgayVaoLam NV
SELECT hd.* 
FROM dbo.HOP_DONG hd 
JOIN dbo.NHAN_VIEN nv ON nv.MaNV = hd.MaNV
WHERE hd.NgayBD < nv.NgayVaoLam;
-- RBTV5: CCCD đúng 12 số
SELECT * FROM dbo.NHAN_VIEN 
WHERE LEN(CCCD) <> 12 OR CCCD LIKE '%[^0-9]%';

-- RBTV6: BH: NgayHetHan > NgayCap
SELECT * FROM dbo.BAO_HIEM WHERE NgayHetHan <= NgayCap;
-- RBTV7: Mỗi nhân viên chỉ có tối đa 1 bảo hiểm đang hiệu lực tại một thời điểm
SELECT b1.MaNV, b1.MaBH AS MaBH1, b2.MaBH AS MaBH2, b1.NgayCap, b1.NgayHetHan, b2.NgayCap, b2.NgayHetHan
FROM dbo.BAO_HIEM b1
JOIN dbo.BAO_HIEM b2 ON b1.MaNV = b2.MaNV AND b1.MaBH < b2.MaBH
WHERE NOT (b1.NgayHetHan < b2.NgayCap OR b2.NgayHetHan < b1.NgayCap);

-- RBTV8: SDT 10 số, bắt đầu 0
SELECT * FROM dbo.NHAN_VIEN 
WHERE LEN(SDT) <> 10 OR SDT LIKE '%[^0-9]%' OR LEFT(SDT,1) <> '0';


-- RBTV9: Trùng chấm công theo (MaNV, NgayCham)
SELECT MaNV, NgayCham, COUNT(*) AS SoLuong
FROM dbo.CHAM_CONG
GROUP BY MaNV, NgayCham
HAVING COUNT(*) > 1;

-- RBTV10: ACCOUNT - username duy nhất; mỗi NV tối đa 1 TK
SELECT TenDangNhap, COUNT(*) AS SoLuong
FROM dbo.ACCOUNT GROUP BY TenDangNhap HAVING COUNT(*) > 1;

SELECT MaNV, COUNT(*) AS SoTK
FROM dbo.ACCOUNT GROUP BY MaNV HAVING COUNT(*) > 1;
------------TRIEN KHAI RANG BUOC TOAN VEN--------------
----- RBTV1: TinhTrang nhân viên chỉ trong tập cho phép ( RBTV Miền giá trị)-----
IF EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = 'CK_NHAN_VIEN_TinhTrang_InSet')
    ALTER TABLE dbo.NHAN_VIEN DROP CONSTRAINT CK_NHAN_VIEN_TinhTrang_InSet;
ALTER TABLE dbo.NHAN_VIEN WITH CHECK
ADD CONSTRAINT CK_NHAN_VIEN_TinhTrang_InSet
CHECK (TinhTrang IN (N'Đang làm', N'Nghỉ việc', N'Nghỉ thai sản'));
----RBTV2: GioiTinh nhân viên chỉ trong tập cho phép ( RBTV Miền giá trị)----
IF EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = 'CK_NHAN_VIEN_GioiTinh_InSet')
    ALTER TABLE dbo.NHAN_VIEN DROP CONSTRAINT CK_NHAN_VIEN_GioiTinh_InSet;
ALTER TABLE dbo.NHAN_VIEN WITH CHECK
ADD CONSTRAINT CK_NHAN_VIEN_GioiTinh_InSet
CHECK (GioiTinh IN (N'Nam', N'Nữ'));
----RBTV3: Ngày kết thúc HĐ >= Ngày bắt đầu (RBTV Liên thuộc tính)---
IF EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = 'CK_HOP_DONG_NgayKT_Ge_NgayBD')
    ALTER TABLE dbo.HOP_DONG DROP CONSTRAINT CK_HOP_DONG_NgayKT_Ge_NgayBD;
ALTER TABLE dbo.HOP_DONG WITH CHECK
ADD CONSTRAINT CK_HOP_DONG_NgayKT_Ge_NgayBD
CHECK (NgayKT >= NgayBD);
---RBTV4: Ngày bắt đầu HĐ >= Ngày vào làm nhân viên ( RBTV Liên thuộc tính – liên quan hệ)
IF OBJECT_ID('dbo.TR_HOP_DONG_Validate_NgayBD_Vs_VaoLam', 'TR') IS NOT NULL
    DROP TRIGGER dbo.TR_HOP_DONG_Validate_NgayBD_Vs_VaoLam;
GO
CREATE TRIGGER dbo.TR_HOP_DONG_Validate_NgayBD_Vs_VaoLam
ON dbo.HOP_DONG
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN dbo.NHAN_VIEN nv ON nv.MaNV = i.MaNV
        WHERE i.NgayBD < nv.NgayVaoLam
    )
    BEGIN
        RAISERROR (N'Ngày bắt đầu HĐ không được trước Ngày vào làm của nhân viên.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
END
END
GO
-----RBTV5: CCCD đủ 12 chữ số (RBTV Miền giá trị)-----
IF EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = 'CK_NHAN_VIEN_CCCD_12Digits')
    ALTER TABLE dbo.NHAN_VIEN DROP CONSTRAINT CK_NHAN_VIEN_CCCD_12Digits;
ALTER TABLE dbo.NHAN_VIEN WITH CHECK
ADD CONSTRAINT CK_NHAN_VIEN_CCCD_12Digits
CHECK (LEN(CCCD) = 12 AND CCCD NOT LIKE '%[^0-9]%');
----RBTV6: Ngày hết hạn BH > Ngày cấp (RBTV Liên thuộc tính)-----
IF EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = 'CK_BAO_HIEM_Expire_After_Issue')
ALTER TABLE dbo.BAO_HIEM DROP CONSTRAINT CK_BAO_HIEM_Expire_After_Issue;
ALTER TABLE dbo.BAO_HIEM WITH CHECK
ADD CONSTRAINT CK_BAO_HIEM_Expire_After_Issue
CHECK (NgayHetHan > NgayCap);
----RBTV7:
IF OBJECT_ID('dbo.TR_BAO_HIEM_NoOverlap_PerEmployee', 'TR') IS NOT NULL
    DROP TRIGGER dbo.TR_BAO_HIEM_NoOverlap_PerEmployee;
GO
CREATE TRIGGER dbo.TR_BAO_HIEM_NoOverlap_PerEmployee
ON dbo.BAO_HIEM
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    -- Hai khoảng [a1,b1] và [a2,b2] chồng khi NOT (b1 < a2 OR b2 < a1)
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN dbo.BAO_HIEM b
          ON b.MaNV = i.MaNV
         AND b.MaBH <> i.MaBH
         AND NOT (b.NgayHetHan < i.NgayCap OR i.NgayHetHan < b.NgayCap)
    )
    BEGIN
        RAISERROR (N'Nhân viên đã có bảo hiểm chồng lấn thời gian hiệu lực.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END
GO
----RBTV8:SDT 10 chữ số, bắt đầu bằng 0 ( RBTV Miền giá trị)
IF EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = 'CK_NHAN_VIEN_SDT_10Digits_Leading0')
    ALTER TABLE dbo.NHAN_VIEN DROP CONSTRAINT CK_NHAN_VIEN_SDT_10Digits_Leading0;
ALTER TABLE dbo.NHAN_VIEN WITH CHECK
ADD CONSTRAINT CK_NHAN_VIEN_SDT_10Digits_Leading0
CHECK (LEN(SDT) = 10 AND SDT NOT LIKE '%[^0-9]%' AND LEFT(SDT,1) = '0');
----RBTV9: Mỗi nhân viên 1 bản chấm công mỗi ngày (Liên bộ)----
IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'UQ_CHAM_CONG_MaNV_NgayCham')
    ALTER TABLE dbo.CHAM_CONG DROP CONSTRAINT UQ_CHAM_CONG_MaNV_NgayCham;
ALTER TABLE dbo.CHAM_CONG
ADD CONSTRAINT UQ_CHAM_CONG_MaNV_NgayCham UNIQUE (MaNV, NgayCham);
-----RBTV10: Tên đăng nhập duy nhất, mỗi NV chỉ có 1 tài khoản ( RBTV Liên bộ)
IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'UQ_ACCOUNT_TenDangNhap')
    ALTER TABLE dbo.ACCOUNT DROP CONSTRAINT UQ_ACCOUNT_TenDangNhap;
ALTER TABLE dbo.ACCOUNT
ADD CONSTRAINT UQ_ACCOUNT_TenDangNhap UNIQUE (TenDangNhap);

IF EXISTS (SELECT 1 FROM sys.key_constraints WHERE name = 'UQ_ACCOUNT_MaNV')
    ALTER TABLE dbo.ACCOUNT DROP CONSTRAINT UQ_ACCOUNT_MaNV;
ALTER TABLE dbo.ACCOUNT
ADD CONSTRAINT UQ_ACCOUNT_MaNV UNIQUE (MaNV);