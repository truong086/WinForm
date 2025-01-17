USE [quanlyhocphi11s]
GO
/****** Object:  UserDefinedFunction [dbo].[timkiemFunc]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[timkiemFunc](@tk int)
returns int
as
	begin
		return(select COUNT(*) as Tong from phieuthu inner join sinhvien on phieuthu.msv = sinhvien.msv where phieuthu.mamonhoc = @tk)
	end
GO
/****** Object:  Table [dbo].[phieuthu]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phieuthu](
	[maphieuthu] [int] IDENTITY(1,1) NOT NULL,
	[msv] [int] NULL,
	[mamonhoc] [int] NULL,
	[tenkhoanthu] [nvarchar](150) NULL,
	[namhoc] [nvarchar](20) NULL,
	[hocky] [nvarchar](20) NULL,
	[ngaythu] [date] NULL,
	[sotien] [float] NULL,
	[hinhthuc] [nvarchar](20) NULL,
	[mataikhoannganhangSV] [int] NULL,
	[mataikhoannhantienHP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maphieuthu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sinhvien]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sinhvien](
	[masvtt] [int] IDENTITY(1,1) NOT NULL,
	[msv] [int] NOT NULL,
	[madoituong] [int] NULL,
	[malop] [int] NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[msv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PhieuThuS]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[PhieuThuS]
as
select sinhvien.msv, COUNT(phieuthu.msv) as soluong from sinhvien left join phieuthu on sinhvien.msv = phieuthu.msv group by sinhvien.msv
GO
/****** Object:  View [dbo].[PhieuTHu1]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[PhieuTHu1]
as
	select phieuthu.msv ,COUNT(phieuthu.msv) as soluong from phieuthu group by phieuthu.msv
GO
/****** Object:  Table [dbo].[chuadongHocPhi]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chuadongHocPhi](
	[maphieuthu] [int] NULL,
	[msv] [int] NULL,
	[mamonhoc] [int] NULL,
	[tenkhoanthu] [nvarchar](150) NULL,
	[hoten] [nvarchar](50) NULL,
	[diachi] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chuadongHocPhiss]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chuadongHocPhiss](
	[masvtt] [int] NOT NULL,
	[msv] [int] NOT NULL,
	[madoituong] [int] NULL,
	[malop] [int] NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dacbiet]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dacbiet](
	[masvtt] [int] IDENTITY(1,1) NOT NULL,
	[msv] [int] NOT NULL,
	[madoituong] [int] NULL,
	[malop] [int] NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dadongHocPhi]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dadongHocPhi](
	[maphieuthu] [int] NOT NULL,
	[msv] [int] NULL,
	[mamonhoc] [int] NULL,
	[tenkhoanthu] [nvarchar](150) NULL,
	[namhoc] [nvarchar](20) NULL,
	[sotien] [float] NULL,
	[hoten] [nvarchar](50) NULL,
	[diachi] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doituong]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doituong](
	[madoituongtt] [int] IDENTITY(1,1) NOT NULL,
	[madoituong] [int] NOT NULL,
	[tendoituong] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[madoituong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hocphinganh]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hocphinganh](
	[msv] [int] NULL,
	[maphieuthu] [int] NOT NULL,
	[mamonhoc] [int] NULL,
	[tenkhoanthu] [nvarchar](150) NULL,
	[namhoc] [nvarchar](20) NULL,
	[hocky] [nvarchar](20) NULL,
	[ngaythu] [date] NULL,
	[sotien] [float] NULL,
	[hinhthuc] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hocphinganh126]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hocphinganh126](
	[msv] [int] NULL,
	[maphieuthu] [int] NOT NULL,
	[mamonhoc] [int] NULL,
	[tenkhoanthu] [nvarchar](150) NULL,
	[namhoc] [nvarchar](20) NULL,
	[hocky] [nvarchar](20) NULL,
	[ngaythu] [date] NULL,
	[sotien] [float] NULL,
	[hinhthuc] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khoa]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khoa](
	[makhoatt] [int] IDENTITY(1,1) NOT NULL,
	[makhoa] [int] NOT NULL,
	[tenkhoa] [nvarchar](100) NULL,
	[GVCNkhoa] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[makhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khoa14]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khoa14](
	[msv] [int] NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[madoituong] [int] NULL,
	[tenlop] [nvarchar](50) NULL,
	[khoahoc] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khoa15]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khoa15](
	[msv] [int] NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[madoituong] [int] NULL,
	[tenlop] [nvarchar](50) NULL,
	[khoahoc] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhongPhaiCNTT]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhongPhaiCNTT](
	[msv] [int] NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](20) NULL,
	[malop] [int] NOT NULL,
	[tenlop] [nvarchar](50) NULL,
	[manganh] [int] NOT NULL,
	[tennganh] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lichsu]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lichsu](
	[masvtt] [int] IDENTITY(1,1) NOT NULL,
	[msv] [int] NULL,
	[madoituong] [int] NULL,
	[malop] [int] NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](20) NULL,
	[mota] [nvarchar](250) NULL,
	[id_taikhoan] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lop]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lop](
	[maloptt] [int] IDENTITY(1,1) NOT NULL,
	[malop] [int] NOT NULL,
	[manganh] [int] NULL,
	[tenlop] [nvarchar](50) NULL,
	[GVCNlop] [nvarchar](50) NULL,
	[khoahoc] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[malop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monhoc]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monhoc](
	[mamonhoctt] [int] IDENTITY(1,1) NOT NULL,
	[mamonhoc] [int] NOT NULL,
	[tenmonhoc] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[mamonhoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nganh]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nganh](
	[manganhtt] [int] IDENTITY(1,1) NOT NULL,
	[manganh] [int] NOT NULL,
	[makhoa] [int] NULL,
	[tennganh] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[manganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nganhCNTT]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nganhCNTT](
	[msv] [int] NULL,
	[hoten] [nvarchar](50) NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](20) NULL,
	[malop] [int] NOT NULL,
	[tenlop] [nvarchar](50) NULL,
	[manganh] [int] NULL,
	[tennganh] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nganhcntt1]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nganhcntt1](
	[manganhtt] [int] IDENTITY(1,1) NOT NULL,
	[manganh] [int] NOT NULL,
	[makhoa] [int] NULL,
	[tennganh] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nganhdulich]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nganhdulich](
	[manganhtt] [int] IDENTITY(1,1) NOT NULL,
	[manganh] [int] NOT NULL,
	[makhoa] [int] NULL,
	[tennganh] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nganhluat]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nganhluat](
	[manganhtt] [int] IDENTITY(1,1) NOT NULL,
	[manganh] [int] NOT NULL,
	[makhoa] [int] NULL,
	[tennganh] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nganhQTKD]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nganhQTKD](
	[manganhtt] [int] IDENTITY(1,1) NOT NULL,
	[manganh] [int] NOT NULL,
	[makhoa] [int] NULL,
	[tennganh] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phanhoi]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phanhoi](
	[maphanhoiduynhat] [int] IDENTITY(1,1) NOT NULL,
	[tentaikhoan] [nvarchar](50) NULL,
	[email] [nvarchar](150) NULL,
	[sodienthoai] [nvarchar](20) NULL,
	[chucvu] [nvarchar](50) NULL,
	[noidung] [nvarchar](500) NULL,
	[trangthai] [nvarchar](50) NULL,
	[msv_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maphanhoiduynhat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVienDB]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVienDB](
	[masvtt] [int] IDENTITY(1,1) NOT NULL,
	[msv] [int] NOT NULL,
	[madoituong] [int] NULL,
	[malop] [int] NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVienK12]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVienK12](
	[masvtt] [int] IDENTITY(1,1) NOT NULL,
	[msv] [int] NOT NULL,
	[madoituong] [int] NULL,
	[malop] [int] NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVienK13]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVienK13](
	[masvtt] [int] IDENTITY(1,1) NOT NULL,
	[msv] [int] NOT NULL,
	[madoituong] [int] NULL,
	[malop] [int] NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVienK14]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVienK14](
	[masvtt] [int] IDENTITY(1,1) NOT NULL,
	[msv] [int] NOT NULL,
	[madoituong] [int] NULL,
	[malop] [int] NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVienK15]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVienK15](
	[masvtt] [int] IDENTITY(1,1) NOT NULL,
	[msv] [int] NOT NULL,
	[madoituong] [int] NULL,
	[malop] [int] NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVienK16]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVienK16](
	[masvtt] [int] IDENTITY(1,1) NOT NULL,
	[msv] [int] NOT NULL,
	[madoituong] [int] NULL,
	[malop] [int] NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](200) NULL,
	[gioitinh] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[taikhoan]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taikhoan](
	[mataikhoantt] [int] IDENTITY(1,1) NOT NULL,
	[tentaikhoan] [int] NOT NULL,
	[matkhau] [nvarchar](20) NULL,
	[capquyen] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tentaikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[taikhoannganhangSV]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taikhoannganhangSV](
	[manganhang] [int] IDENTITY(1,1) NOT NULL,
	[msv] [int] NULL,
	[tennganhang] [nvarchar](100) NULL,
	[chinhanh] [nvarchar](100) NULL,
	[sotaikhoan] [nvarchar](50) NULL,
	[tentaikhoan] [nvarchar](50) NULL,
	[ngaytao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[manganhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[taikhoannhantienHP]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taikhoannhantienHP](
	[mataikhoannhantien] [int] IDENTITY(1,1) NOT NULL,
	[tennganhhang] [nvarchar](100) NULL,
	[tenchinhanh] [nvarchar](100) NULL,
	[sotaikhoanNT] [nvarchar](50) NULL,
	[tentaikhoanNT] [nvarchar](50) NULL,
	[ngaytao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[mataikhoannhantien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thacmac]    Script Date: 9/19/2024 2:14:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thacmac](
	[maduynhat] [int] IDENTITY(1,1) NOT NULL,
	[msv_id] [int] NULL,
	[lop_id] [int] NULL,
	[khoahoc] [nvarchar](50) NULL,
	[email] [nvarchar](150) NULL,
	[sodienthoai] [nvarchar](20) NULL,
	[diachi] [nvarchar](200) NULL,
	[noidung] [nvarchar](500) NULL,
	[trangthai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maduynhat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[chuadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [hoten], [diachi]) VALUES (NULL, NULL, NULL, NULL, N'Nguyen Van G', N'Thanh Xuan')
INSERT [dbo].[chuadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [hoten], [diachi]) VALUES (NULL, NULL, NULL, NULL, N'Nguyen Van H', N'Tay Nguyen')
INSERT [dbo].[chuadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [hoten], [diachi]) VALUES (NULL, NULL, NULL, NULL, N'Tran van A', N'Cao Bang')
INSERT [dbo].[chuadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [hoten], [diachi]) VALUES (NULL, NULL, NULL, NULL, N'Tran van B', N'Ha Noi')
INSERT [dbo].[chuadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [hoten], [diachi]) VALUES (NULL, NULL, NULL, NULL, N'Pham Van B', N'Nam Dinh')
INSERT [dbo].[chuadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [hoten], [diachi]) VALUES (NULL, NULL, NULL, NULL, N'Pham Van C', N'Ca Mau')
INSERT [dbo].[chuadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [hoten], [diachi]) VALUES (NULL, NULL, NULL, NULL, N'Nguyen Van AB', N'Ha Noi')
INSERT [dbo].[chuadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [hoten], [diachi]) VALUES (NULL, NULL, NULL, NULL, N'Nguyen Van BC', N'Ha Nam')
INSERT [dbo].[chuadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [hoten], [diachi]) VALUES (NULL, NULL, NULL, NULL, N'Nguyen Van CD', N'Sai Gon')
GO
INSERT [dbo].[chuadongHocPhiss] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (6, 12341, 2, 6, N'Nguyen Van G', CAST(N'2002-09-01' AS Date), N'Thanh Xuan', N'Nam')
INSERT [dbo].[chuadongHocPhiss] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (7, 12342, 2, 7, N'Nguyen Van H', CAST(N'2002-09-01' AS Date), N'Tay Nguyen', N'Nam')
INSERT [dbo].[chuadongHocPhiss] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (8, 12343, 2, 8, N'Tran van A', CAST(N'2002-10-11' AS Date), N'Cao Bang', N'Nam')
INSERT [dbo].[chuadongHocPhiss] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (9, 12344, 2, 9, N'Tran van B', CAST(N'2002-11-12' AS Date), N'Ha Noi', N'Nam')
INSERT [dbo].[chuadongHocPhiss] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (13, 123413, 2, 1, N'Pham Van B', CAST(N'2002-01-03' AS Date), N'Nam Dinh', N'Nam')
INSERT [dbo].[chuadongHocPhiss] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (14, 123414, 2, 2, N'Pham Van C', CAST(N'2002-02-20' AS Date), N'Ca Mau', N'Nam')
INSERT [dbo].[chuadongHocPhiss] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (16, 123416, 1, 1, N'Nguyen Van AB', CAST(N'2002-09-02' AS Date), N'Ha Noi', N'Nam')
INSERT [dbo].[chuadongHocPhiss] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (17, 123417, 1, 2, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Ha Nam', N'Nam')
INSERT [dbo].[chuadongHocPhiss] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (18, 123418, 1, 3, N'Nguyen Van CD', CAST(N'2002-11-06' AS Date), N'Sai Gon', N'Nam')
GO
SET IDENTITY_INSERT [dbo].[dacbiet] ON 

INSERT [dbo].[dacbiet] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (16, 123416, 1, 1, N'Nguyen Van AB', CAST(N'2002-09-02' AS Date), N'Ha Noi', N'Nam')
INSERT [dbo].[dacbiet] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (24, 123417, 1, 2, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Ha Nam', N'Nam')
INSERT [dbo].[dacbiet] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (22, 123418, 1, 15, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Ha Namss', N'Nam')
INSERT [dbo].[dacbiet] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (80, 123435, 1, 5, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[dacbiet] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (25, 123420, 1, 15, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Ha Namss', N'Nam')
INSERT [dbo].[dacbiet] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (59, 123490, 1, 2, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Ha Namss', N'Nam')
INSERT [dbo].[dacbiet] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (75, 123430, 1, 1, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[dacbiet] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (81, 1234101, 1, 5, N'Nguyen Van BC', CAST(N'2002-10-10' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[dacbiet] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (86, 1234102, 1, 5, N'Nguyen Van BC', CAST(N'2002-10-10' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[dacbiet] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (87, 1234105, 1, 4, N'Nguyen Van BC', CAST(N'2002-10-10' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[dacbiet] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (54, 1234100, 1, 2, N'Nguyen Van B', CAST(N'2002-10-02' AS Date), N'Ha Noi', N'Nam')
INSERT [dbo].[dacbiet] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (77, 123425, 1, 15, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Địa chỉ', N'Nam')
SET IDENTITY_INSERT [dbo].[dacbiet] OFF
GO
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (1, 12345, 211, N'Hoc Phi', N'Nam hoc 2022', 9000000, N'Nguyen Van A', N'Ha Noi')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (2, 12346, 222, N'Hoc Phi', N'Nam hoc 2020', 9000000, N'Nguyen Van B', N'Ha Nam')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (3, 12347, 212, N'Hoc Phi', N'Nam hoc 2021', 9000000, N'Nguyen Van C', N'Sai Gon')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (4, 12348, 225, N'Hoc Phi', N'Nam hoc 2019', 9000000, N'Nguyen Van D', N'Da Nang')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (5, 12349, 216, N'Hoc Phi', N'Nam hoc 2018', 9000000, N'Nguyen Van E', N'Ha Dong')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (6, 123410, 218, N'Hoc lai', N'Nam hoc 2022', 2400000, N'Tran van C', N'Nha Trang')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (7, 123411, 220, N'Hoc lai', N'Nam hoc 2021', 2400000, N'Tran van D', N'Quy Nhon')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (8, 12345, 223, N'Thi lai', N'Nam hoc 2022', 250000, N'Nguyen Van A', N'Ha Noi')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (9, 12346, 221, N'Thi lai', N'Nam hoc 2020', 250000, N'Nguyen Van B', N'Ha Nam')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (10, 12348, 213, N'Thi nang diem', N'Nam hoc 2018', 250000, N'Nguyen Van D', N'Da Nang')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (11, 12349, 215, N'Hoc Phi', N'Nam hoc 2019', 9000000, N'Nguyen Van E', N'Ha Dong')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (12, 123415, 222, N'Thi nang diem', N'Nam hoc 2022', 250000, N'Pham Van D', N'Ha Noi')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (13, 123410, 211, N'Hoc Phi', N'Nam hoc 2020', 9000000, N'Tran van C', N'Nha Trang')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (14, 123411, 219, N'Hoc Phi', N'Nam hoc 2022', 9000000, N'Tran van D', N'Quy Nhon')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (15, 123412, 221, N'Hoc Phi', N'Nam hoc 2022', 9000000, N'Pham Van A', N'Ha Noi')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (18, 12345, 211, N'Hoc Phi', N'Nam hoc 2022', 9000000, N'Nguyen Van A', N'Ha Noi')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (19, 12345, 211, N'Hoc Phi', N'Nam hoc 2022', 9000000, N'Nguyen Van A', N'Ha Noi')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (20, 12346, 222, N'Hoc Phi', N'Nam hoc 2020', 9000000, N'Nguyen Van B', N'Ha Nam')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (21, 12347, 212, N'Hoc Phi', N'Nam hoc 2021', 9000000, N'Nguyen Van C', N'Sai Gon')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (22, 12348, 225, N'Hoc Phi', N'Nam hoc 2019', 9000000, N'Nguyen Van D', N'Da Nang')
INSERT [dbo].[dadongHocPhi] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [sotien], [hoten], [diachi]) VALUES (23, 12349, 216, N'Hoc Phi', N'Nam hoc 2018', 9000000, N'Nguyen Van E', N'Ha Dong')
GO
SET IDENTITY_INSERT [dbo].[doituong] ON 

INSERT [dbo].[doituong] ([madoituongtt], [madoituong], [tendoituong]) VALUES (1, 1, N'Uu tien')
INSERT [dbo].[doituong] ([madoituongtt], [madoituong], [tendoituong]) VALUES (2, 2, N'Binh thuong')
SET IDENTITY_INSERT [dbo].[doituong] OFF
GO
INSERT [dbo].[hocphinganh] ([msv], [maphieuthu], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc]) VALUES (12347, 3, 212, N'Hoc Phi', N'Nam hoc 2021', N'Hoc Ky I', NULL, 9000000, N'Truc tiep')
INSERT [dbo].[hocphinganh] ([msv], [maphieuthu], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc]) VALUES (123415, 12, 222, N'Thi nang diem', N'Nam hoc 2022', N'Hoc Ky I', NULL, 250000, N'Online')
INSERT [dbo].[hocphinganh] ([msv], [maphieuthu], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc]) VALUES (12347, 21, 212, N'Hoc Phi', N'Nam hoc 2021', N'Hoc Ky I', NULL, 9000000, N'Truc tiep')
GO
INSERT [dbo].[hocphinganh126] ([msv], [maphieuthu], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc]) VALUES (12348, 4, 225, N'Hoc Phi', N'Nam hoc 2019', N'Hoc Ky II', NULL, 9000000, N'Truc tiep')
INSERT [dbo].[hocphinganh126] ([msv], [maphieuthu], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc]) VALUES (12348, 10, 213, N'Thi nang diem', N'Nam hoc 2018', N'Hoc Ky I', NULL, 250000, N'Truc tiep')
INSERT [dbo].[hocphinganh126] ([msv], [maphieuthu], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc]) VALUES (12348, 22, 225, N'Hoc Phi', N'Nam hoc 2019', N'Hoc Ky II', NULL, 9000000, N'Truc tiep')
GO
SET IDENTITY_INSERT [dbo].[khoa] ON 

INSERT [dbo].[khoa] ([makhoatt], [makhoa], [tenkhoa], [GVCNkhoa]) VALUES (1, 113, N'CONG NGHE THONG TIN', N'Nguyen Van A')
INSERT [dbo].[khoa] ([makhoatt], [makhoa], [tenkhoa], [GVCNkhoa]) VALUES (2, 114, N'DU LICH', N'Nguyen van B')
INSERT [dbo].[khoa] ([makhoatt], [makhoa], [tenkhoa], [GVCNkhoa]) VALUES (3, 115, N'LUAT', N'Nguyen Van C')
INSERT [dbo].[khoa] ([makhoatt], [makhoa], [tenkhoa], [GVCNkhoa]) VALUES (4, 116, N'QUAN TRI KINH DOANH', N'Nguyen Van D')
INSERT [dbo].[khoa] ([makhoatt], [makhoa], [tenkhoa], [GVCNkhoa]) VALUES (5, 117, N'KY THUAT O TO', N'Tran Van A')
INSERT [dbo].[khoa] ([makhoatt], [makhoa], [tenkhoa], [GVCNkhoa]) VALUES (6, 118, N'DUOC', N'Pham Van C')
SET IDENTITY_INSERT [dbo].[khoa] OFF
GO
INSERT [dbo].[khoa14] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (12345, N'Nguyen Van A', 2, N'P.602 - GD2', N'Khoa 14')
INSERT [dbo].[khoa14] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (12346, N'Nguyen Van B', 2, N'P.702 - GD1', N'Khoa 14')
INSERT [dbo].[khoa14] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (12347, N'Nguyen Van C', 2, N'P.606 - GD2', N'Khoa 14')
INSERT [dbo].[khoa14] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (12348, N'Nguyen Van D', 2, N'P.604 - GD2', N'Khoa 14')
INSERT [dbo].[khoa14] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (123410, N'Tran van C', 2, N'P.601 - GD2', N'Khoa 14')
INSERT [dbo].[khoa14] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (123411, N'Tran van D', 2, N'P.602 - GD2', N'Khoa 14')
INSERT [dbo].[khoa14] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (123413, N'Pham Van B', 2, N'P.602 - GD2', N'Khoa 14')
INSERT [dbo].[khoa14] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (123414, N'Pham Van C', 2, N'P.702 - GD1', N'Khoa 14')
INSERT [dbo].[khoa14] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (123415, N'Pham Van D', 2, N'P.606 - GD2', N'Khoa 14')
INSERT [dbo].[khoa14] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (123416, N'Nguyen Van AB', 1, N'P.602 - GD2', N'Khoa 14')
INSERT [dbo].[khoa14] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (123417, N'Nguyen Van BC', 1, N'P.702 - GD1', N'Khoa 14')
INSERT [dbo].[khoa14] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (123418, N'Nguyen Van CD', 1, N'P.606 - GD2', N'Khoa 14')
GO
INSERT [dbo].[khoa15] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (12341, N'Nguyen Van G', 2, N'P.301 - GD1', N'Khoa 15')
INSERT [dbo].[khoa15] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (12343, N'Tran van A', 2, N'P.401 - GD1', N'Khoa 15')
INSERT [dbo].[khoa15] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (12349, N'Nguyen Van E', 2, N'P.201 - GD1', N'Khoa 15')
INSERT [dbo].[khoa15] ([msv], [hoten], [madoituong], [tenlop], [khoahoc]) VALUES (123412, N'Pham Van A', 2, N'P.502 - GD2', N'Khoa 15')
GO
INSERT [dbo].[KhongPhaiCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (12341, N'Nguyen Van G', N'Thanh Xuan', N'Nam', 6, N'P.301 - GD1', 129, N'Quan ly, dieu hanh du lich')
INSERT [dbo].[KhongPhaiCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (12342, N'Nguyen Van H', N'Tay Nguyen', N'Nam', 7, N'P.303 - GD2', 130, N'Nhan vien phuc vu khach')
INSERT [dbo].[KhongPhaiCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (12343, N'Tran van A', N'Cao Bang', N'Nam', 8, N'P.401 - GD1', 131, N'Nhan vien Marketing du lich')
INSERT [dbo].[KhongPhaiCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (12344, N'Tran van B', N'Ha Noi', N'Nam', 9, N'P.501 - GD1', 132, N'Luat dat dai')
INSERT [dbo].[KhongPhaiCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (12349, N'Nguyen Van E', N'Ha Dong', N'Nam', 5, N'P.201 - GD1', 128, N'Huong dan vien du lich')
INSERT [dbo].[KhongPhaiCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (123410, N'Tran van C', N'Nha Trang', N'Nam', 10, N'P.601 - GD2', 133, N'Luat nha nuoc')
INSERT [dbo].[KhongPhaiCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (123411, N'Tran van D', N'Quy Nhon', N'Nam', 11, N'P.602 - GD2', 134, N'Luat lao dong')
INSERT [dbo].[KhongPhaiCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (123412, N'Pham Van A', N'Ha Noi', N'Nam', 12, N'P.502 - GD2', 135, N'Luat dan su')
GO
SET IDENTITY_INSERT [dbo].[lichsu] ON 

INSERT [dbo].[lichsu] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh], [mota], [id_taikhoan]) VALUES (29, 1234106, NULL, NULL, NULL, NULL, NULL, NULL, N'Tài khoản sinh viên, có mã tài khoản là: 1234106, mật khẩu là: 1234106', 12345)
INSERT [dbo].[lichsu] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh], [mota], [id_taikhoan]) VALUES (30, 1234106, 1, 4, N'Nguyen Van BC', CAST(N'2002-10-10' AS Date), N'Địa chỉ', N'Nam', N'Thông tin sinh viên tên là: Nguyen Van A, có mã sinh viên là: 1234106, khóa học: Khoa 14', 12345)
SET IDENTITY_INSERT [dbo].[lichsu] OFF
GO
SET IDENTITY_INSERT [dbo].[lop] ON 

INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (1, 1, 123, N'P.602 - GD2', N'Nguyen van A', N'Khoa 14')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (2, 2, 124, N'P.702 - GD1', N'Nguyen Van A', N'Khoa 14')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (3, 3, 125, N'P.606 - GD2', N'Nguyen Van A', N'Khoa 14')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (4, 4, 126, N'P.604 - GD2', N'Nguyen Van A', N'Khoa 14')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (5, 5, 128, N'P.201 - GD1', N'Nguyen Van B', N'Khoa 15')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (6, 6, 129, N'P.301 - GD1', N'Nguyen Van B', N'Khoa 15')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (7, 7, 130, N'P.303 - GD2', N'Nguyen Van B', N'Khoa 16')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (8, 8, 131, N'P.401 - GD1', N'Nguyen Van B', N'Khoa 15')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (9, 9, 132, N'P.501 - GD1', N'Nguyen Van C', N'Khoa 16')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (10, 10, 133, N'P.601 - GD2', N'Nguyen Van D', N'Khoa 14')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (11, 11, 134, N'P.602 - GD2', N'Nguyen Van D', N'Khoa 14')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (12, 12, 135, N'P.502 - GD2', N'Nguyen Van E', N'Khoa 15')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (13, 13, 136, N'P.601 - GD2', N'Nguyen Van G', N'Khoa 12')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (14, 14, 137, N'P.601 - GD2', N'Nguyen Van P', N'Khoa 13')
INSERT [dbo].[lop] ([maloptt], [malop], [manganh], [tenlop], [GVCNlop], [khoahoc]) VALUES (15, 15, 138, N'P.601 - GD2', N'Nguyen Van K', N'Khoa 16')
SET IDENTITY_INSERT [dbo].[lop] OFF
GO
SET IDENTITY_INSERT [dbo].[monhoc] ON 

INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (1, 211, N'Lap trinh C++')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (2, 212, N'Lap trinh Web')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (3, 213, N'Lap trinh Web 2')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (4, 214, N'Lap trinh Python')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (5, 215, N'Lap trinh Net cb')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (6, 216, N'Lap trinh Net nc')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (7, 217, N'Lap trinh Ruby')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (8, 218, N'Lap trinh Java')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (9, 219, N'Lap trinh PHP')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (10, 220, N'Lap trinh Go')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (11, 221, N'Lap trinh C')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (12, 222, N'Lap trinh Android')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (13, 223, N'Lap trinh Ios')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (14, 224, N'Lap trinh Fontend')
INSERT [dbo].[monhoc] ([mamonhoctt], [mamonhoc], [tenmonhoc]) VALUES (15, 225, N'Lap trinh Backend')
SET IDENTITY_INSERT [dbo].[monhoc] OFF
GO
SET IDENTITY_INSERT [dbo].[nganh] ON 

INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (1, 123, 113, N'lap trinh weg')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (2, 124, 113, N'Tri tue nhan tao')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (3, 125, 113, N'Dien toan dam may')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (4, 126, 113, N'Lap trinh Android')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (5, 127, 113, N'Lap trinh IOS')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (6, 128, 114, N'Huong dan vien du lich')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (7, 129, 114, N'Quan ly, dieu hanh du lich')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (8, 130, 114, N'Nhan vien phuc vu khach')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (9, 131, 116, N'Nhan vien Marketing du lich')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (10, 132, 115, N'Luat dat dai')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (11, 133, 115, N'Luat nha nuoc')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (12, 134, 115, N'Luat lao dong')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (13, 135, 115, N'Luat dan su')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (14, 136, 116, N'Quan tri kinh doanhs')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (15, 137, 116, N'Quan tri nhan luc')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (16, 138, 115, N'Marketing')
INSERT [dbo].[nganh] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (34, 150, 115, N'luat ')
SET IDENTITY_INSERT [dbo].[nganh] OFF
GO
INSERT [dbo].[nganhCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (12345, N'Nguyen Van A', N'Ha Noi', N'Nam', 1, N'P.602 - GD2', 123, N'lap trinh weg')
INSERT [dbo].[nganhCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (123413, N'Pham Van B', N'Nam Dinh', N'Nam', 1, N'P.602 - GD2', 123, N'lap trinh weg')
INSERT [dbo].[nganhCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (123416, N'Nguyen Van AB', N'Ha Noi', N'Nam', 1, N'P.602 - GD2', 123, N'lap trinh weg')
INSERT [dbo].[nganhCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (12346, N'Nguyen Van B', N'Ha Nam', N'Nam', 2, N'P.702 - GD1', 124, N'Tri tue nhan tao')
INSERT [dbo].[nganhCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (123414, N'Pham Van C', N'Ca Mau', N'Nam', 2, N'P.702 - GD1', 124, N'Tri tue nhan tao')
INSERT [dbo].[nganhCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (123417, N'Nguyen Van BC', N'Ha Nam', N'Nam', 2, N'P.702 - GD1', 124, N'Tri tue nhan tao')
INSERT [dbo].[nganhCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (12347, N'Nguyen Van C', N'Sai Gon', N'Nam', 3, N'P.606 - GD2', 125, N'Dien toan dam may')
INSERT [dbo].[nganhCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (123415, N'Pham Van D', N'Ha Noi', N'Nam', 3, N'P.606 - GD2', 125, N'Dien toan dam may')
INSERT [dbo].[nganhCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (123418, N'Nguyen Van CD', N'Sai Gon', N'Nam', 3, N'P.606 - GD2', 125, N'Dien toan dam may')
INSERT [dbo].[nganhCNTT] ([msv], [hoten], [diachi], [gioitinh], [malop], [tenlop], [manganh], [tennganh]) VALUES (12348, N'Nguyen Van D', N'Da Nang', N'Nam', 4, N'P.604 - GD2', 126, N'Lap trinh Android')
GO
SET IDENTITY_INSERT [dbo].[nganhcntt1] ON 

INSERT [dbo].[nganhcntt1] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (1, 123, 113, N'lap trinh weg')
INSERT [dbo].[nganhcntt1] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (2, 124, 113, N'Tri tue nhan tao')
INSERT [dbo].[nganhcntt1] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (3, 125, 113, N'Dien toan dam may')
INSERT [dbo].[nganhcntt1] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (4, 126, 113, N'Lap trinh Android')
INSERT [dbo].[nganhcntt1] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (5, 127, 113, N'Lap trinh IOS')
INSERT [dbo].[nganhcntt1] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (24, 150, 113, N'Big Data')
SET IDENTITY_INSERT [dbo].[nganhcntt1] OFF
GO
SET IDENTITY_INSERT [dbo].[nganhdulich] ON 

INSERT [dbo].[nganhdulich] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (6, 128, 114, N'Huong dan vien du lich')
INSERT [dbo].[nganhdulich] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (7, 129, 114, N'Quan ly, dieu hanh du lich')
INSERT [dbo].[nganhdulich] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (8, 130, 114, N'Nhan vien phuc vu khach')
SET IDENTITY_INSERT [dbo].[nganhdulich] OFF
GO
SET IDENTITY_INSERT [dbo].[nganhluat] ON 

INSERT [dbo].[nganhluat] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (10, 132, 115, N'Luat dat dai')
INSERT [dbo].[nganhluat] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (11, 133, 115, N'Luat nha nuoc')
INSERT [dbo].[nganhluat] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (12, 134, 115, N'Luat lao dong')
INSERT [dbo].[nganhluat] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (13, 135, 115, N'Luat dan su')
INSERT [dbo].[nganhluat] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (16, 150, 115, N'luat ')
INSERT [dbo].[nganhluat] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (19, 138, 115, N'Marketing')
SET IDENTITY_INSERT [dbo].[nganhluat] OFF
GO
SET IDENTITY_INSERT [dbo].[nganhQTKD] ON 

INSERT [dbo].[nganhQTKD] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (14, 136, 116, N'Quan tri kinh doanhs')
INSERT [dbo].[nganhQTKD] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (15, 137, 116, N'Quan tri nhan luc')
INSERT [dbo].[nganhQTKD] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (16, 138, 116, N'Marketing')
INSERT [dbo].[nganhQTKD] ([manganhtt], [manganh], [makhoa], [tennganh]) VALUES (20, 131, 116, N'Nhan vien Marketing du lich')
SET IDENTITY_INSERT [dbo].[nganhQTKD] OFF
GO
SET IDENTITY_INSERT [dbo].[phanhoi] ON 

INSERT [dbo].[phanhoi] ([maphanhoiduynhat], [tentaikhoan], [email], [sodienthoai], [chucvu], [noidung], [trangthai], [msv_id]) VALUES (1, N'12345', N'vantruong08062002@gmail.com', N'095406', N'Admin', N'Đã duyệt', N'Đã duyệt', 12345)
INSERT [dbo].[phanhoi] ([maphanhoiduynhat], [tentaikhoan], [email], [sodienthoai], [chucvu], [noidung], [trangthai], [msv_id]) VALUES (2, N'12345', N'vantruong08062002@gmail.com', N'029405934', N'Admin', N'Da duyet', N'duyet', 12345)
INSERT [dbo].[phanhoi] ([maphanhoiduynhat], [tentaikhoan], [email], [sodienthoai], [chucvu], [noidung], [trangthai], [msv_id]) VALUES (3, N'12345', N'vantruong08062002@gmail.com', N'039485', N'Admin', N'Da duyet', N'duyet', 12345)
INSERT [dbo].[phanhoi] ([maphanhoiduynhat], [tentaikhoan], [email], [sodienthoai], [chucvu], [noidung], [trangthai], [msv_id]) VALUES (4, N'12345', N'vantruong08062002@gmail.com', N'08957456', N'Admin', N'Noi dung', N'Da duyet', 1234100)
INSERT [dbo].[phanhoi] ([maphanhoiduynhat], [tentaikhoan], [email], [sodienthoai], [chucvu], [noidung], [trangthai], [msv_id]) VALUES (5, N'12345', N'vantruong08062002@gmail.com', N'0945663452', N'Admin', N'Da duyet', N'duyet', 12341)
INSERT [dbo].[phanhoi] ([maphanhoiduynhat], [tentaikhoan], [email], [sodienthoai], [chucvu], [noidung], [trangthai], [msv_id]) VALUES (6, N'12345', N'ABC@gmail.com', N'01235', N'Admin', N'1234', N'ABC', 12345)
SET IDENTITY_INSERT [dbo].[phanhoi] OFF
GO
SET IDENTITY_INSERT [dbo].[phieuthu] ON 

INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (1, 12345, 211, N'Hoc Phi', N'Nam hoc 2022', N'Hoc Ky I', NULL, 9000000, N'Online', 1, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (2, 12346, 222, N'Hoc Phi', N'Nam hoc 2020', N'Hoc Ky II', NULL, 9000000, N'Truc tiep', 12, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (3, 12347, 212, N'Hoc Phi', N'Nam hoc 2021', N'Hoc Ky I', NULL, 9000000, N'Truc tiep', 11, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (4, 12348, 225, N'Hoc Phi', N'Nam hoc 2019', N'Hoc Ky II', NULL, 9000000, N'Truc tiep', 10, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (5, 12349, 216, N'Hoc Phi', N'Nam hoc 2018', N'Hoc Ky I', NULL, 9000000, N'Online', 2, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (6, 123410, 218, N'Hoc lai', N'Nam hoc 2022', N'Hoc Ky I', NULL, 2400000, N'Truc tiep', 3, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (7, 123411, 220, N'Hoc lai', N'Nam hoc 2021', N'Hoc Ky II', NULL, 2400000, N'Online', 4, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (8, 12345, 223, N'Thi lai', N'Nam hoc 2022', N'Hoc Ky I', NULL, 250000, N'Online', 5, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (9, 12346, 221, N'Thi lai', N'Nam hoc 2020', N'Hoc Ky I', NULL, 250000, N'Online', 6, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (10, 12348, 213, N'Thi nang diem', N'Nam hoc 2018', N'Hoc Ky I', NULL, 250000, N'Truc tiep', 8, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (11, 12349, 215, N'Hoc Phi', N'Nam hoc 2019', N'Hoc Ky II', NULL, 9000000, N'Online', 10, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (12, 123415, 222, N'Thi nang diem', N'Nam hoc 2022', N'Hoc Ky I', NULL, 250000, N'Online', 11, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (13, 123410, 211, N'Hoc Phi', N'Nam hoc 2020', N'Hoc Ky I', NULL, 9000000, N'Online', 12, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (14, 123411, 219, N'Hoc Phi', N'Nam hoc 2022', N'Hoc Ky I', CAST(N'2002-10-10' AS Date), 9000000, N'Online', 10, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (16, 12345, 219, N'Hoc Phi', N'Nam hoc 2022', N'Hoc Ky I', CAST(N'2002-10-10' AS Date), 9000000, N'Online', 10, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (17, 12345, 211, N'Tien hoc', N'2002', N'hoc ky 2', CAST(N'2002-10-10' AS Date), 900000, N'online', 1, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (18, 12345, 211, N'Dong tien hoc', N'2022', N'2', CAST(N'2002-10-10' AS Date), 8999999488, N'online', 1, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (19, 12348, 221, N'Đóng tiền học phí', N'2022', N'2', CAST(N'2022-10-10' AS Date), 8999999488, N'online', 4, 1)
INSERT [dbo].[phieuthu] ([maphieuthu], [msv], [mamonhoc], [tenkhoanthu], [namhoc], [hocky], [ngaythu], [sotien], [hinhthuc], [mataikhoannganhangSV], [mataikhoannhantienHP]) VALUES (20, 123412, 221, N'Dong hoc phi', N'2022', N'2', CAST(N'2022-10-10' AS Date), 10000000, N'online', 9, 1)
SET IDENTITY_INSERT [dbo].[phieuthu] OFF
GO
SET IDENTITY_INSERT [dbo].[sinhvien] ON 

INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (6, 12341, 2, 10, N'Nguyen Van G', CAST(N'2002-09-01' AS Date), N'Thanh Xuan', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (7, 12342, 2, 7, N'Nguyen Van H', CAST(N'2002-09-01' AS Date), N'Tay Nguyen', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (8, 12343, 2, 8, N'Tran van A', CAST(N'2002-10-11' AS Date), N'Cao Bang', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (9, 12344, 2, 9, N'Tran van B', CAST(N'2002-11-12' AS Date), N'Ha Noi', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (1, 12345, 2, 10, N'Nguyen Van A', CAST(N'2002-08-01' AS Date), N'Ha Nois', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (2, 12346, 2, 6, N'Nguyen Van B', CAST(N'2002-08-02' AS Date), N'Ha Nam', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (3, 12347, 2, 3, N'Nguyen Van C', CAST(N'2002-08-03' AS Date), N'Sai Gons', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (4, 12348, 2, 4, N'Nguyen Van D', CAST(N'2002-08-04' AS Date), N'Da Nang', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (5, 12349, 2, 5, N'Nguyen Van E', CAST(N'2002-08-05' AS Date), N'Ha Dong', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (10, 123410, 2, 3, N'Tran van C', CAST(N'2002-12-01' AS Date), N'Nha Trangs', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (11, 123411, 2, 11, N'Tran van D', CAST(N'2002-05-01' AS Date), N'Quy Nhon', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (12, 123412, 2, 12, N'Pham Van A', CAST(N'2002-06-02' AS Date), N'Ha Noi', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (13, 123413, 2, 1, N'Pham Van B', CAST(N'2002-01-03' AS Date), N'Nam Dinh', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (14, 123414, 2, 5, N'Pham Van C', CAST(N'2002-02-20' AS Date), N'Ca Mau', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (15, 123415, 2, 5, N'Pham Van D', CAST(N'2002-10-19' AS Date), N'Ha Noi2', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (16, 123416, 1, 5, N'Nguyen Van AB', CAST(N'2002-09-02' AS Date), N'Ha Noi', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (17, 123417, 1, 15, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Ha Nams', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (24, 123418, 1, 15, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Ha Namss', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (29, 123420, 1, 15, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Ha Namss', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (83, 123425, 1, 15, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (81, 123430, 1, 1, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (86, 123435, 1, 5, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (59, 1234100, 1, 2, N'Nguyen Van B', CAST(N'2002-10-02' AS Date), N'Ha Noi', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (87, 1234101, 1, 5, N'Nguyen Van BC', CAST(N'2002-10-10' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (92, 1234102, 1, 5, N'Nguyen Van BC', CAST(N'2002-10-10' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[sinhvien] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (93, 1234105, 1, 4, N'Nguyen Van BC', CAST(N'2002-10-10' AS Date), N'Địa chỉ', N'Nam')
SET IDENTITY_INSERT [dbo].[sinhvien] OFF
GO
SET IDENTITY_INSERT [dbo].[SinhVienDB] ON 

INSERT [dbo].[SinhVienDB] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (16, 123416, 1, 1, N'Nguyen Van AB', CAST(N'2002-09-02' AS Date), N'Ha Noi', N'Nam')
INSERT [dbo].[SinhVienDB] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (17, 123417, 1, 2, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Ha Nam', N'Nam')
INSERT [dbo].[SinhVienDB] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (18, 123418, 1, 3, N'Nguyen Van CD', CAST(N'2002-11-06' AS Date), N'Sai Gon', N'Nam')
SET IDENTITY_INSERT [dbo].[SinhVienDB] OFF
GO
SET IDENTITY_INSERT [dbo].[SinhVienK14] ON 

INSERT [dbo].[SinhVienK14] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (22, 12345, 2, 10, N'Nguyen Van A', CAST(N'2002-08-01' AS Date), N'Ha Nois', N'Nam')
INSERT [dbo].[SinhVienK14] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (2, 12346, 2, 2, N'Nguyen Van B', CAST(N'2002-08-02' AS Date), N'Ha Nam', N'Nam')
INSERT [dbo].[SinhVienK14] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (21, 12341, 2, 10, N'Nguyen Van G', CAST(N'2002-09-01' AS Date), N'Thanh Xuan', N'Nam')
INSERT [dbo].[SinhVienK14] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (4, 12348, 2, 4, N'Nguyen Van D', CAST(N'2002-08-04' AS Date), N'Da Nang', N'Nam')
INSERT [dbo].[SinhVienK14] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (26, 123410, 2, 3, N'Tran van C', CAST(N'2002-12-01' AS Date), N'Nha Trangs', N'Nam')
INSERT [dbo].[SinhVienK14] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (47, 123430, 1, 1, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[SinhVienK14] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (41, 123490, 1, 2, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Ha Namss', N'Nam')
INSERT [dbo].[SinhVienK14] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (48, 1234105, 1, 4, N'Nguyen Van BC', CAST(N'2002-10-10' AS Date), N'Địa chỉ', N'Nam')
SET IDENTITY_INSERT [dbo].[SinhVienK14] OFF
GO
SET IDENTITY_INSERT [dbo].[SinhVienK15] ON 

INSERT [dbo].[SinhVienK15] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (19, 123416, 1, 5, N'Nguyen Van AB', CAST(N'2002-09-02' AS Date), N'Ha Noi', N'Nam')
INSERT [dbo].[SinhVienK15] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (8, 12343, 2, 8, N'Tran van A', CAST(N'2002-10-11' AS Date), N'Cao Bang', N'Nam')
INSERT [dbo].[SinhVienK15] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (5, 12349, 2, 5, N'Nguyen Van E', CAST(N'2002-08-05' AS Date), N'Ha Dong', N'Nam')
INSERT [dbo].[SinhVienK15] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (12, 123412, 2, 12, N'Pham Van A', CAST(N'2002-06-02' AS Date), N'Ha Noi', N'Nam')
INSERT [dbo].[SinhVienK15] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (20, 123415, 2, 5, N'Pham Van D', CAST(N'2002-10-19' AS Date), N'Ha Noi2', N'Nam')
INSERT [dbo].[SinhVienK15] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (21, 123414, 2, 5, N'Pham Van C', CAST(N'2002-02-20' AS Date), N'Ca Mau', N'Nam')
INSERT [dbo].[SinhVienK15] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (42, 123435, 1, 5, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[SinhVienK15] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (43, 1234101, 1, 5, N'Nguyen Van BC', CAST(N'2002-10-10' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[SinhVienK15] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (49, 1234102, 1, 5, N'Nguyen Van BC', CAST(N'2002-10-10' AS Date), N'Địa chỉ', N'Nam')
INSERT [dbo].[SinhVienK15] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (47, 123485, 2, 5, N'Nguyen Van AB', CAST(N'2002-10-02' AS Date), N'Ha Noi', N'Nam')
SET IDENTITY_INSERT [dbo].[SinhVienK15] OFF
GO
SET IDENTITY_INSERT [dbo].[SinhVienK16] ON 

INSERT [dbo].[SinhVienK16] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (7, 12342, 2, 7, N'Nguyen Van H', CAST(N'2002-09-01' AS Date), N'Tay Nguyen', N'Nam')
INSERT [dbo].[SinhVienK16] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (9, 12344, 2, 9, N'Tran van B', CAST(N'2002-11-12' AS Date), N'Ha Noi', N'Nam')
INSERT [dbo].[SinhVienK16] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (10, 123418, 1, 15, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Ha Namss', N'Nam')
INSERT [dbo].[SinhVienK16] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (11, 123417, 1, 15, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Ha Nams', N'Nam')
INSERT [dbo].[SinhVienK16] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (12, 123420, 1, 15, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Ha Namss', N'Nam')
INSERT [dbo].[SinhVienK16] ([masvtt], [msv], [madoituong], [malop], [hoten], [ngaysinh], [diachi], [gioitinh]) VALUES (28, 123425, 1, 15, N'Nguyen Van BC', CAST(N'2002-10-02' AS Date), N'Địa chỉ', N'Nam')
SET IDENTITY_INSERT [dbo].[SinhVienK16] OFF
GO
SET IDENTITY_INSERT [dbo].[taikhoan] ON 

INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (12, 12341, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (13, 12342, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (14, 12343, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (15, 12344, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (1, 12345, N'12345', 1)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (2, 12346, N'123', 2)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (3, 12347, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (4, 12348, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (5, 12349, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (6, 123410, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (7, 123411, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (8, 123412, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (9, 123413, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (10, 123414, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (11, 123415, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (18, 123420, N'123', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (56, 1234102, N'1234102', 3)
INSERT [dbo].[taikhoan] ([mataikhoantt], [tentaikhoan], [matkhau], [capquyen]) VALUES (57, 1234105, N'1234105', 3)
SET IDENTITY_INSERT [dbo].[taikhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[taikhoannganhangSV] ON 

INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (1, 12345, N'MBBANK', N'Hoai Duc', N'0123456789', N'Nguyen Van A', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (2, 12346, N'TECHCOMBANK', N'Hoai Duc', N'0123456789', N'Nguyen Van B', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (3, 12347, N'SACOMBANK', N'Tay Ho', N'0928342344', N'Nguyen Van C', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (4, 12348, N'VIETTINKNBANK', N'Ha Noi', N'234543223', N'Nguyen Van D', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (5, 12345, N'ARIBANK', N'Ha Noi', N'23453453', N'Nguyen Van A', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (6, 123410, N'TPBANK', N'Hoai Duc', N'423562312', N'Tran Van C', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (7, 123411, N'VIETCOMBANK', N'Hoai Duc', N'45363423', N'Tran Van D', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (8, 123415, N'MBBANK', N'Ha Dong', N'7567323442', N'Nguyen Van A', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (9, 123412, N'TPBANK', N'Thank Xuan', N'235456764', N'Nguyen Van A', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (10, 12348, N'SACOMBANK', N'Nguyen Trai', N'775854343', N'Nguyen Van C', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (11, 12349, N'TECHCOMBANK', N'Ha Dong', N'56853243545', N'Nguyen Van D', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (12, 123410, N'MBBANK', N'Tay Ho', N'0757656789', N'Nguyen Van F', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (13, 123412, N'TPBANK', N'Ha Noi', N'9578473456', N'Nguyen Van G', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (14, 123415, N'MBBANK', N'Hoai Duc', N'53457859', N'Nguyen Van H', NULL)
INSERT [dbo].[taikhoannganhangSV] ([manganhang], [msv], [tennganhang], [chinhanh], [sotaikhoan], [tentaikhoan], [ngaytao]) VALUES (15, 12345, N'VIETCOMBANK', N'Ha Noi', N'4234255453', N'Nguyen Van B', NULL)
SET IDENTITY_INSERT [dbo].[taikhoannganhangSV] OFF
GO
SET IDENTITY_INSERT [dbo].[taikhoannhantienHP] ON 

INSERT [dbo].[taikhoannhantienHP] ([mataikhoannhantien], [tennganhhang], [tenchinhanh], [sotaikhoanNT], [tentaikhoanNT], [ngaytao]) VALUES (1, N'MBBANK', N'Hoai Duc', N'932748233', N'Nguyen Van P', NULL)
SET IDENTITY_INSERT [dbo].[taikhoannhantienHP] OFF
GO
SET IDENTITY_INSERT [dbo].[thacmac] ON 

INSERT [dbo].[thacmac] ([maduynhat], [msv_id], [lop_id], [khoahoc], [email], [sodienthoai], [diachi], [noidung], [trangthai]) VALUES (21, 12345, 10, N'14', N'vantruong@gmail.com', N'0912345', N'Ha Noi', N'123', N'ABC')
SET IDENTITY_INSERT [dbo].[thacmac] OFF
GO
/****** Object:  Index [UQ__doituong__09D6BB6992E1AFAF]    Script Date: 9/19/2024 2:14:32 PM ******/
ALTER TABLE [dbo].[doituong] ADD UNIQUE NONCLUSTERED 
(
	[madoituongtt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__khoa__94E96D6682CEBC39]    Script Date: 9/19/2024 2:14:32 PM ******/
ALTER TABLE [dbo].[khoa] ADD UNIQUE NONCLUSTERED 
(
	[makhoatt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__lichsu__F537E0E9A091EED7]    Script Date: 9/19/2024 2:14:32 PM ******/
ALTER TABLE [dbo].[lichsu] ADD UNIQUE NONCLUSTERED 
(
	[masvtt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__lop__9116406889B1A865]    Script Date: 9/19/2024 2:14:32 PM ******/
ALTER TABLE [dbo].[lop] ADD UNIQUE NONCLUSTERED 
(
	[maloptt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__monhoc__2B41414E4372D010]    Script Date: 9/19/2024 2:14:32 PM ******/
ALTER TABLE [dbo].[monhoc] ADD UNIQUE NONCLUSTERED 
(
	[mamonhoctt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__nganh__9A9971E7378963DB]    Script Date: 9/19/2024 2:14:32 PM ******/
ALTER TABLE [dbo].[nganh] ADD UNIQUE NONCLUSTERED 
(
	[manganhtt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__sinhvien__F537E0E9716AF1E4]    Script Date: 9/19/2024 2:14:32 PM ******/
ALTER TABLE [dbo].[sinhvien] ADD UNIQUE NONCLUSTERED 
(
	[masvtt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__taikhoan__BF2DADC88F1C5017]    Script Date: 9/19/2024 2:14:32 PM ******/
ALTER TABLE [dbo].[taikhoan] ADD UNIQUE NONCLUSTERED 
(
	[mataikhoantt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[lichsu]  WITH CHECK ADD FOREIGN KEY([id_taikhoan])
REFERENCES [dbo].[taikhoan] ([tentaikhoan])
GO
ALTER TABLE [dbo].[lichsu]  WITH CHECK ADD FOREIGN KEY([madoituong])
REFERENCES [dbo].[doituong] ([madoituong])
GO
ALTER TABLE [dbo].[lichsu]  WITH CHECK ADD FOREIGN KEY([malop])
REFERENCES [dbo].[lop] ([malop])
GO
ALTER TABLE [dbo].[lop]  WITH CHECK ADD FOREIGN KEY([manganh])
REFERENCES [dbo].[nganh] ([manganh])
GO
ALTER TABLE [dbo].[nganh]  WITH CHECK ADD FOREIGN KEY([makhoa])
REFERENCES [dbo].[khoa] ([makhoa])
GO
ALTER TABLE [dbo].[phanhoi]  WITH CHECK ADD FOREIGN KEY([msv_id])
REFERENCES [dbo].[sinhvien] ([msv])
GO
ALTER TABLE [dbo].[phieuthu]  WITH CHECK ADD FOREIGN KEY([mamonhoc])
REFERENCES [dbo].[monhoc] ([mamonhoc])
GO
ALTER TABLE [dbo].[phieuthu]  WITH CHECK ADD FOREIGN KEY([mataikhoannganhangSV])
REFERENCES [dbo].[taikhoannganhangSV] ([manganhang])
GO
ALTER TABLE [dbo].[phieuthu]  WITH CHECK ADD FOREIGN KEY([mataikhoannhantienHP])
REFERENCES [dbo].[taikhoannhantienHP] ([mataikhoannhantien])
GO
ALTER TABLE [dbo].[phieuthu]  WITH CHECK ADD FOREIGN KEY([msv])
REFERENCES [dbo].[sinhvien] ([msv])
GO
ALTER TABLE [dbo].[sinhvien]  WITH CHECK ADD FOREIGN KEY([madoituong])
REFERENCES [dbo].[doituong] ([madoituong])
GO
ALTER TABLE [dbo].[sinhvien]  WITH CHECK ADD FOREIGN KEY([malop])
REFERENCES [dbo].[lop] ([malop])
GO
ALTER TABLE [dbo].[taikhoan]  WITH CHECK ADD FOREIGN KEY([tentaikhoan])
REFERENCES [dbo].[sinhvien] ([msv])
GO
ALTER TABLE [dbo].[taikhoannganhangSV]  WITH CHECK ADD FOREIGN KEY([msv])
REFERENCES [dbo].[sinhvien] ([msv])
GO
ALTER TABLE [dbo].[thacmac]  WITH CHECK ADD FOREIGN KEY([lop_id])
REFERENCES [dbo].[lop] ([malop])
GO
ALTER TABLE [dbo].[thacmac]  WITH CHECK ADD FOREIGN KEY([msv_id])
REFERENCES [dbo].[sinhvien] ([msv])
GO
/****** Object:  StoredProcedure [dbo].[Addnganh]    Script Date: 9/19/2024 2:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Addnganh] @manganh int, @makhoa int, @tennganh nvarchar(100)
as
begin
	if(@makhoa = 113)
		insert into nganhcntt1(manganh, makhoa, tennganh) values (@manganh, @makhoa, @tennganh)
	if(@makhoa = 114)
		insert into nganhdulich(manganh, makhoa, tennganh) values (@manganh, @makhoa, @tennganh)
	if(@makhoa = 115)
		insert into nganhluat(manganh, makhoa, tennganh) values (@manganh, @makhoa, @tennganh)
	if(@makhoa = 116)
		insert into nganhQTKD(manganh, makhoa, tennganh) values (@manganh, @makhoa, @tennganh)
end
GO
/****** Object:  StoredProcedure [dbo].[Addsinhvien]    Script Date: 9/19/2024 2:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Addsinhvien] @msv int, @madoituong int, @malop int, @hocten nvarchar(50), @ngaysinh nvarchar(50), @diachi nvarchar(50), @gioitinh nvarchar(20)
as
begin
	if(@malop <= 4 or @malop = 10 or @malop = 11)
		insert into SinhVienK14(msv, madoituong, malop, hoten, ngaysinh, diachi, gioitinh) values (@msv, @madoituong, @malop, @hocten, @ngaysinh, @diachi, @gioitinh)
	if(@malop = 5 or @malop = 6 or @malop = 8 or @malop = 12)
		insert into SinhVienK15(msv, madoituong, malop, hoten, ngaysinh, diachi, gioitinh) values (@msv, @madoituong, @malop, @hocten, @ngaysinh, @diachi, @gioitinh)
	if(@malop = 7 or @malop = 9 or @malop = 15)
		insert into SinhVienK14(msv, madoituong, malop, hoten, ngaysinh, diachi, gioitinh) values (@msv, @madoituong, @malop, @hocten, @ngaysinh, @diachi, @gioitinh)
	if(@malop = 13)
		insert into SinhVienK13(msv, madoituong, malop, hoten, ngaysinh, diachi, gioitinh) values (@msv, @madoituong, @malop, @hocten, @ngaysinh, @diachi, @gioitinh)
	if(@malop = 14)
		insert into SinhVienK12(msv, madoituong, malop, hoten, ngaysinh, diachi, gioitinh) values (@msv, @madoituong, @malop, @hocten, @ngaysinh, @diachi, @gioitinh)
end
GO
/****** Object:  StoredProcedure [dbo].[timkiem]    Script Date: 9/19/2024 2:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[timkiem](@timk nvarchar(50))
as
begin
	select * from sinhvien where hoten like '%@timk%'
end
GO
/****** Object:  StoredProcedure [dbo].[timmkiemNH]    Script Date: 9/19/2024 2:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[timmkiemNH](@tk int)
as
begin
	select * from sinhvien left join phieuthu on sinhvien.msv = phieuthu.msv where sinhvien.msv in (select msv from phieuthu where phieuthu.mataikhoannganhangSV = @tk)
end
GO
/****** Object:  StoredProcedure [dbo].[TKSV]    Script Date: 9/19/2024 2:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TKSV](@tk int)
as
begin
	select * into TKSINHVIEN from sinhvien where msv = @tk
	if exists(select * from TKSINHVIEN)
		select * from TKSINHVIEN
	else
		print N'Khong co'
end
GO
