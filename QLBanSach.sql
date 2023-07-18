drop database if exists qlbs;
create database qlbs;

use qlbs;

create table KhachHang(
    MaKH int auto_increment primary key,
    Taikhoan varchar(255) not null unique,
    MatKhau varchar(255) not null,
    Email varchar(255) not null unique,
    DiaChi varchar(255) not null,
    DienThoai varchar(20) not null,
    GioiTinh varchar(10) not null,
    NgaySinh DATE not null,
    HoTen varchar(255) not null
);

create table DonHang(
    MaDonHang int auto_increment primary key,
    DaThanhToan boolean not null,
    NgayGiao Date not null,
    NgayDat Date not null,
    TinhTrangGH varchar(255) not null,
    MaKH int not null
);

create table ChuDe(
    MaChuDe int auto_increment primary key,
    TenChuDe varchar(255) not null
);

create table NhaXuatBan(
    MaNSX int auto_increment primary key,
    TenNSB varchar(255) not null,
    DienThoai varchar(20) not null,
    DiaChi varchar(255) not null
);

create table Sach(
    MaSach int auto_increment primary key,
    TenSach varchar(255) not null,
    SoLuongTon int not null,
    NgayCapNhat date not null,
    AnhBia varchar(255) not null,
    MoTa text not null,
    GiaBan decimal(15,2) not null,
    MaNSX int not null,
    MaChuDe int not null
);

create table DonHang_Sach(
    MaSach int,
    MaDonHang int,
    SoLuong int not null,
    DonGia decimal(15,2) not null,
    primary key (MaSach, MaDonHang)
);

create table TacGia(
    MaTacGia int primary key,
    TenTacGia varchar(255) not null,
    DiaChi varchar(255) not null,
    TieuSu varchar(255) not null,
    DienThoai varchar(20) not null
);

create table TacGia_Sach(
    MaTacGia int,
    MaSach int,
    VaiTro varchar(25) not null,
    ViTri varchar(25) not null,
    primary key(MaTacGia, MaSach)
);

alter table DonHang add foreign key (MaKH) references KhachHang(MaKH);

alter table Sach add foreign key (MaChuDe) references ChuDe(MaChuDe);
alter table Sach add foreign key (MaNSX) references NhaXuatBan(MaNSX);

alter table DonHang_Sach add foreign key (MaSach) references Sach(MaSach);
alter table DonHang_Sach add foreign key (MaDonHang) references DonHang(MaDonHang);

alter table TacGia_Sach add foreign key (MaTacGia) references TacGia(MaTacGia);
alter table TacGia_Sach add foreign key (MaSach) references Sach(MaSach);
