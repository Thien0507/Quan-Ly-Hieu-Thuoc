DROP
    DATABASE IF EXISTS QuanLyHieuThuoc;
CREATE DATABASE QuanLyHieuThuoc DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci; USE
    QuanLyHieuThuoc;
CREATE TABLE IF NOT EXISTS QuanLyHieuThuoc.NhanVien(
    IDNhanVien INT PRIMARY KEY AUTO_INCREMENT,
    TaiKhoan VARCHAR(100) NOT NULL UNIQUE,
    MatKhau VARCHAR(100) NOT NULL,
    HoTen VARCHAR(100) NOT NULL,
    DiaChi VARCHAR(100) NOT NULL,
    NgaySinh DATE NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DienThoai VARCHAR(100) NOT NULL,
    ChucVu INT NOT NULL
); CREATE TABLE IF NOT EXISTS QuanLyHieuThuoc.NhaPhanPhoi(
    IDNhaPhanPhoi INT PRIMARY KEY AUTO_INCREMENT,
    TenNPP VARCHAR(100) NOT NULL,
    DiaChi VARCHAR(100) NOT NULL,
    DienThoai VARCHAR(50) NOT NULL,
    Fax VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
); CREATE TABLE IF NOT EXISTS QuanLyHieuThuoc.Thuoc(
    IDThuoc INT PRIMARY KEY AUTO_INCREMENT,
    TenThuoc VARCHAR(100) NOT NULL,
    NSX VARCHAR(100) NOT NULL,
    NhomThuoc VARCHAR(100) NOT NULL,
    SoLuong INT NOT NULL,
    GiaBan DECIMAL(15, 4) NOT NULL,
    DonVi VARCHAR(50) NOT NULL,
    ThanhPhan VARCHAR(500) NOT NULL,
    HamLuong VARCHAR(500) NOT NULL,
    CachDung VARCHAR(500) NOT NULL,
    HanSuDung DATE NOT NULL,
    CongDung VARCHAR(500) NOT NULL,
    PhanTacDung VARCHAR(500) NULL,
    DangBaoChe VARCHAR(500) NOT NULL,
    BaoQuan VARCHAR(500) NOT NULL
); CREATE TABLE IF NOT EXISTS QuanLyHieuThuoc.KhachHang(
    IDKhachHang INT PRIMARY KEY AUTO_INCREMENT,
    TenKhachHang VARCHAR(100) NOT NULL,
    DienThoai VARCHAR(50) NULL,
    Email VARCHAR(100) NOT NULL
); CREATE TABLE IF NOT EXISTS QuanLyHieuThuoc.HoaDonNhap(
    IDHoaDonNhap INT PRIMARY KEY AUTO_INCREMENT,
    IDNhaPhanPhoi INT NOT NULL,
    IDNhanVien INT NOT NULL,
    TongTienThuoc DECIMAL(15, 4) NOT NULL,
    TongThue FLOAT NOT NULL,
    TongTienHDN DECIMAL(15, 4) NOT NULL,
    NgayNhap DATE NOT NULL,
    FOREIGN KEY(IDNhaPhanPhoi) REFERENCES QuanLyHieuThuoc.NhaPhanPhoi(IDNhaPhanPhoi) ON DELETE CASCADE,
    FOREIGN KEY(IDNhanVien) REFERENCES QuanLyHieuThuoc.NhanVien(IDNhanVien) ON DELETE CASCADE
); CREATE TABLE IF NOT EXISTS QuanLyHieuThuoc.ChiTietHoaDonNhap(
    IDChiTietHDN INT PRIMARY KEY AUTO_INCREMENT,
    IDHoaDonNhap INT NOT NULL,
    IDThuoc INT NOT NULL,
    SoLuong INT NOT NULL,
    GiaNhap DECIMAL(15, 4) NOT NULL,
    FOREIGN KEY(IDHoaDonNhap) REFERENCES QuanLyHieuThuoc.HoaDonNhap(IDHoaDonNhap) ON DELETE CASCADE,
    FOREIGN KEY(IDThuoc) REFERENCES QuanLyHieuThuoc.Thuoc(IDThuoc) ON DELETE CASCADE
); CREATE TABLE IF NOT EXISTS QuanLyHieuThuoc.HoaDonXuat(
    IDHoaDonXuat INT PRIMARY KEY AUTO_INCREMENT,
    IDKhachHang INT NOT NULL,
    IDNhanVien INT NOT NULL,
    NgayXuat DATE NOT NULL,
    TongTienThuoc DECIMAL(15, 4) NOT NULL,
    TongThue FLOAT NOT NULL,
    TongTienHDX DECIMAL(15, 4) NOT NULL,
    FOREIGN KEY(IDKhachHang) REFERENCES QuanLyHieuThuoc.KhachHang(IDKhachHang) ON DELETE CASCADE,
    FOREIGN KEY(IDNhanVien) REFERENCES QuanLyHieuThuoc.NhanVien(IDNhanVien) ON DELETE CASCADE
); CREATE TABLE IF NOT EXISTS QuanLyHieuThuoc.ChiTietHoaDonXuat(
    IDChiTietHDX INT PRIMARY KEY AUTO_INCREMENT,
    IDHoaDonXuat INT NOT NULL,
    IDThuoc INT NOT NULL,
    SoLuong INT NOT NULL,
    FOREIGN KEY(IDHoaDonXuat) REFERENCES QuanLyHieuThuoc.HoaDonXuat(IDHoaDonXuat) ON DELETE CASCADE,
    FOREIGN KEY(IDThuoc) REFERENCES QuanLyHieuThuoc.Thuoc(IDThuoc) ON DELETE CASCADE
);