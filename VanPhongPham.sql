create database VanPhongPham
GO
use VanPhongPham
GO
CREATE TABLE THUONGHIEU
(
	MaTH INT IDENTITY(1,1),
	TenTH NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_TH PRIMARY KEY(MaTH)
)
GO
CREATE TABLE NHACUNGCAP
(
	MaNCC INT IDENTITY(1,1),
	TenNCC NVARCHAR(100) NOT NULL,
	DiaChi NVARCHAR(150),
	DienThoai NVARCHAR(15),
	CONSTRAINT PK_NCC PRIMARY KEY(MaNCC)
)
GO
CREATE TABLE SANPHAM
(
	MaSP INT IDENTITY(1,1),
	TenSP NVARCHAR(100) NOT NULL,
	GiaBan MONEY CHECK (GiaBan>=0),
	MoTa NTEXT,
	AnhBia VARCHAR(50),
	NgayCapNhat SMALLDATETIME,
	SoLuongBan INT CHECK(SoLuongBan>0),
	MaTH INT,
	MaNCC INT,
	CONSTRAINT PK_M PRIMARY KEY(MaSP)
)
GO

CREATE TABLE KHACHHANG
(
	MaKH INT IDENTITY(1,1),
	HoTen NVARCHAR(50) NOT NULL,
	TaiKhoan VARCHAR(15) UNIQUE,
	MatKhau VARCHAR(15) NOT NULL,
	Email VARCHAR(50) UNIQUE,
	DiaChi NVARCHAR(50),
	DienThoai VARCHAR(10),
	NgaySinh SMALLDATETIME,
	CONSTRAINT PK_Kh PRIMARY KEY(MaKH)
)
GO

CREATE TABLE DONDATHANG
(
	MaDonHang INT IDENTITY(1,1),
	DaThanhToan BIT DEFAULT(0),
	TinhTrangGiaoHang INT DEFAULT(1),
	NgayDat SMALLDATETIME,
	NgayGiao SMALLDATETIME,
	MaKH INT,
	CONSTRAINT PK_DDH PRIMARY KEY(MaDonHang)
)
GO

CREATE TABLE CHITIETDATHANG
(
	MaDonHang INT,
	MaSP INT,
	SoLuong INT CHECK(SoLuong>0),
	DonGia DECIMAL(9,2) CHECK(DonGia>=0),
	CONSTRAINT PK_CTDH PRIMARY KEY(MaDonHang,MaSP)
)
GO

CREATE TABLE ADMIN
(
	MaAdmin INT IDENTITY(1,1),
	HoTen NVARCHAR(50),
	DiaChi NVARCHAR(50),
	DienThoai VARCHAR(10),
	TenDN VARCHAR(15),
	MatKhau VARCHAR(15),
	NgaySinh SMALLDATETIME,
	Email VARCHAR(50),
	Quyen Int Default 1,
	CONSTRAINT PK_AM PRIMARY KEY(MaAdmin)
)
GO

ALTER TABLE SANPHAM ADD CONSTRAINT FK_SANPHAM_TH FOREIGN KEY (MaTH) REFERENCES THUONGHIEU(MaTH)
ALTER TABLE SANPHAM ADD CONSTRAINT FK_SANPHAM_NCC FOREIGN KEY (MaNCC) REFERENCES NHACUNGCAP(MaNCC)
ALTER TABLE DONDATHANG ADD CONSTRAINT FK_DDH_KH FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH)
ALTER TABLE CHITIETDATHANG ADD CONSTRAINT FK_CTDH_DDH FOREIGN KEY (MaDonHang) REFERENCES DONDATHANG(MaDonHang)
ALTER TABLE CHITIETDATHANG ADD CONSTRAINT FK_CTDH_S FOREIGN KEY (MaSP) REFERENCES SANPHAM(MaSP)
GO

SET IDENTITY_INSERT [dbo].[THUONGHIEU] ON
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES (1, N'OEM')
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES (2, N'Deli')
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES (3, N'Thiên Long')
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES (4, N'Pentel')
INSERT [dbo].[THUONGHIEU] ([MaTH], [TenTH]) VALUES (5, N'KLONG')
SET IDENTITY_INSERT [dbo].[THUONGHIEU] OFF

SET IDENTITY_INSERT [dbo].[NHACUNGCAP] ON
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (1, N'Nhà sách Fahasa', N'60-62 Lê Lợi, Q.1, TP. HCM', N'1900636467')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (2, N'PHƯƠNG NAM VPP', N'Số 22/15 A -Kp Đông Chiêu - P. Tân Đông Hiệp - Dĩ An - Bình Dương', N'0906348979')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (3, N'EVI STORE', N'52 Út Tịch, phường 4, quận Tân Bình, thành phố Hồ Chí Minh', N'1900-6035')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (4, N'Deli Official Store', N'Tp.HCM', N'024 73081221')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (5, N'Văn Phòng Phẩm NBK', N'Tp.HCM', N'0909252550')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (6, N'MPPshop', N'Tp.HCM', N'02835230790')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (7, N'Hoàng Gia Store', N'43/2K Phan Văn Đối, Tiền Lân 1, Hóc Môn, Thành phố Hồ Chí Minh', N'0585939888')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (8, N'LAMY', N'Nguyễn Huệ, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh', N'0933375883')
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] OFF

SET IDENTITY_INSERT [dbo].[SANPHAM] ON
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (1, N'Sổ Nhật Ký', 63000, 
N'Bề mặt giấy mịn, không lóa, bám mực tốt Ruột sổ được thiết kế rất khoa học xinh xắn Kích thước: 135x182mm, 228 trang in màu Bìa cứng chắc chắn, bền đẹp, giữ cho form sổ luôn ngay ngắn Chất lượng giấy cao cấp, dày dặn, sổ có thiết kế thông minh: kế hoạch ngày, tháng, năm
THÔNG SỐ CHI TIẾT SẢN PHẨM
- Kích thước: 135x182mm, 228 trang in màu
- Kích thước sổ được nghiên cứu rất kỹ, vừa vặn để ghi chép vừa tiện dụng để mang theo mọi lúc mọi nơi. Bìa cứng chắc chắn, bền đẹp, giữ cho form sổ luôn ngay ngắn.
- Sổ kế hoạch theo đuổi phong cách thiết kế tối giản, ít hoạ tiết rườm rà để tâm trí tập trung vào những việc quan trọng, sổ ưu tiên tối đa diện tích cho người dùng ghi chú và lập kế hoạch tháng – tuần – ngày. Thiết kế sổ bao gồm 228 trang in màu, cụ thể gồm:
+ Kế hoạch hàng năm
+ Kế hoạch hàng tháng
+ Kế hoạch hàng tuần
+ Kế hoạch hàng ngày
+ Kế hoạch 21 ngày để thay đổi thói quen
+ Freenotes
- Chất lượng giấy cao cấp, dày dặn, bảo vệ môi trường, thiết kế thông minh và ăn mực hầu hết các loại bút,
- Các hình vẽ, hoạ tiết trong sổ đều có dụng ý để bạn có thể tô màu, vẽ thêm hoặc dán sticker khiến sổ trở nên khác biệt theo phong cách của từng người dùng.
- Lịch trong sổ không ghi ngày cố định, bạn có thể xài bất kỳ lúc nào.'
, N'SoNK_OEM.jpg', 1, 1, '07/01/2021', 20)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (2, N'20 Bút Bi Nước Văn Phòng BB011', 35000, 
N'Thiết kế ngòi bút 0,5mm Thân bút vừa vặn Mực ra đều và liên tục Mua combo 20 chiếc siêu tiết kiệm
Bút Bi Nước Văn Phòng : 3 Màu Xanh - Đỏ - Đen - Thiết kế ngòi bút 0,5mm - Thân bút vừa vặn - Mực ra đều và liên tục - Mua combo 20 chiếc siêu tiết kiệm. 
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, .....'
, N'ButBi_OEM.jpg', 1, 3, '07/01/2021', 20)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (3, N'Bộ Thẻ Học Thông Minh Glenn Doman', 180000, 
N'Dạy Trẻ Thế Giới Xung Quanh cung cấp một chương trình về thông tin kích thích thị giác được thiết kế nhằm giúp con bạn khai thác tiềm năng tự nhiên để học bất kỳ thứ gì. Bạn sẽ thấy thật dễ dàng và vui thú ra sao khi dạy cho con bạn biết về nghệ thuật, khoa học tự nhiên. Con bạn sẽ nhận biết được sâu bọ trong vườn, biết về các quốc gia trên thế giới, khám phá được vẻ đẹp của các bức tranh của Van Gogh và nhiều thứ khác.
Hãy giúp trẻ phát triển một cách đầy đủ hơn khả năng của trẻ. Hãy cho con đứng trên đôi vai của chính bạn, hãy cho trẻ xuất phát điểm từ những hiểu biết của bạn, hãy trao cho con khả năng học hỏi ngay từ khi con được sinh ra. Chúc bạn sẽ thành công với phương pháp của Glenn Doman – phương pháp đã được hầu như tất cả các bà mẹ Mỹ đã thực hành.
Chương trình thế giới xung quanh 100 thẻ có 10 chủ đề, mỗi chủ đề 10 thẻ:
-Chủ đề HOA
-Chủ đề QUẢ
-Chủ đề ĐỘNG VẬT QUEN THUỘC
-Chủ đề ĐỘNG VẬT HOANG DÃ
-Chủ đề CÔN TRÙNG
-Chủ đề PHƯƠNG TIỆN GIAO THÔNG
-Chủ đề HÌNH KHỐI
-Chủ đề MÀU SẮC
-Chủ đề RAU CỦ
-Chủ đề CỜ
Kích thước thẻ to chuẩn theo phương pháp Glen Doman: kích thước A5 – 14.8cm x 21cm.
Thẻ có 2 mặt: 1 mặt in hình ảnh sắc nét; 1 mặt là thông tin về thẻ song ngữ Việt – Anh.
Thẻ có hướng dẫn đi kèm.'
, N'TheHoc_OEM.jpg', 1, 1, '07/1/2021', 10)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (4, N'Màu Nước Dạng Tuýp 5Ml Deli', 48000, 
N'Màu nước dạng tuýp 5ml Deli
TÍNH NĂNG SẢN PHẨM:
-Màu nước dạng tuýp 5ml nhỏ gọn, đầy đủ phụ kiện đi kèm như khay và cọ. Phù hợp với các bạn mới bắt đầu tập vẽ cho đến vẽ chuyên nghiệp.
-Hộp màu gọn nhẹ, phù hợp cho việc vẽ phong cảnh, dã ngoại
-Nguyên liệu chất lượng cao, được kiểm tra và chứng nhận
-Thành phần từ bột khoáng nhẹ và nhịn
-Màu sắc tươi sáng, độ che phủ tốt
-Sản phẩm dạng tuýp nhôm kín
THÔNG TIN SẢN PHẨM:
Tên sản phẩm: Màu nước dạng tuýp 5ml Deli
Mã sản phẩm: 73859 / 73860 / 73861
Phân loại màu sắc: 12 màu/18 màu/24 màu'
, N'MauNuoc_Deli.jpg', 2, 4, '07/02/2021', 5)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (5, N'Bút Chì Phác Thảo Cao Cấp Deli Nuevo S999', 3000, 
N'Dòng sản phẩm Bút chì cao cấp Deli Nuevo bao gồm 16 độ đậm/ nhạt khác nhau: B, 2B, 3B, 4B, 5B, 6B, 7B, 8B, 9B, 10B, 12B, 14B, H, 2H, 3H, HB mang lại sự tiện lợi khi sử dụng
TÍNH NĂNG SẢN PHẨM:
-Ruột chì mềm, nét đậm tùy thuộc vào các độ.
-Thân gỗ mềm dễ chuốt, có thể sử dụng dao chuốt, gọt chì
-Bền đẹp không gãy chì
-Bút dùng để viết, vẽ phác thảo trên giấy tập học sinh, sổ tay, gỗ hoặc giấy vẽ chuyên dụng, phục vụ nhiều mục đích khác nhau về mỹ thuật và học tập.
-Lướt rất nhẹ nhàng trên bề mặt giấy.
-Dùng để đánh bóng các bức vẽ, đạt đến nhiều mức độ sáng tối khác nhau tùy theo kỹ thuật.
Bảo quản:
-Tránh va đập mạnh làm gãy chì.
-Tránh xa nguồn nhiệt.
THÔNG TIN SẢN PHẨM:
-Tên sản phẩm: Bút chì cao cấp Deli Nuevo
-Mã sản phẩm: S999
-Quy cách: 1 chiếc
-Độ cứng: B/ 2B/ 3B/ 4B/ 5B/ 6B/ 7B/ 8B/ 9B/ 10B/ 12B/ 14B/ H/ 2H/ 3H/ HB'
, N'ButChi_Deli.jpg', 2, 4, '07/02/2021', 50)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (6, N'Bút màu marker chuyên nghiệp Deli', 139000,  
N'TÍNH NĂNG SẢN PHẨM:
-Bút màu marker Deli được chia thành cấp độ nghiệp dư và cấp độ chuyên nghiệp. Cấp độ chuyên nghiệp sử dụng đầu sợi có mật độ cao và khối lượng không gian mạnh. Nó chủ yếu được sử dụng để vẽ tay chuyên nghiệp.
-Màu sắc phân lớp có độ trung thực cao và quà trình chuyển đổi tự nhiên làm cho mọi phần của tác phẩm trở nên cân đối
-Bút marker Deli có màu sắc tươi sáng và đáp ứng nhu cầu nghệ thuật chuyên nghiệp. Các nhà thiết kế có thể thể hiện kỹ năng và thể hiện sự sáng tạo chuyên nghiệp trong hoạt hình, kiến trúc, quần áo,
-Mực đầu sợi bút có mật độ cao, lưu trữ mực đều, không dễ trổ lông.
-Đầu bút được làm từ chất liệu sợi mật độ cao, lưu mực đều, mực chảy đều từ ngòi, mượt mà, nét vẽ mềm mại, không dễ bị xổ lông khi sử dụng thường xuyên.
-Thiết kế hai đầu dày và mỏng, tập trung vào biểu hiện sáng tạo trong thiết kế
-Có thể vẽ hai loại bút có độ dày khác nhau theo ý muốn, đáp ứng các góc vẽ khác nhau:
- Đầu tròn nhọn
- Đầu vuông
-Ngòi nét của bút marker đầu vuông thường được sử dụng để đánh bóng một khu vực rộng lớn
-Ngòi nét của bút marker tròn nhỏ được nâng lên một chút ở đỉnh bên để làm cho đường kẻ mỏng hơn
THÔNG TIN SẢN PHẨM
-Tên sản phẩm: Bút màu marker chuyên nghiệp Deli
-Mã phân loại sản phẩm: 70806-30, 70806-40 70806-60, 70806-80
-Quy cách đóng gói: Túi vải Oxford
-Sản phẩm phối màu: 30 màu, 40 màu, 60 màu, 80 màu
-Phụ kiện đi kèm: bảng thử màu.'
, N'ButMau_Deli.jpg', 2, 4, '07/02/2021', 5)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (7, N'Bút Bi Thiên Long TL-027', 3000, 
N'Đây là một trong những cây bút đang được học sinh sử dụng nhiều nhất tại Việt Nam. Bút có thiết kế tối giản, nhưng tinh tế và ấn tượng. Toàn bộ thân bút làm từ nhựa trong, phối hợp hoàn hảo với màu ruột bút bên trong.
Đặc điểm:
- Đầu bi: 0.5mm, sản xuất tại Thụy Sĩ.
- Bút bi dạng bấm cò.
- Nơi tì ngón tay có tiết diện hình tam giác vừa vặn với tay cầm giúp giảm trơn tuột khi viết thường xuyên.
- Độ dài viết được: 1.600-2.000m
- Mực đạt chuẩn: ASTM D-4236, ASTM F 963-91, EN71/3, TSCA.
Lợi ích:
- Đầu bi nhỏ cho nét chữ thanh mảnh.
- Cơ chế bấm nằm gọn dưới giắt bút, giúp thuận tay khi sử dụng.
- Thay ruột khi hết mực.'
, N'ButBi_TL.jpg', 3, 4, '07/03/2021', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (8, N'Hộp 20 Bút Thiên Long TL-079 Treedee', 75000, 
N'Được làm từ chất liệu mực an toàn Bút thiết kế đơn giản, tiện lợi khi sử dụng Màu mực tươi sáng, mau khô, không đóng cặn Đầu bi nhỏ cho nét chữ thanh mảnh
-Hộp 20 Bút Thiên Long TL-079 Treedee - Xanh với kích thước đầu bi chỉ 0.5mm, cho bạn nét chữ thanh mảnh, sắc nét trên từng trang giấy. Ngoài ra, đầu bi nhỏ còn giúp cho bút không hao mực, bạn có thể thoải mái ghi chép, viết lách.
-Bút được thiết kế theo dạng bấm, giúp thuận tay khi sử dụng. Kẹp cài bút chắc chắn giúp bạn có thể cài vào tài liệu hay túi áo một cách tiện lợi.
-Mực bút được làm tự nguyên liệu an toàn, thân thiện với môi trường. Nét mực ra êm, nhanh khô, bền màu, không làm ướt, rách bề mặt giấy khi viết, mang đến sự tiện lợi và thoải mái tối đa khi sử dụng.
-Bút bi là dụng cụ văn phòng phẩm không thể thiếu của học sinh sinh viên và nhân viên văn phòng.'
, N'Hop20But_TL.jpg', 3, 5, '07/03/2021', 20)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (9, N'Hộp 10 Bút Lông Bảng Thiên Long WB03', 74000, 
N'Kiểu dáng nhỏ, thon gọn phù hợp cho các em học sinh cấp 1, 2 Đầu bút ngoại nhập chất lượng cao, nét viết êm Màu mực tươi sáng, mau khô và dễ dàng lau sạch mực sau khi viết Luôn đặt bút nằm ngang và đậy nắp sau khi sử dụng Có thể bơm thêm mực tái sử dụng nhiều lần
-Hộp 10 Bút Lông Bảng Thiên Long WB03 - Xanh có nét viết êm, rõ ràng, không nhòe mờ, kích thước ngòi bút 2.5mm. Bút có đầu dạ, ngòi mềm, mau khô và dễ dàng lau sạch mực sau khi viết.
-Thân bút lớn, kiểu dáng trụ tròn, dễ cầm nắm, không gây trơn trượt hay mỏi khi viết.
-Màu mực tươi sáng với công nghệ tiên tiến mới giúp bạn dễ dàng xóa sạch bảng, mực chất lượng, không độc hại.
-Sản phẩm được sử dụng rộng rãi tại các cơ quan, văn phòng, trường học.'
, N'ButLong_TL.jpg', 3, 4, '07/04/2021', 5)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (10, N'Bút Xóa Thiên Long CP-02', 19000, 
N'Mực bút ra đều, mau khô và an toàn cho người sử dụng Thiết kế dạng dẹp, đầu bút bằng kim loại Công cụ hỗ trợ cần thiết trong học tập và làm việc
-Bút Xóa Thiên Long CP-02 được thiết kế dạng dẹp, đầu bút bằng kim loại. Bút có lò xo đàn hồi tốt giúp mực ra đều. Mực bút nhanh khô, không độc hại, an toàn cho người sử dụng.
-Đầu kim được bảo vệ bởi nắp đậy chắc chắn. Những ưu điểm về thiết kế cho phép người dụng mở nắp nhẹ nhàng chỉ bằng một lực đẩy nhẹ.
-Mực xóa được làm từ chất liệu chất lượng, màu trắng đục, độ che phủ tốt, xóa nhanh khô, không để lại dấu khi photo hay fax.
-Xóa nhanh khô, độ che phủ tốt, đây chính là công cụ hỗ trợ cần thiết trong quá trình học tập và làm việc của bạn.'
, N'ButXoa_TL.jpg', 3, 8, '07/04/2021', 30)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (11, N'Màu Nước Thiên Long WACO 03', 52000, 
N'Màu Nước Thiên Long WACO 03 (8 Màu) cho độ sánh và độ phủ màu tốt, có thể sử dụng trực tiếp hoặc pha loãng tuỳ vào mức độ đậm nhạt khác nhau. Màu cho độ bám tốt và sắc màu chân thực khi lên giấy, không bị bệt hay gợn màu. Sản phẩm gồm 8 màu cơ bản có độ chuẩn màu cao nhất và tuyệt đối an toàn cho sức khoẻ người sử dụng.
Thông tin sản phẩm
Chất lượng màu cao cấp
- Màu Nước Thiên Long WACO 03 (8 Màu) rất đa dạng về màu sắc nhưng vẫn cho độ chuẩn màu cao. Tông màu tươi sáng, chân thật, phù hợp cho mọi độ tuổi sử dụng.
- Màu vẽ có độ sánh và mịn vừa đủ, độ phủ tốt, cho sắc màu sắc nét và rất đều màu. Màu có độ bám dính cực tốt và không thấm ra mặt sau của giấy, không hề lem chảy. Chú ý nên đảo đều màu trước khi sử dụng.
- Khi bạn chồng màu và pha trộn màu tuỳ theo ý muốn của mình, sản phẩm vẫn cho ra màu có bộ bóng, tươi sáng và có độ chuẩn màu cao.
- Màu khô nhanh trong không khí và rất bền màu, lâu phai theo thời gian, do đó những tác phẩm nghệ thuật của bạn có thể lưu giữ lâu dài.
Sản phẩm an toàn
- Màu Nước Thiên Long WACO 03 (8 Màu) không chứa hóa chất độc hại, chất lượng đạt tiêu chuẩn quốc tế về độ bền và an toàn cho sức khỏe người dùng.
- Màu không gây mùi khó chịu khi mở nắp và dễ dàng mất đi ngay sau khi vẽ, nên đảm bảo không gây ảnh hưởng đến không khí trong phòng.
Tính tiện lợi cao
- Màu được đóng trong lọ có nắp đậy chắc chắn, đảm bảo không làm đổ màu ra ngoài, rất dễ bảo quản và tiện lợi khi mang theo.
- Màu Nước Thiên Long WACO 03 (8 Màu) mang đến cho bạn 8 màu sắc khác nhau, màu nào cũng rực rỡ tươi sáng, để bạn có thể thoả sức sáng tạo nên những tác phẩm nghệ thuật của mình.
- Khi lem ra tay, màu vẽ có thể dễ dàng rửa sạch bằng nước và giặt sạch bằng xà phòng khi bị dính vào quần áo. Khi được bảo quản đúng cách, màu vẫn cho sắc màu tươi sáng và giữ nguyên chất lượng ban đầu dù để trong thời gian lâu dài.
Thương hiệu uy tín
Sản phẩm mang thương Thiên Long, hiện nay, đây chính là một trong những thương hiệu hàng đầu của Việt Nam trong lĩnh vực sản xuất bút bi và các loại văn phòng phẩm khác. Để mang đến cho người tiêu dùng những sản phẩm có chất lượng tốt nhất, tất cả những sản phẩm của Thiên Long đều phải trải qua quá trình nghiên cứu, thi công kỹ thuật, thử nghiệm, kiểm định nghiêm ngặt và kĩ càng.'
, N'MauNuoc_TL.jpg', 3, 7, '07/04/2021', 15)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (12, N'Xấp 40 Nhãn Vở Thiên Long TP-NBl03', 12000, 
N'Thiết kế đơn giản, đẹp mắt Nhãn dán loại đề can, tiện lợi và dễ dàng sử dụng Giúp học sinh phân loại sách vở khoa học
- Xấp 40 Nhãn Vở Thiên Long TP-NBl03 dùng để ghi họ tên đính ở tập sách vở giúp các em phân biệt được các môn học khác nhau, tạo hứng thú khi mở sách vở ra học bài.
- Thiết kế đơn giản, màu sắc đẹp mắt là sự lựa chọn của nhiều em học sinh và các bậc phụ huynh. Chất liệu giấy làm nhãn vở là loại giấy bóng nổi bật trên bìa và luôn là điểm nhấn của một cuốn vở của học sinh.
- Nhãn vở dạng đề can tiện dụng, bạn chỉ cần bóc phần giấy đằng sau và dán vào sách vở là có thể sử dụng được.
- Nhãn vở tập cho học sinh tính cẩn thận, gọn gàng hơn trong việc sắp xếp sách vở và đồ dùng học tập của mình.'
, N'NhanVo_TL.jpg', 3, 1, '07/04/2021', 20)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (13, N'Bìa hồ sơ 20 lá Thiên Long Flexoffice FO-DB011', 27000, 
N'Thông Số Kỹ Thuật:
- Thương hiệu: Flexoffice
- Trọng lượng: Đang cập nhật
- Lưu trữ: 100 tờ A4 (80gsm)
- Kích thước: 310 x 240 x10 mm
- Chất liệu: Nhựa PP (Không sử dụng vật liệu PVC)
- Độ dày cover: 0.5 mm
- Quy cách: 10 bìa + 01 nhãn/ 01 túi PP, 10 túi/ 01 thùng carton.
- Chứng nhận an toàn: TCCS 077:2013/TL-BNL.
- Bảo quản: Tránh xa nguồn nhiệt từ 10độC đến 40độC, hóa chất và dung môi.
- Khuyến cáo: Không thích hợp cho trẻ em dưới 3 tuổi.
Đặc điểm :
- Bìa 20 lá thích hợp cho gia đình, văn phòng: lưu trữ các loại giấy tờ nhà đất, giấy bảo hiểm, hóa đơn, giấy bảo hành…
- Sản phẩm được sản xuất từ nhựa PP chất lượng cao, an toàn với người sử dụng, sản phẩm có thể được tái chế hoàn toàn.
- Bề mặt trơn láng, hạn chế trầy xước và bám bẩn.
- Các lá được hàn trên công nghệ hàn siêu âm, có khả năng chịu ứng suất kéo cao.'
, N'BiaHoSo_TL.jpg', 3, 6, '07/04/2021', 20)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (14, N'Vỉ 5 Bút Dạ Quang Thiên Long HL03 TL', 37000, 
N'Gồm 5 màu nổi bật: vàng, hồng, cam, xanh lá, xanh dương Bút có hai đầu 0.8 - 1.1mm, đầu dẹp 4mm tiện dụng Kiểu dáng nhỏ gọn, thon dài, vừa tay, dễ sử dụng Màu mực tươi sáng, khô nhanh, phản quang cao Chất liệu polyester siêu bền, phù hợp nhiều loại giấy
-Vỉ 5 Bút Dạ Quang Thiên Long HL03 TL (5 Màu) gồm 5 bút có màu nổi bật: vàng, hồng, cam, xanh lá, xanh dương phục vụ nhu cầu sử dụng của bạn trong học tập, làm việc, cũng như trong cuộc sống. Bút sở hữu thiết kế tiện dụng với hai đầu: đầu tròn 0.8 - 1.1mm, đầu dẹp 4mm giúp bạn có thể ghi chú, đánh dấu thông tin dễ dàng. 
-Bút dạ quang có kiểu dáng nhỏ gọn, tiện dụng phần tay cầm vừa vặn giúp bạn cầm bút thoải mái chắc chắn tránh tình trạng bút trơn tuột, đau tay khi sử dụng. Đặc biệt nắp đậy chắc chắn bảo vệ ngòi bút tối ưu hơn.
-Bên cạnh đó, màu mực tươi sáng, nhanh khô. Độ phản quang cao làm nổi bật các dòng, các điểm cần lưu ý trong văn bản. 
-Đặc biệt, bút phù hợp với các loại giấy: giấy thường, giấy copy, giấy fax, không làm nhòe và tô đen nội dung khi fax hay photocopy.
-Ngoài ra, mực viết được sản xuất từ chất liệu cao cấp không gây mùi khó chịu, không độc hại, đạt tiêu chuẩn EN71/3, ASTM D-4236.'
, N'ButDQ_TL.jpg', 3, 2, '07/04/2021', 10)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (15, N'Bút lông viết chữ calligraphy Pentel Fude Touch Brush Sign Pen', 50000, 
N'Bút lông đầu cọ viết calligraphy Pentel Fude Touch Brush Sign Pen
- Model: PENTEL SES15C-A
- Nhà sản xuất: Pentel
- Xuất xứ: Nhật Bản
- Nơi sản xuất: Nhật Bản
- Màu sắc thân bút:  Màu đen (Black)
- Chất liệu thân bút: Nhựa tái chế
- Màu mực:  Màu đen (Black)
- Loại mực:  Water-Based (Mực gốc nước), Dye-Based (Mực mau khô)
- Chất liệu ngòi: Felt
- Loại ngòi: Brush (Soft Tip)
- Cỡ ngòi:  Fine Tip (Ngòi vừa)
- Nắp đậy: Có
- Chất liệu nắp đậy: Nhựa
- Màu sắc nắp đậy:  Màu đen (Black)
- Ruột bút thay thế: Không.'
, N'ButLong_P.jpg', 4, 4, '07/04/2021', 5)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (16, N'Gôm Chì Siêu Mềm Nhỏ Pentel ZEH-05', 9000, 
N'Gôm Chì Siêu Mềm Nhỏ Pentel ZEH-05 Sản phẩm là loại gôm chì cao cấp, dành cho văn phòng & học sinh, dễ dàng tẩy xóa vết chì mà không cần tốn nhiều công sức. Sử dụng thuận tiện trong học tập và trong văn phòng. Sản phẩm giúp tẩy nhanh với khối lượng cần tẩy lớn, bạn sẽ chủ động hơn trong việc dùng gôm với thời gian sử dụng lâu dài. Tẩy siêu sạch, không bị dơ (bẩn) khi sử dụng. Gôm hiệu Pentel với độ bền dẻo cao có khả năng tẩy sạch các vết chì đen mà không gây nhăn hay rách giấy. Được làm từ chất liệu Polymer cao cấp, gôm Pentel siêu mềm và siêu dẻo, không giòn gẫy hay khô cứng theo thời gian mà luôn giữ nguyên tính chất mềm mại, sẵn sàng cho bạn sử dụng.
Gôm Chì Siêu Mềm Nhỏ Pentel ZEH-05
Sản phẩm là loại gôm chì cao cấp, dành cho văn phòng & học sinh, dễ dàng tẩy xóa vết chì mà không cần tốn nhiều công sức.
Sử dụng thuận tiện trong học tập và trong văn phòng.
Sản phẩm giúp tẩy nhanh với khối lượng cần tẩy lớn, bạn sẽ chủ động hơn trong việc dùng gôm với thời gian sử dụng lâu dài.
Tẩy siêu sạch, không bị dơ (bẩn) khi sử dụng.
Gôm hiệu Pentel với độ bền dẻo cao có khả năng tẩy sạch các vết chì đen mà không gây nhăn hay rách giấy.
Được làm từ chất liệu Polymer cao cấp, gôm Pentel siêu mềm và siêu dẻo, không giòn gẫy hay khô cứng theo thời gian mà luôn giữ nguyên tính chất mềm mại, sẵn sàng cho bạn sử dụng.'
, N'DI.jpg', 4, 4, '07/04/2021', 50)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (17, N'Sáp Dầu Pentel 50 Màu', 109000, 
N'Sáp Dầu Pentel 50 Màu - PHN-50 là dòng sản phẩm màu vẽ thuộc thương hiệu Pentel uy tín. Đây là một trong những loại màu vẽ lý tưởng với 50 tone màu chuẩn, tự nhiên và tươi sáng. Được làm từ nguyên liệu cao cấp nên sáp dầu Pentel cho độ bám giấy và độ phủ màu cao, màu ra đều, mịn, chân thực và sinh động. Độ nhấn chồng màu cực tốt trở thành một trong những ưu điểm nổi trội, khiến sản phẩm trở thành loại màu vẽ dùng để sáng tạo nên những tác phẩm nghệ thuật tuyệt vời.
Thông tin sản phẩm:
-Sắc màu chuẩn, sinh động, tươi sáng
-Bút sáp dầu Pentel được làm từ nguyên liệu cao cấp, cho màu sắc chuẩn, tự nhiên, tươi sáng như thật, có độ bám giấy và độ phủ màu tốt. Khi tô vẽ lên mặt giấy, màu đều, mịn và bóng.
-Đặc biệt, độ nhấn chồng màu tốt cho khả năng phối trộn những màu sắc mới rất sinh động, trở thành một trong những ưu điểm nổi bật nhất của sản phẩm.
Bút sáp dầu tiện dụng
-Bút màu dạng sáp mang lại sự tiện dụng cho người vẽ vì không cần gọt, không cần pha màu như khi sử dụng bút chì hoặc màu nước. Ruột sáp mềm, ít gãy vụn, ít tạo màu thừa, dễ dàng rửa sạch khi dính lên tay hay quần áo.
-Bút được đựng trong hộp có chia ngăn, giúp người dùng cất bút gọn gàng sau khi sử dụng, tránh tình trạng thất lạc.
Chất liệu an toàn
-Lớp màng bọc được cố định chắc chắc xung quanh thân bút vừa giúp người vẽ giữ cho tay luôn sạch sẽ vừa tạo sự thoải mái tối đa khi cầm bút.
-Sản phẩm được thiết kế với chất liệu và màu sắc không chứa chất độc hại, đảm bảo an toàn cho sức khỏe.
Thương hiệu uy tín
-Trong gần 70 năm kể từ khi thành lập, Pentel luôn là thương hiệu Nhật Bản cực kỳ uy tín, cung cấp các công cụ văn phòng phẩm có chất lượng cao nhất trên toàn thế giới.
-Pentel là công ty sản xuất công cụ viết duy nhất nhận được giải thưởng Deming cho các sản phẩm chất lượng cao của mình.
Thông tin khác
- Sản xuất tại Thái Lan.
- Hộp: 50 cây.
- Màu sắc: 50 màu.'
, N'SapDau_P.jpg', 4, 4, '07/04/2021', 5)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (18, N'Sổ lò xo 200tr Caro Klong 297', 45000, 
N'Sổ lò xo 200tr B5 klong 297 được thiết kế lõi caro,
sổ có kích thước 175x250mm,
giấy dày 120gms, độ trắng 76% (lõi màu kem )
Sử dụng viết vẽ đều rất thích, không thấm nhòe.'
, N'SoLoXo_KL.jpg', 5, 8, '07/05/2021', 8)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (19, N'quyển Vở may dán gáy Caro B5-200 trang', 35000, 
N'- Ruột vở định lượng cao (100g/m2), độ trắng kem tự nhiên (76% ISO) được in offset caro hoặc chấm (5 x 5) mm sắc nét với độ in đậm phù hợp, không lem nhòe với tất cả các loại mực, không hại mắt khi viết và đọc, phản ánh trung thực màu khi viết vẽ;
- Bìa được thiết kế với các nền màu pastel trẻ trung, hiện đại, được cán láng và may dán gáy bền, chắc, đễ dàng lật, dở khi viết, đọc.'
, N'VoDan_KL.jpg', 5, 8, '07/05/2021', 20)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [GiaBan], [Mota], [AnhBia], [MaTH], [MaNCC], [Ngaycapnhat], [Soluongban]) VALUES (20, N'Vở kẻ ngang Alpha - 72 trang', 8000, 
N'-Định lượng: 58 g/m2
-Độ trắng: 90 - 92 %ISO
-Số trang: 72 trang
-Kích thước: (175 x 250) mm'
, N'VoAlpha_KL.jpg', 5, 8, '07/05/2021', 15)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF

SET IDENTITY_INSERT [dbo].[KHACHHANG] ON
INSERT [dbo].[KHACHHANG] ([MaKH], [Hoten], [Diachi], [Dienthoai], [TaiKhoan], [Matkhau], [Ngaysinh], [Email]) VALUES (1, N'Vương Minh Khải', N'Hòa Lợi', N'0857987379', N'minhkhai', N'123456', '11/18/2001', N'1924801040119@student.tdmu.edu.vn')
INSERT [dbo].[KHACHHANG] ([MaKH], [Hoten], [Diachi], [Dienthoai], [TaiKhoan], [Matkhau], [Ngaysinh], [Email]) VALUES (2, N'Nguyễn Xuân Phóng', N'Bình Dương', N'Chưa có', N'phong', N'123456', '01/01/2001', N'phong@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [Hoten], [Diachi], [Dienthoai], [TaiKhoan], [Matkhau], [Ngaysinh], [Email]) VALUES (3, N'Nguyễn Văn Kết', N'TP.Hồ Chí Minh', N'Chưa có', N'ket', N'123456', '01/01/2001', N'ket@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [Hoten], [Diachi], [Dienthoai], [TaiKhoan], [Matkhau], [Ngaysinh], [Email]) VALUES (4, N'Đoàn Minh Phương', N'Bình Dương', N'Chưa có', N'phuong', N'123456', '01/01/2001', N'phuong@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [Hoten], [Diachi], [Dienthoai], [TaiKhoan], [Matkhau], [Ngaysinh], [Email]) VALUES (5, N'Lê Trương Sơn', N'TP.Hồ Chí Minh', N'Chưa có', N'son', N'123456', '01/01/2001', N'son@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [Hoten], [Diachi], [Dienthoai], [TaiKhoan], [Matkhau], [Ngaysinh], [Email]) VALUES (6, N'Nguyễn Hoàng Vĩ', N'Bình Dương', N'Chưa có', N'hoangvi', N'123456', '01/01/2001', N'hoangvi@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [Hoten], [Diachi], [Dienthoai], [TaiKhoan], [Matkhau], [Ngaysinh], [Email]) VALUES (7, N'Nguyễn Anh Quân', N'Bình Dương', N'Chưa có', N'quan', N'123456', '01/01/2001', N'quan@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [Hoten], [Diachi], [Dienthoai], [TaiKhoan], [Matkhau], [Ngaysinh], [Email]) VALUES (8, N'Vũ Lê Hồng Hải', N'Bình Phước', N'Chưa có', N'Hai', N'123456', '01/01/2001', N'hai@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [Hoten], [Diachi], [Dienthoai], [TaiKhoan], [Matkhau], [Ngaysinh], [Email]) VALUES (9, N'Nguyễn Hoài Linh', N'Bình Dương', N'Chưa có', N'linh', N'123456', '01/01/2001', N'linh@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [Hoten], [Diachi], [Dienthoai], [TaiKhoan], [Matkhau], [Ngaysinh], [Email]) VALUES (10, N'Hà Quốc Trung', N'TP.Hồ Chí Minh', N'Chưa có', N'trung', N'123456', '01/01/2001', N'trung@gmail.com')
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF

SET IDENTITY_INSERT [dbo].[DONDATHANG] ON
INSERT [dbo].[DONDATHANG] ([MaDonHang], [MaKH], [TinhTrangGiaoHang], [Ngaydat], [Ngaygiao]) VALUES (1, 1, 1, '07/20/2021','07/20/2021')
INSERT [dbo].[DONDATHANG] ([MaDonHang], [MaKH], [TinhTrangGiaoHang], [Ngaydat], [Ngaygiao]) VALUES (2, 10, 1, '07/21/2021','07/21/2021')
INSERT [dbo].[DONDATHANG] ([MaDonHang], [MaKH], [TinhTrangGiaoHang], [Ngaydat], [Ngaygiao]) VALUES (3, 2, 1, '07/22/2021','07/22/2021')
INSERT [dbo].[DONDATHANG] ([MaDonHang], [MaKH], [TinhTrangGiaoHang], [Ngaydat], [Ngaygiao]) VALUES (4, 3, 1, '07/23/2021','07/23/2021')
INSERT [dbo].[DONDATHANG] ([MaDonHang], [MaKH], [TinhTrangGiaoHang], [Ngaydat], [Ngaygiao]) VALUES (5, 5, 1, '07/24/2021','07/24/2021')
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF

INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSP], [Soluong], [DonGia]) VALUES (1, 1, 1, 63000)
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSP], [Soluong], [DonGia]) VALUES (1, 7, 2, 6000)
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSP], [Soluong], [DonGia]) VALUES (2, 18, 1, 45000)
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSP], [Soluong], [DonGia]) VALUES (3, 13, 1, 27000)
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSP], [Soluong], [DonGia]) VALUES (3, 10, 2, 38000)
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSP], [Soluong], [DonGia]) VALUES (3, 7, 5, 15000)
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSP], [Soluong], [DonGia]) VALUES (4, 11, 1, 52000)
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSP], [Soluong], [DonGia]) VALUES (5, 5, 2, 6000)
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSP], [Soluong], [DonGia]) VALUES (5, 16, 1, 9000)
INSERT [dbo].[CHITIETDATHANG] ([MaDonHang], [MaSP], [Soluong], [DonGia]) VALUES (5, 8, 1, 75000)

SET IDENTITY_INSERT [dbo].[ADMIN] ON
INSERT [dbo].[ADMIN] ([MaAdmin], [HoTen], [DiaChi], [DienThoai], [TenDN], [MatKhau], [NgaySinh], [Email],[Quyen]) VALUES (1, N'VuongMinhKhai', N'Bình Dương', N'0857987379', N'minhkhai', N'123456', '11/18/2001', N'1924801040119@student.tdmu.edu.vn',1)
INSERT [dbo].[ADMIN] ([MaAdmin], [HoTen], [DiaChi], [DienThoai], [TenDN], [MatKhau], [NgaySinh], [Email],[Quyen]) VALUES (2, N'Bùi Đức Toàn', N'Bình Dương', N'0123456789', N'toanbui', N'123456', '01/01/2000', N'toan@gmail.com',2)
INSERT [dbo].[ADMIN] ([MaAdmin], [HoTen], [DiaChi], [DienThoai], [TenDN], [MatKhau], [NgaySinh], [Email],[Quyen]) VALUES (3, N'Phạm Anh Nhớ', N'Bình Dương', N'0987654321', N'anhnho', N'123456', '01/01/2001', N'anhnho@gmail.com',3)
SET IDENTITY_INSERT [dbo].[ADMIN] OFF