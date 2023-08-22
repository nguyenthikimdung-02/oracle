--Bang NHACUNGCAP
CREATE TABLE NCC
( 
  MaNCC varchar2(10) NOT NULL,  
  TenNCC varchar2(70) UNIQUE,    
  CONSTRAINT PK_MaNCC PRIMARY KEY (MaNCC)  
);



Insert into NCC (MANCC,TENNCC) values ('NCC01','Cong ty Co phan Da Thuoc Wei Tai');
Insert into NCC (MANCC,TENNCC) values ('NCC02','Cong ty TNHH San Xuat Thuong Mai Tim Do');
Insert into NCC (MANCC,TENNCC) values ('NCC03','Cong ty TNHH Trieu Phong');
Insert into NCC (MANCC,TENNCC) values ('NCC04','Cong ty Tae Sung');

--BANG NHASANXUAT
CREATE TABLE NSX
( 
  MaNSX varchar2(10) NOT NULL,  
  TenNSX varchar2(70)UNIQUE,    
  CONSTRAINT PK_MaNSX PRIMARY KEY (MaNSX)  
);

Insert into NSX (MANSX,TENNSX) values ('NSX01','Cong ty TNHH San xuat Hang Tieu Dung Binh Tien - Bitis');
Insert into NSX (MANSX,TENNSX) values ('NSX02','Cong ty Co phan San xuat Thuong mai và Dich vu Juno');
Insert into NSX (MANSX,TENNSX) values ('NSX03','Cong ty Co phan Giay Viet - Vina-Giay');
Insert into NSX (MANSX,TENNSX) values ('NSX04','Cong ty Co phan Thoi trang Evashoes');
Insert into NSX (MANSX,TENNSX) values ('NSX05','He thong Giay thoi trang Hanh Dung');
Insert into NSX (MANSX,TENNSX) values ('NSX06','Giay da Kim Thanh');
Insert into NSX (MANSX,TENNSX) values ('NSX07','Cong ty San xuat Hang Tieu Dung Binh Tan');
Insert into NSX (MANSX,TENNSX) values ('NSX08','Giay Thuong D?nh');
Insert into NSX (MANSX,TENNSX) values ('NSX09','Giay Hong Thanh');

--BANG GIAY
CREATE TABLE GIAY
( 
  MaGiay varchar2(10) NOT NULL,  
  TenGiay varchar2(100) UNIQUE ,
  GiaBan number CHECK(GiaBan >= 0 ) ,
  SLTon number CHECK(SLTon >= 0 ) ,
  MaNSX varchar2(10) DEFAULT 'Unknow', 
  HinhAnh varchar2(100),
  CONSTRAINT PK_MaGiay PRIMARY KEY (MaGiay),
  CONSTRAINT FK_MaNSX_GIAY FOREIGN KEY (MaNSX) REFERENCES NSX(MaNSX)
);

Insert into GIAY (MAGIAY,TENGIAY,GIABAN,SLTON,MANSX,HINHANH) values ('MG01','Giay The Thao Tre Em Hunter Junior - Dune OTP Real White edition HSG000100TRG (Trang)',585000,45,'NSX01','C:\Users\HP\OneDrive\Máy tính\QL_BANGIAY\HinhAnh\hinhanh01.jpg');
Insert into GIAY (MAGIAY,TENGIAY,GIABAN,SLTON,MANSX,HINHANH) values ('MG02','Giay The Thao Nam Hunter X - Dune OTP Real Black edition HSM001200DEN (Den)',1329000,19,'NSX01','C:\Users\HP\OneDrive\Máy tính\QL_BANGIAY\HinhAnh\hinhanh02.jpg');
Insert into GIAY (MAGIAY,TENGIAY,GIABAN,SLTON,MANSX,HINHANH) values ('MG03','Dep Eva Be Trai DEB010100XNH (Xanh Nhat)',250000,4,'NSX01','C:\Users\HP\OneDrive\Máy tính\QL_BANGIAY\HinhAnh\hinhanh03.jpg');
Insert into GIAY (MAGIAY,TENGIAY,GIABAN,SLTON,MANSX,HINHANH) values ('MG04','Sneaker Queendom',995000,11,'NSX02','C:\Users\HP\OneDrive\Máy tính\QL_BANGIAY\HinhAnh\hinhanh04.jpg');
Insert into GIAY (MAGIAY,TENGIAY,GIABAN,SLTON,MANSX,HINHANH) values ('MG05','Love You To The Moon',895000,22,'NSX02','C:\Users\HP\OneDrive\Máy tính\QL_BANGIAY\HinhAnh\hinhanh05.jpg');
Insert into GIAY (MAGIAY,TENGIAY,GIABAN,SLTON,MANSX,HINHANH) values ('MG06','03003BC04 - Giay Bata HD2818BC',490000,50,'NSX05','C:\Users\HP\OneDrive\Máy tính\QL_BANGIAY\HinhAnh\hinhanh06.jpg');
Insert into GIAY (MAGIAY,TENGIAY,GIABAN,SLTON,MANSX,HINHANH) values ('MG07','03006AY06 - Giay Bata HD2975AY',190000,20,'NSX05','C:\Users\HP\OneDrive\Máy tính\QL_BANGIAY\HinhAnh\hinhanh07.jpg');
Insert into GIAY (MAGIAY,TENGIAY,GIABAN,SLTON,MANSX,HINHANH) values ('MG08','Giay vai Thuong Dinh KK14-1',100000,10,'NSX08','C:\Users\HP\OneDrive\Máy tính\QL_BANGIAY\HinhAnh\hinhanh08.jpg');
Insert into GIAY (MAGIAY,TENGIAY,GIABAN,SLTON,MANSX,HINHANH) values ('MG09','Giay Thuong Dinh TD9916',75000,30,'NSX08','C:\Users\HP\OneDrive\Máy tính\QL_BANGIAY\HinhAnh\hinhanh09.jpg');
Insert into GIAY (MAGIAY,TENGIAY,GIABAN,SLTON,MANSX,HINHANH) values ('MG10','Bata 6350 Den',670000,55,'NSX09','C:\Users\HP\OneDrive\Máy tính\QL_BANGIAY\HinhAnh\hinhanh10.jpg');

--BANG HOADON
CREATE TABLE HOADON
( 
  MaHD varchar2(10) NOT NULL,
  MaGiay varchar2(10),
  MaNV varchar2(10),
  NgayIn DATE DEFAULT SYSDATE ,
  CONSTRAINT PK_MaHD PRIMARY KEY (MaHD),
  CONSTRAINT FK_MaGiay_HOADON FOREIGN KEY (MaGiay) REFERENCES GIAY(MaGiay),
  CONSTRAINT FK_MaNV_HOADON FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)
);

Insert into HOADON (MAHD,MAGIAY,MANV,NGAYIN) values ('HD01','MG03','NV01',to_date('21-FEB-23','DD-MON-RR'));
Insert into HOADON (MAHD,MAGIAY,MANV,NGAYIN) values ('HD02','MG05','NV03',to_date('21-FEB-23','DD-MON-RR'));
Insert into HOADON (MAHD,MAGIAY,MANV,NGAYIN) values ('HD03','MG10','NV06',to_date('21-FEB-23','DD-MON-RR'));
Insert into HOADON (MAHD,MAGIAY,MANV,NGAYIN) values ('HD04','MG07','NV02',to_date('21-FEB-23','DD-MON-RR'));
Insert into HOADON (MAHD,MAGIAY,MANV,NGAYIN) values ('HD05','MG01','NV04',to_date('21-FEB-23','DD-MON-RR'));

--BANG CHITIETHOADON
CREATE TABLE CTHD      
( 
  MaHD varchar2(10) NOT NULL,
  MaGiay varchar2(10),
  MaNV varchar2(10),
  SL number,
  DonGia number,    
  CONSTRAINT PK_MaHD_MaGiay_MaNV PRIMARY KEY (MaHD,MaGiay,MaNV),
  CONSTRAINT FK_MaHD_CTHD FOREIGN KEY (MaHD) REFERENCES HOADON(MaHD),
  CONSTRAINT FK_MaGiay_CTHD FOREIGN KEY (MaGiay) REFERENCES GIAY(MaGiay),
  CONSTRAINT FK_MaNV_CTHD FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV)
);

Insert into CTHD (MAHD,MAGIAY,MANV,SL,DONGIA) values ('HD03','MG10','NV06',3,2010000);
Insert into CTHD (MAHD,MAGIAY,MANV,SL,DONGIA) values ('HD01','MG03','NV01',1,250000);
Insert into CTHD (MAHD,MAGIAY,MANV,SL,DONGIA) values ('HD05','MG01','NV04',2,1170000);
Insert into CTHD (MAHD,MAGIAY,MANV,SL,DONGIA) values ('HD02','MG05','NV03',1,895000);
Insert into CTHD (MAHD,MAGIAY,MANV,SL,DONGIA) values ('HD04','MG07','NV02',1,190000);

--BANG PHIEUNHAP
CREATE TABLE PHIEUNHAP
( 
  MaPN varchar2(10) NOT NULL,
  MaGiay varchar2(10),
  NgayNhap DATE DEFAULT SYSDATE ,    
  CONSTRAINT PK_MaPN PRIMARY KEY (MaPN),
  CONSTRAINT FK_MaGiay_PHIEUNHAP FOREIGN KEY (MaGiay) REFERENCES GIAY(MaGiay)
);

Insert into PHIEUNHAP (MAPN,MAGIAY,NGAYNHAP) values ('PN01','MG02',to_date('21-FEB-23','DD-MON-RR'));
Insert into PHIEUNHAP (MAPN,MAGIAY,NGAYNHAP) values ('PN02','MG05',to_date('21-FEB-23','DD-MON-RR'));
Insert into PHIEUNHAP (MAPN,MAGIAY,NGAYNHAP) values ('PN03','MG06',to_date('21-FEB-23','DD-MON-RR'));
Insert into PHIEUNHAP (MAPN,MAGIAY,NGAYNHAP) values ('PN04','MG03',to_date('21-FEB-23','DD-MON-RR'));
Insert into PHIEUNHAP (MAPN,MAGIAY,NGAYNHAP) values ('PN05','MG01',to_date('21-FEB-23','DD-MON-RR'));

--BANG CHITIETPHIEUNHAP
CREATE TABLE CTPN
( 
  MaPN varchar2(10),
  MaGiay varchar2(10),
  NgayNhap DATE,
  SL number,
  GiaNhap number,
  MaNSX varchar2(10),
  MaNCC varchar2(10),
  CONSTRAINT PK_MaPN_MaGiay PRIMARY KEY (MaPN,MaGiay),
  CONSTRAINT FK_MaPN_CTPN FOREIGN KEY (MaPN) REFERENCES PHIEUNHAP(MaPN),
  CONSTRAINT FK_MaGiay_CTPN FOREIGN KEY (MaGiay) REFERENCES GIAY(MaGiay),
  CONSTRAINT FK_MaNSX_CTPN FOREIGN KEY (MaNSX) REFERENCES NSX(MaNSX),
  CONSTRAINT FK_MaNCC_CTPN FOREIGN KEY (MaNCC) REFERENCES NCC(MaNCC)
);

Insert into CTPN (MAPN,MAGIAY,NGAYNHAP,SL,GIANHAP,MANSX,MANCC) values ('PN04','MG03',to_date('21-FEB-23','DD-MON-RR'),50,200000,'NSX01','NCC01');
Insert into CTPN (MAPN,MAGIAY,NGAYNHAP,SL,GIANHAP,MANSX,MANCC) values ('PN01','MG02',to_date('21-FEB-23','DD-MON-RR'),30,800000,'NSX01','NCC01');
Insert into CTPN (MAPN,MAGIAY,NGAYNHAP,SL,GIANHAP,MANSX,MANCC) values ('PN03','MG06',to_date('21-FEB-23','DD-MON-RR'),10,250000,'NSX05','NCC04');
Insert into CTPN (MAPN,MAGIAY,NGAYNHAP,SL,GIANHAP,MANSX,MANCC) values ('PN05','MG01',to_date('21-FEB-23','DD-MON-RR'),32,285000,'NSX01','NCC01');
Insert into CTPN (MAPN,MAGIAY,NGAYNHAP,SL,GIANHAP,MANSX,MANCC) values ('PN02','MG05',to_date('21-FEB-23','DD-MON-RR'),40,400000,'NSX02','NCC03');

--BANG NHANVIEN
Create TABLE NHANVIEN
( 
  MaNV varchar2(10) NOT NULL,
  TenID varchar2(20) ,
  TenNV varchar2(50),
  NgaySinh DATE,
  GioiTinh varchar2(4) CHECK (GIOITINH in('Nam','Nu')),
  DiaChi varchar2(60) DEFAULT 'Unknow.' ,
  Luong number CHECK(Luong > 0) ,
  CONSTRAINT PK_MaNV PRIMARY KEY (MaNV),
  constraint fk_id_TK foreign key (TenID) references TAIKHOAN(TenID)
);                                    

Insert into NHANVIEN (MANV,TENNV,NGAYSINH,GIOITINH,DIACHI,LUONG) values ('NV01','Nguyen Thi Nhu Y','11-10-97','Nu','Quan Tan Phu',7000000);
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,GIOITINH,DIACHI,LUONG) values ('NV02','Tran Trung Quan',to_date('15-JUL-00','DD-MON-RR'),'Nam','Quan 7',5000000);
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,GIOITINH,DIACHI,LUONG) values ('NV03','Dang Ngoc Hoang',to_date('08-FEB-02','DD-MON-RR'),'Nam','Quan 9',5000000);
Insert into NHANVIEN (MANV,TenID,TENNV,NGAYSINH,GIOITINH,DIACHI,LUONG) values ('NV04','user101','Le Thanh Nhu Ngoc','11-10-97','Nu','Quan 12',7000000);
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,GIOITINH,DIACHI,LUONG) values ('NV05','Do Nhat Anh',to_date('10-APR-01','DD-MON-RR'),'Nu','Quan 12',4000000);
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,GIOITINH,DIACHI,LUONG) values ('NV06','Duong Quoc Dai',to_date('29-MAY-98','DD-MON-RR'),'Nam','Quan Thu Duc',4000000);
Insert into NHANVIEN (MANV,TENNV,NGAYSINH,GIOITINH,DIACHI,LUONG) values ('NV07','Cao Tam Nhu',to_date('19-DEC-02'Tue Oct 10,'DD-MON-RR'),'Nu','Quan 7',5000000);

insert into NHANVIEN (MANV,TENNV,NGAYSINH,GIOITINH,DIACHI,LUONG) values('NV02','Lam Thi Nhu Y','11-10-97','Nu','Quan Tan Phu',7000000);
insert into TAIKHOAN (TENID,PASS) values('test','123')
select * from dba_users
select * from NHANVIEN
select * from TAIKHOAN
delete from NHANVIEN
delete from TAIKHOAN 
drop user 

--Tuan 7

--truy van, tim kiem, canh bao co su dung cac ham co san trong Oracle
--cac cau truc dieu khien ket hop vs procedure, function, package

--procedure tao nhom quyen (role)
create or replace procedure CreateRole
(namerole IN varchar2, pass IN varchar2)
is 
begin
  create role namerole [identified by pass]
end;

create or replace procedure getNameNV
(in_id in varchar2, nameNV out varchar2)
as
begin
  select TENNV into nameNV from NHANVIEN, TAIKHOAN where in_id = TAIKHOAN.TENID;
end;

--procedure select cac profile
create or replace procedure SelectProfile(name_profile out varchar2)
as
begin
  select profile into name_profile from dba_profiles group by profile;
end;


--procedure insert nhan vien
create or replace procedure "INSERT_NV"   
    (manv IN VARCHAR2, tennv IN VARCHAR2, ngaysinh in date, gioitinh IN VARCHAR2, diachi IN VARCHAR2)    
is   
begin   
     insert into USER1.NHANVIEN (MANV,TENNV,NGAYSINH,GIOITINH,DIACHI,LUONG,NGAYVAOLAM) 
     values(manv,tennv,ngaysinh,gioitinh,diachi,null, sysdate);
end;


declare ma varchar2(20) ;
ten varchar2(50);
ngaysinh date;
gioitinh varchar2(10);
diachi varchar2(50);
begin
INSERT_NV('NVt','Nguyen Tuu Tien','03-01-02','Nu','Binh Tan');
end;

create or replace procedure "InsertGiay"   
    (ma IN VARCHAR2, ten in varchar2)    
is   
begin   
     insert into GIAY values(ma,ten);    
end;

INSERT INTO GIAY VALUES
  ('MG01','Adidas'
  )
  INSERT INTO GIAY VALUES
  ('MG02','Nike'
  )
  INSERT INTO GIAY VALUES
  ('MG03','Vans'
  )
  INSERT INTO GIAY VALUES
  ('MG04','Shondo'
  )

--procedure tim kiem Giay voi ma giay truyen vao
create or replace procedure SEARCHGIAY
( ma in varchar2, ten out varchar2)
as
begin
  select TenGiay into ten from GIAY where MaGiay = ma;
  DBMS_OUTPUT.PUT_LINE(ten);
end;

declare TG varchar2(100);
begin
  SEARCHGIAY('MG02',TG);
end;
SET SERVEROUTPUT ON 
select * from TABLE1
--goi ham
begin
  insertuser('Dung');
end;
begin
  insertuser('Tien');
end;
begin
  insertuser('Ngoc');
end;
begin
  insertuser('Thi');
end;
begin
  InsertGiay('MG02','Nike');
  
end;


--tu dong tao nguoi dung moi vs profile mac dinh
create user user10 identified by 123 profile 
-- khi click button create user ma ko chon profile, thi tu dong lay
--ten de dat cho nameuser
-- dung trigger bat su kien khi insert nhan vien 


SELECT user FROM dual;
insert into TAIKHOAN (ID, Pass) values (tenid, passtk);


grant create session to user1;

grant select any table to user1;

--xem casc quyeefn heej thoong
SELECT * FROM user_sys_privs
--xem cac quyen doi tuong
SELECT * FROM user_tab_privs_recd;

GRANT SELECT ON TABLE3,update ON TABLE3 TO user1;
GRANT update ON TABLE3 TO user1;
grant Select on TABLE1 to USER1;
GRANT delete ON TABLE3 TO user1;

REVOKE SELECT ON TABLE3 FROM user1;
REVOKE update ON TABLE3 FROM user1;
REVOKE delete ON TABLE3 FROM user1;

--tao role
CREATE ROLE role_test
IDENTIFIED BY 123;
--xoa role
DROP ROLE myrole;
select * from dba_roles where oracle_maintained = 'N';


--cap quyen session cho toan bo user
GRANT CREATE SESSION TO PUBLIC;

--gan quyen cho role
GRANT SELECT ON TABLE1 TO role_test;
-- gan role cho user
GRANT testing TO user1;
--thu hoi role cho user
REVOKE myrole FROM lavender;




--them datafile moi vao tablespace
Alter tablespace test add datafile 'E:\test2.dbf' size 1 M

select username from dba_users where account_status = 'OPEN' and default_tablespace = 'USERS'
select last_login from user2.dba_users where username='USER2'

select name from v$tablespace

select * from user_tables
select table_name from all_tables 
select * from tab
select object_name from user_objects where object_type='TABLE'
select profile from dba_profiles group by profile

--tao profile voi cac tham so duoc chi dinh
CREATE PROFILE test4_profile LIMIT SESSIONS_PER_USER 2 CPU_PER_SESSION 10000 IDLE_TIME 60 CONNECT_TIME 480 FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 30;
 CREATE PROFILE test5 LIMIT SESSIONS_PER_USER 2 CPU_PER_SESSION 10000 IDLE_TIME 60 CONNECT_TIME 480 FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 30;
 

 
 alter PROFILE test6 LIMIT SESSIONS_PER_USER 10 CPU_PER_SESSION 10000 IDLE_TIME 60 CONNECT_TIME 480 FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 30;
 
 select username, profile from dba_users where username='USER1';
 
 --tao user voi tablespace mac dinh, profile va gan quyen
 CREATE USER user3 IDENTIFIED BY user3
DEFAULT TABLESPACE test
TEMPORARY TABLESPACE temp
QUOTA unlimited ON test
PROFILE test7;
grant CREATE SESSION to user7
grant insert table TABLE3 to user7
 
 create user user4 identified by user4 profile test6;
 drop user user4 cascade;
 DROP profile test5 CASCADE
 ALTER USER user3 PROFILE test6;
 select username, profile from dba_users where username='user1';
ALTER USER user1 PROFILE test6;
 
 
--tuan 4:
--Thiet lap ít nhat 4 policy trên các bang và các cot
--policy kiem tra insert tren bang nhan vien

create audit policy nhanvien_insert_policy
actions insert
evaluate per statement 
whenever successful;

audit policy nhanvien_insert_policy on NHANVIEN;

--su dung ky thuat VIRTUAL PRIVATE DATABASE (VPD) 
-- han che so dong cua bang NHANVIEN
CREATE OR REPLACE FUNCTION plc_vpd (oowner IN VARCHAR2, ojname IN VARCHAR2)
RETURN VARCHAR2 AS
  con VARCHAR2 (200);
BEGIN
  con := 'LUONG = 2000000';
  RETURN (con);
END plc_vpd;
/

-- Áp các policy cho b?ng NHANVIEN
BEGIN
  DBMS_RLS.ADD_POLICY (object_schema     => 'user1',
                       object_name       => 'NHANVIEN',
                       policy_name       => 'plc_nv',
                       function_schema   => 'user1',
                       policy_function   => 'plc_vpd',
                       sec_relevant_cols => 'GIOITINH,TENID');
END;
/
--huy policy cho bang NHANVIEN
BEGIN
  DBMS_RLS.DROP_POLICY (object_schema     => 'user1',
                        object_name       => 'NHANVIEN',
                        policy_name       => 'plc_nv');
END;
/
select * from NHANVIEN


--giay, han che so dong duoc hien thi 
--su dung ky thuat VIRTUAL PRIVATE DATABASE (VPD) 

CREATE OR REPLACE FUNCTION plc_vpd_Giay (oowner IN VARCHAR2, ojname IN VARCHAR2)
RETURN VARCHAR2 AS
  con VARCHAR2 (200);
BEGIN
  con := 'SLTON = 4';
  RETURN (con);
END plc_vpd_Giay;
/

-- Áp các policy cho b?ng GIAY
BEGIN
  DBMS_RLS.ADD_POLICY (object_schema     => 'user1',
                       object_name       => 'GIAY',
                       policy_name       => 'plc_giay',
                       function_schema   => 'user1',
                       policy_function   => 'plc_vpd_Giay',
                       sec_relevant_cols => 'MAGIAY,MANSX',
                       sec_relevant_cols_opt => DBMS_RLS.ALL_ROWS);
END;
/
--huy policy cho bang GIAY
BEGIN
  DBMS_RLS.DROP_POLICY (object_schema     => 'user1',
                        object_name       => 'GIAY',
                        policy_name       => 'plc_giay');
END;
/
select * from GIAY
select MAGIAY, TENGIAY, GIABAN from GIAY
select MAGIAY, TENGIAY, GIABAN, MANSX from GIAY


--xu?t báo cáo quá tr?nh audit d ? li?u c?a các policy có liên quan ð? thi?t l?p
 -- Truy v?n danh sách các policy ð? thi?t l?p
SELECT POLICY_NAME, ENABLED
FROM DBA_AUDIT_POLICIES;
select * from dba_audit_policies
-- Truy v?n thông tin v? c?t ðý?c audit trong các policy
SELECT POLICY_NAME, POLICY_COLUMN, OBJECT_SCHEMA, OBJECT_NAME
FROM DBA_AUDIT_POLICY_COLUMNS;

-- Truy v?n thông tin v? các ð?i tý?ng ðý?c audit trong các policy
SELECT POLICY_NAME, OBJECT_SCHEMA, OBJECT_NAME
FROM DBA_AUDIT_POLICIES;
select * from dba_audit_object
-- Truy v?n thông tin v? quá tr?nh audit d? li?u
SELECT TIMESTAMP, USERNAME, ACTION_NAME, SQL_TEXT
FROM DBA_AUDIT_TRAIL;
SELECT *
FROM DBA_AUDIT_TRAIL;

--Thi?t l?p audit liên quan ð?n m?t user nào ðó
noAUDIT ALL BY user1;
noAUDIT SELECT, INSERT BY user1;

--C?nh báo t? ð?ng khi có s? truy c?p ho?c thao tác quá m?c quy ð?nh v?i d? l?y ðý?c t? audit
noAUDIT SELECT, INSERT, UPDATE, DELETE ON NHANVIEN;
drop trigger check_insert_limit_nv
CREATE OR REPLACE TRIGGER check_insert_limit_nv
AFTER INSERT ON NHANVIEN
FOR EACH ROW
DECLARE
  row_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO row_count FROM NHANVIEN;

  IF row_count > 100 THEN
    -- G?i c?nh báo
    DBMS_OUTPUT.PUT_LINE('So luong dong vuot qua gioi han cho phep!');
    -- Ho?c s? d?ng công c? qu?n l? s? ki?n khác ð? g?i c?nh báo t? ð?ng
  END IF;
END;
/

select sum(MAGIAY) from HOADON where MAHD='HD01'

select * from GIAY
select * from NHANVIEN
select * from TAIKHOAN
delete from NHANVIEN
delete from TAIKHOAN
delete from TAIKHOAN_AUDIT
commit;
--Tuan 8
--trigger bat su kien them nhan vien, tu dong tao nguoi dung moi voi ten tai khoan tuong ung
--sys


  select * from dba_users
  insert into TAIKHOAN(TENID,PASS) values('nguye','123');
  Insert into NHANVIEN (MANV,TENNV,NGAYSINH,GIOITINH,DIACHI,LUONG) values ('NV01','Nguyen Thi Nhu Y','11-10-97','Nu','Quan Tan Phu',7000000);
  Insert into NHANVIEN (MANV,TENNV,NGAYSINH,GIOITINH,DIACHI,LUONG,NGAYVAOLAM) values ('NV02','Nguyen Thi Nhu Y','11-10-97','Nu','Quan Tan Phu',7000000,'11-11-20');
  select username from dba_users where upper(username) like 'NGUYE2';
  




  
  create user nguye identified by 123
  drop user NGUYE
--procedure insert tai khoan
create or replace procedure "INSERT_TK"   
    (tentk IN VARCHAR2, passtk IN VARCHAR2)    
is   
begin   
     insert into TAIKHOAN(TENID,PASS) values(tentk,passtk);    
end;
  
  select * from temp
  create user user09i identified by 123;
  
  
drop trigger BEFORE_INSERT_NV


--ngoc
create table TAIKHOAN_AUDIT
(
  ID varchar2(10) NOT NULL,
  PASS varchar2(60),
  Lenh varchar2(10),
  Thoigian date,
  nguoithuchien varchar2(50) 
);

  
Create or replace trigger ghiNhanDuLieu
after update or insert or delete on USER1.TAIKHOAN
  FOR EACH ROW
   Declare v_username varchar2(10);
   log_action varchar2(10);
  Begin
    Select user INTO v_username from dual;
    if INSERTING then
      log_action := 'Insert';
      Insert into USER1.TAIKHOAN_AUDIT(ID,PASS,Lenh,Thoigian,nguoithuchien) values (:new.TenID,:new.PASS,log_action,sysdate,v_username);
    elsif UPDATING then
      log_action := 'Update';
      Insert into USER1.TAIKHOAN_AUDIT(ID,PASS,Lenh,Thoigian,nguoithuchien) values (:new.TenID,:new.PASS,log_action,sysdate,v_username);
    elsif DELETING then
      log_action := 'Delete';
      Insert into USER1.TAIKHOAN_AUDIT(ID,PASS,Lenh,Thoigian,nguoithuchien) values (:old.TenID,:old.PASS,log_action,sysdate,v_username);
    else
     dbms_output.put_line('Khong phai update, insert, delete');
    end if;
    
  End;
  
delete from NHANVIEN
select * from NHANVIEN
insert into TAIKHOAN (TenID ,PASS) values('user11','123'); 
delete from temp where ten='Lam Thi Nhu Y'
delete from TAIKHOAN where TenID='user11'
ALTER SESSION SET NLS_DATE_FORMAT = 'mm/dd/yyyy';
select * from TAIKHOAN

from nls_database_parameters
select * from TAIKHOAN
select * from TAIKHOAN_AUDIT
delete from TAIKHOAN_AUDIT
select table_name from user_tables
SET SERVEROUTPUT ON 


--cursor ket hop ham, nam ben trong ham, chuc nang tim ten nhan vien thong qua ma nhan vien
CREATE OR REPLACE FUNCTION FindNameNV  
  ( name_id_in IN varchar2 )  
  RETURN varchar2  
IS 
   name_nv varchar2(30);  
CURSOR c1  
   IS 
     SELECT TENNV  
     FROM USER1.NHANVIEN
   WHERE MANV = name_id_in;
BEGIN 
OPEN c1;  
   FETCH c1 INTO name_nv;  
IF c1%notfound THEN 
      dbms_output.put_line('Tai khoan khong ton tai'); 
ELSE
      
      dbms_output.put_line(name_nv);
 END IF;  
CLOSE c1;  
RETURN name_nv;  
END;

--goi ham 
declare name_nv_search varchar2(30);
begin
name_nv_search := FindNameNV('NV02');
end;

select table_name from dba_tables where OWNER='USER1'

--function tien thuong khi lam tren 10 nam
CREATE OR REPLACE FUNCTION tangLuong(ngayvao IN date) 
RETURN NUMBER 
AS
  v_namlam int := 0;
BEGIN
  select TRUNC(MONTHS_BETWEEN(SYSDATE, ngayvao))/12 into v_namlam from dual;
  IF v_namlam > 9 THEN
    UPDATE USER1.NHANVIEN SET USER1.NHANVIEN.LUONG = USER1.NHANVIEN.LUONG + (USER1.NHANVIEN.LUONG * 0.1)
    WHERE USER1.NHANVIEN.NGAYVAOLAM = ngayvao;
  END IF;
  -- Tr? v? t?ng s? nhân viên ðý?c tãng lýõng
  RETURN SQL%ROWCOUNT;
END;

declare name_nv_search number;
begin
name_nv_search := tangLuong('03-01-2002');
dbms_output.put_line(name_nv_search);
end;


--cursor ngam dinh
--tãng lýõng thêm 1000 cho nhung nguoi co gioi tinh nu.
DECLARE
total_rows number(2);
BEGIN
UPDATE NHANVIEN
SET LUONG = LUONG + 1000
where GIOITINH = 'Nu';
IF sql%notfound THEN
    dbms_output.put_line('Khong co nhan vien nao la nu');
ELSIF sql%found THEN
    total_rows := sql%rowcount;
    dbms_output.put_line( total_rows || ' employees updated ');
END IF;
END;                  

--cursor co tham so
declare name_ncc varchar2(70);
  cursor c_cursor_thamso (mancc varchar2) is
    select TENNCC
    from NCC
    where MANCC = mancc;
  begin
    OPEN c_cursor_thamso ('NCC02');
    FETCH c_cursor_thamso INTO name_ncc;  
    IF c_cursor_thamso%notfound THEN 
      dbms_output.put_line('NCC khong ton tai'); 
    ELSE
      dbms_output.put_line(name_ncc);
    END IF;  
    CLOSE c_cursor_thamso;  
  end;


--cursor co for update
declare
cursor c_for_update is
select MANV, TENNV, NGAYSINH, GIOITINH, DIACHI, LUONG
from NHANVIEN
where (TRUNC(MONTHS_BETWEEN(SYSDATE, NGAYSINH))/12) > 25
for update of TENID, LUONG;
tmp_record c_for_update%ROWTYPE;
begin
  open c_for_update;
  fetch c_for_update into tmp_record;
  if c_for_update%notfound then
    dbms_output.put_line('Khong co nhan vien nao tren 25 tuoi!'); 
  ELSE
    --tmp_record.LUONG := tmp_record.LUONG + 12000;
    UPDATE NHANVIEN
    SET LUONG = LUONG + 12000
    WHERE tmp_record.GIOITINH = 'Nu';
    --dbms_output.put_line(tmp_record.LUONG); 
  END IF;  
  CLOSE c_for_update;
end;




--cursor co where current of: cho phep cap nhat hoac xoa hang hien tai
declare
cursor c_where_current_of is
select MANV, TENNV, NGAYSINH, GIOITINH, DIACHI
from NHANVIEN
for update of LUONG;
tmp_record c_where_current_of%ROWTYPE;
tmp_luong number(10,2);
begin
  for tmp_record in c_where_current_of LOOP
    if (TRUNC(MONTHS_BETWEEN(SYSDATE, tmp_record.NGAYSINH))/12) < 25 then
      tmp_luong := 240000;
    elsif (TRUNC(MONTHS_BETWEEN(SYSDATE, tmp_record.NGAYSINH))/12) < 30 then
      tmp_luong := 340000;
    else
      tmp_luong := 540000;
    end if;
    update NHANVIEN set LUONG = LUONG + tmp_luong where current of c_where_current_of;
  end loop;
end;

--cac loai trigger
--instead of: thay vi insert truc tiep
--tao bang view vw_nhanvien_taikhoan
create or replace view vw_nhanvien_taikhoan as
  select MANV, TENNV, NGAYSINH, GIOITINH, DIACHI, LUONG, TENID, PASS
  from TAIKHOAN
  INNER JOIN NHANVIEN USING (TENID);
  
INSERT INTO vw_nhanvien_taikhoan(MANV, TENNV, NGAYSINH, GIOITINH,DIACHI,LUONG,TENID, PASS)
values('NV90','Nguyen Thi Kim Dung', '19-09-2002','Nu','Tan Phu',20000,'test_trigger', '123');

create or replace trigger new_nhanvien_taikhoan
  instead of insert on vw_nhanvien_taikhoan
  for each row
declare matk_id varchar2(50);
begin
  insert into TAIKHOAN(TENID, PASS) values(:NEW.TENID, :NEW.PASS) returning TENID into matk_id;
  
  insert into NHANVIEN(MANV, TENID, TENNV, NGAYSINH, GIOITINH,DIACHI,LUONG)
  values(:NEW.MANV, matk_id, :NEW.TENNV, :NEW.NGAYSINH, :NEW.GIOITINH, :NEW.DIACHI, :NEW.LUONG);
end;


--compound
create or replace trigger check_luong
  for insert or update of LUONG
  on NHANVIEN
  COMPOUND TRIGGER
  
  
  
  


--thi: cac ham co san
--T?m lýõng cao nh?t 
 SELECT MAX(LUONG) FROM NHANVIEN;
--Thay th? m?t k? t? trong chu?i
SELECT REPLACE('Giày Th? Thao Tr? Em Hunter Junior - Dune OTP Real White edition HSG000100TRG (Tr?ng)', 'Tr?ng', 'Ðen') AS chuoithaythe FROM dual;
--Tính tu?i ð? ð? tu?i hay chýa (C?nh báo) 
SELECT TENNV,
    CASE 
        WHEN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM NGAYSINH) > 18 THEN 'Ð? ð? tu?i'
        ELSE 'Chýa ð? tu?i'
    END AS TINHTRANGTUOI
FROM NHANVIEN;
--Truy v?n thông tin c?a nhân viên kèm theo lýõng c?a nhân viên k? ti?p
SELECT TENNV, LUONG, LEAD(LUONG) OVER (ORDER BY LUONG) AS LUONGNHANVIENKETIEP
FROM NHANVIEN;

--ngoc: procedure, function, package
CREATE OR REPLACE PROCEDURE check_salary (employee_id IN NUMBER) IS
   salary employees.salary%TYPE;
BEGIN
   -- Get the salary of the employee
   SELECT salary INTO salary FROM employees WHERE employee_id = employee_id;

   -- Check if the salary is above a certain threshold
   IF salary > 5000 THEN
      DBMS_OUTPUT.PUT_LINE('The employee has a high salary.');
   ELSE
      DBMS_OUTPUT.PUT_LINE('The employee has an average salary.');
   END IF;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Employee not found.');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred.');
END;
--1
create or replace 
PROCEDURE nv_luongthap(v_manv OUT NHANVIEN.MANV%TYPE, v_tennv OUT NHANVIEN.TENNV%TYPE)
AS
  CURSOR c_nv IS
    SELECT MANV, TENNV
    FROM NHANVIEN 
    WHERE LUONG = (SELECT MIN(LUONG) FROM NHANVIEN);
BEGIN
  FOR r_nv IN c_nv LOOP
    v_manv := r_nv.MANV;
    v_tennv := r_nv.TENNV;
    dbms_output.put_line('M? NV: ' || v_manv || ' Tên NV: ' || v_tennv);
  END LOOP;
END;
--2
create or replace 
procedure add_ncc (v_mancc NCC.MANCC%type, v_tenncc NCC.TENNCC%TYPE)
as 
v_mancc_temp NCC.MANCC%type;
v_loi Exception;
begin
  select MANCC into v_mancc_temp
  from NCC
  where MANCC=v_mancc;
  if v_mancc_temp is not null then
      raise v_loi;
  end if;
  exception when v_loi then
    dbms_output.put_line ('Khong them duoc');
    when no_data_found then
    insert into NCC(MANCC, TENNCC) values (v_mancc, v_tenncc);
      dbms_output.put_line ('Nha cung cap' || v_tenncc || 'da duoc them');
end;

--thi: package
CREATE OR REPLACE PACKAGE nv_package AS
  PROCEDURE nv_luongthap(v_manv OUT NHANVIEN.MANV%TYPE, v_tennv OUT NHANVIEN.TENNV%TYPE);
  FUNCTION FindNameNV(name_id_in IN varchar2) RETURN varchar2;
END nv_package;

CREATE OR REPLACE PACKAGE BODY nv_package AS
  PROCEDURE nv_luongthap(v_manv OUT NHANVIEN.MANV%TYPE, v_tennv OUT NHANVIEN.TENNV%TYPE)
  AS
    CURSOR c_nv IS
      SELECT MANV, TENNV
      FROM NHANVIEN 
      WHERE LUONG = (SELECT MIN(LUONG) FROM NHANVIEN);
  BEGIN
    FOR r_nv IN c_nv LOOP
      v_manv := r_nv.MANV;
      v_tennv := r_nv.TENNV;
      dbms_output.put_line('M? NV: ' || v_manv || ' Tên NV: ' || v_tennv);
    END LOOP;
  END;

  FUNCTION FindNameNV(name_id_in IN varchar2) RETURN varchar2
  IS 
    name_nv varchar2(30);  
    CURSOR c1  
      IS 
        SELECT TENNV  
        FROM NHANVIEN
        WHERE MANV = name_id_in;
  BEGIN 
    OPEN c1;  
    FETCH c1 INTO name_nv;  
    IF c1%notfound THEN 
      dbms_output.put_line('Tài kho?n không t?n t?i'); 
    ELSE
      dbms_output.put_line(name_nv);
    END IF;  
    CLOSE c1;  
    RETURN name_nv;  
  END;
END nv_package;




--tuan 9
--Cài ð?t các giao tác ð? phân tích trong b?ng mô t?, có s? d?ng các m?c cô l?p phù h?p v?i giao tác
--giao tac 1
DECLARE
   -- L?y thông tin s? lý?ng t?n hi?n t?i c?a giày
   giay_slton NUMBER;
BEGIN
   -- B?t ð?u giao d?ch
   SAVEPOINT start_transaction;

   SELECT SLTON INTO giay_slton FROM GIAY WHERE MAGIAY = 'MG01';

   -- Ki?m tra s? lý?ng t?n có ð? ð? bán hay không
   IF giay_slton >= 1 THEN
      -- N?u ð? s? lý?ng, th?c hi?n vi?c tr? s? lý?ng t?n và c?p nh?t s? lý?ng ð? bán
      UPDATE GIAY SET SLTON = SLTON - 1 WHERE MAGIAY = 'MG01';

      UPDATE CTHD SET SL = SL + 1 WHERE CTHD.MAGIAY = 'MG01' AND CTHD.MAHD = 'HD01';

      -- Hoàn t?t giao d?ch n?u không có l?i x?y ra
      COMMIT;
   ELSE
      -- N?u không ð? s? lý?ng t?n, hoàn tác ð?n ði?m lýu trý?c ðó
      ROLLBACK TO start_transaction;
   END IF;
END;


--giao tac 2
DECLARE
nsx_ma VARCHAR2(10);
count_nsx INTEGER;
BEGIN
-- B?t ð?u giao tác
SAVEPOINT start_transaction;

-- L?y thông tin nh?p vào v? m? nhà s?n xu?t
nsx_ma := 'NSX10';

-- Ki?m tra xem m? nhà s?n xu?t ð? t?n t?i trong b?ng nhà s?n xu?t chýa
SELECT COUNT(*) INTO count_nsx FROM NSX WHERE MANSX = nsx_ma;
IF count_nsx = 0 THEN
-- N?u chýa, thêm m?i thông tin nhà s?n xu?t vào b?ng nhà s?n xu?t
INSERT INTO NSX(MANSX, TENNSX) VALUES(nsx_ma, 'Autry shoes');
END IF;

-- Thêm thông tin ðôi giày m?i vào b?ng giày, kèm theo thông tin v? m? nhà s?n xu?t c?a giày ðó
INSERT INTO GIAY(MAGIAY, TENGIAY, GIABAN, SLTON, MANSX) VALUES('MG11', 'AUTRY ACTION SHOES MEDALIST MID',3000000, 5, nsx_ma);

-- Hoàn t?t giao tác n?u không có l?i x?y ra
COMMIT;
EXCEPTION
-- Hoàn tác ð?n ði?m trý?c ðó n?u có l?i x?y ra
WHEN OTHERS THEN
ROLLBACK TO start_transaction;
RAISE;
END;



--lock du lieu
select * from NCC for update nowait

--Thi?t k? ch?c nãng t?m ki?m session, user ðang block d? li?u;
select SID,SERIAL#, USERNAME from v$session where SID in (blocking_session);



--ch?c nãng ch?n l?a và xóa các session nào ðang block d? li?u
alter system kill session ',';


--Áp d?ng mô h?nh b?o m?t cõ s? d? li?u, ch?n m?t trong 2 k? thu?t trong ð? án: o S? d?ng VPD (Virtual Private Database)


commit;



