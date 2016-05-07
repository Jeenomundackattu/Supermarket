use master
go

--�½����ݿ�(CSGL)
if exists(select * from sysdatabases where name ='CSGL')
	drop database CSGL
go
create database CSGL
on
(
	name='CSGL',
	filename='D:\S2\��Ŀ�ĵ�\database\CSGL.mdf',
	size=3mb,
	filegrowth=1mb
)
log on
(
	name='CSGL_log',
	filename='D:\S2\��Ŀ�ĵ�\database\CSGL_log.ldg',
	size=1mb,
	filegrowth=10%
)
go


--�½���
--��Ʒ��������(SP_type)
use CSGL
go
if exists(select * from sysobjects where name='SP_type')
	drop table SP_type
go
create table SP_type
(
	SP_tId int primary key not null identity(1,1),	--��Ʒ�������
	SP_tName varchar(10) not null,					--��Ʒ�������
	SP_tNid int not null							--�����
)
go
insert  SP_type(SP_tName,SP_tNid) values('�������',0)
insert  SP_type(SP_tName,SP_tNid) values('����',1)
insert  SP_type(SP_tName,SP_tNid) values('�׾�',2)
insert  SP_type(SP_tName,SP_tNid) values('ơ��',2)
insert  SP_type(SP_tName,SP_tNid) values('ʳƷ��',1)
insert  SP_type(SP_tName,SP_tNid) values('������',1)

select * from sp_type


--��λ(Dwei)
if exists(select * from sysobjects where name='Dwei')
	drop table Dwei
go
create table Dwei
(
	D_Id int identity(1,1) primary key not null,		
	D_Name varchar(6) not null
)
go
insert into dwei
select 'ƿ' union
select '��' union
select '̨' 
select * from Dwei
select KH_xId, KH_xName, KH_xlianxiren, KH_xDianhua, KH_xDizhi,KH_xMoney from KH_xinxi , (KH_xName like '%��%')


--��ɫ(Yshe)
if exists(select * from sysobjects where name='Yshe')
	drop table Yshe
go
create table Yshe
(
	Y_Id int primary key identity(1,1) not null,	--��ɫ����
	Y_Name	varchar(10) not null					--��ɫ����
)
go
insert Yshe(Y_Name) values('��')
insert Yshe(Y_Name) values('��')
insert Yshe(Y_Name) values('��')

select * from Yshe




--�ֿ��(CK_table)
if exists(select * from sysobjects where name='CK_table')
	drop table CK_table
go
create table CK_table
(
	CK_tID int primary key identity(1,1) not null,	--�ֿ�����
	CK_tName varchar(10) not null,					--�ֿ�����
	CK_tfuzren varchar(10) not null,				--������
	CK_tDianhua varchar(12) null,					--�绰
	CK_tDizhi varchar(20) null,						--��ַ
	CK_tBeizhu varchar(100) null,					--��ע
	CK_tMoren int check( CK_tMoren in(0,1)) default(0),	--Ĭ�ϲֿ�
	CK_tPOS int check( CK_tPOS in(0,1)) default(0),		--�Ƿ�ΪPOS�ֿ�
)
go
insert CK_table (CK_tName, CK_tfuzren, CK_tDianhua, CK_tDizhi, CK_tBeizhu, CK_tMoren, CK_tPOS)
values('���ֿ�','С��','34343422','aaaaaa','aaasasa',1,1)
insert CK_table (CK_tName, CK_tfuzren, CK_tDianhua, CK_tDizhi, CK_tBeizhu, CK_tMoren, CK_tPOS)
values('���Ͽ�','С��','34343422','sssss','dddddd',0,0)
insert CK_table (CK_tName, CK_tfuzren, CK_tDianhua, CK_tDizhi, CK_tBeizhu, CK_tMoren, CK_tPOS)
values('ʳƷ��','С��','34343422','sssss','dddddd',0,0)
insert CK_table (CK_tName, CK_tfuzren, CK_tDianhua, CK_tDizhi, CK_tBeizhu, CK_tMoren, CK_tPOS)
values('�ٻ���','С��','34343422','sssss','dddddd',0,0)

select * from CK_table

select SP_gTiaoma,SP_gName,SP_gKucuen,SP_gJijie,SP_gJijie  as SP_gJijieCmoney,SP_gXijie,(SP_gKucuen*SP_gXijie) as Allmoney , SP_gDanweiid , SP_gXinghao,Y_Name,SP_gSchang,SP_gBeizhi,SP_tName,CK_tName 
from SP_goods,Yshe,SP_type,CK_table 
where SP_goods.SP_gYid=Yshe.Y_Id and SP_goods.SP_tId=SP_type.SP_tId and SP_goods.CK_tID=CK_table.CK_tID

select SP_gTiaoma,SP_gName,SP_gKucuen,SP_gJijie,SP_gJijie  as SP_gJijieCmoney,SP_gXijie,(SP_gKucuen*SP_gXijie) as Allmoney , SP_gDanweiid , SP_gXinghao,Y_Name,SP_gSchang,SP_gBeizhi,SP_tName,CK_tName 
from SP_goods,Yshe,SP_type,CK_table 
where  SP_goods.SP_gYid=Yshe.Y_Id and SP_goods.SP_tId=SP_type.SP_tId and SP_goods.CK_tID=CK_table.CK_tID
--��Ʒ��(SP_goods)
if exists(select * from sysobjects where name='SP_goods')
	drop table SP_goods
go
create table SP_goods
(
	SP_gId int identity(1,1) primary key not null,					--����
	SP_gName varchar(10) not null,									--��Ʒ����
	SP_gTiaoma varchar(20) not null,								--��Ʒ���
	SP_gXinghao varchar(10) not null,								--��Ʒ�ͺ�	
	SP_gDanweiid varchar(10) not null,								--��Ʒ��λ
	SP_gType int references SP_type(SP_tId) not null,				--��Ʒ�������
	SP_gYid int references Yshe(Y_Id) not null,						--��Ʒ��ɫ���
	SP_gJijie money not null,										--��Ʒ����
	SP_gXijie money not null,										--��Ʒ�ۼ�
	SP_gRiqi int  null,												--��Ʒ������
	SP_gSchang varchar(50) null,									--��������
	SP_gBeizhi varchar(100) null,									--��ע
	SP_gZhekou numeric(5,1) not null,								--��Ʒ�ۿ�
	SP_gZengping int not null check(SP_gZengping in(0,1)) default(0),--�Ƿ�Ϊ��Ʒ
	SP_gJifen int null,												--��Ʒ����
	SP_gTejia int not null check(SP_gTejia in(0,1)) default(0),		--�Ƿ�Ϊ�ؼ���Ʒ
	SP_gTjjiage money null,											--�ؼۼ۸�
	SP_gHueiyuan money  null,										--��Ա�۸�
	SP_gQiantime datetime null,										--��Ա����ʼ����
	SP_gHoutime datetime null,										--��Ա�۽�������
	SP_gKucuen int not null,										--�������
	SP_gZhuangtai int not null check(SP_gZhuangtai in(0,1)) default(0),--�Ƿ����
	SP_gKucuenx int null  default(0),								--��Ϳ��
	SP_tId int not null references SP_type(SP_tId),					--��Ʒ������
	CK_tID int not null references CK_table(CK_tID)					--�ֿ������
)
go
insert into SP_goods
select 'aaaa','s00001','��','ssssss',2,1,3,4,60,'dddddddd','sdgfsdfd',0.8,1,11,1,3.5,3.4,'2007-09-08','2009-09-08',100,1,1,3,1 union
select 'bbbb','s00002','��','zzzzzz',3,2,31,41,110,'fffffff','setgdsggsd',0.3,0,333,0,40,35,'2009-05-08','2009-11-08',222,0,10,4,2 union
select 'aaaa','s00003','С','sxxxxx',2,1,22,33,20,'hhhhhhhhh','dsggtewte',0.5,1,99,1,30,28,'2005-09-07','2009-03-08',190,1,10,3,2 union
select 'aaaa','s00004','��','cccccc',3,3,44,55,90,'yyyyyyy','ukujhykjhk',0.8,0,555,0,50,49,'2003-02-01','2009-09-08',600,0,10,4,1 

select SP_gTiaoma,SP_gName,SP_gDanweiid,SP_gKucuen,(SP_gJijie*SP_gKucuen) as zje,SP_gXinghao,Y_Name,SP_tName
from SP_goods,Yshe,SP_type
where SP_gYid=Y_Id and SP_goods.SP_tId=SP_type.SP_tId

select SP_gKucuen,(SP_gJijie*SP_gKucuen) as zje
from SP_goods

select XS_tDanhao,XS_tTime,GH_sName,CK_tName,DH_tYmoney,DH_tSmoney,(DH_tYmoney-DH_tSmoney) as qiankuan,XS_tType,XS_tYanshi,YG_xName,XS_tBeizhu from XS_tbale,YG_xinxi,CK_table,GH_shang where XS_tKHname=GH_sId and XS_tCK=CK_tID and XS_tJinbanren=YG_xId and XS_tType='�ɹ�' and XS_tTime>'2010-01-01 00:00:00' and XS_tTime<'2010-01-23 08:27:58' and (XS_tDanhao like '%��ʦ������%' or GH_sName like '%��ʦ������%')

select SP_tName,SP_gKucuen,(SP_gJijie*SP_gKucuen) as zje
from SP_goods,SP_type
where SP_goods.SP_tId=SP_type.SP_tId

select SP_gTiaoma,SP_gName,SP_gDanweiid,DH_tShuliang,SP_gKucuen,DH_tZongjine,SP_gXinghao,Y_Name,SP_gSchang,SP_gBeizhi
from SP_goods,DH_tabel,Yshe
where SP_gTiaoma=DH_tshangpID and SP_gYid=Y_Id and DH_tDanhao='CJ201001120002'

select SP_gTiaoma,SP_gName,SP_gDanweiid,SP_gKucuen,(SP_gKucuen*SP_gJijie) as zje,SP_gXinghao,Y_Name,SP_gSchang,SP_gBeizhi
from SP_goods,Yshe
where SP_gYid=Y_Id


select * from SP_goods
update SP_goods set SP_gKucuen=(SP_gKucuen-'1') where SP_gTiaoma='s00004'
update SP_goods set SP_gKucuen=(SP_gKucuen+'1') where SP_gTiaoma='s00004'
--��Ʒ��洢����
if exists (select * from sysobjects where name='proc_goods')
	drop proc proc_goods
go
create proc proc_goods
@SP_gName varchar(10),
@SP_gTiaoma varchar(20),
@SP_gXinghao varchar(10),
@SP_gDanweiid varchar(10),
@SP_gType int,
@SP_gYid int,
@SP_gJijie money,
@SP_gXijie money,
@SP_gRiqi int,
@SP_gSchang varchar(50),
@SP_gBeizhi varchar(100),
@SP_gZhekou numeric(5,1),
@SP_gZengping int,
@SP_gJifen int,
@SP_gTejia int,
@SP_gTjjiage money,
@SP_gHueiyuan money,
@SP_gQiantime datetime,
@SP_gHoutime datetime,
@SP_gKucuen int,
@SP_gZhuangtai int,
@SP_gKucuenx int,
@CK_tID int,
@SP_tId int

as
insert SP_goods(SP_gName, SP_gTiaoma, SP_gXinghao, SP_gDanweiid, SP_gType, SP_gYid, SP_gJijie, SP_gXijie, SP_gRiqi, SP_gSchang, SP_gBeizhi, SP_gZhekou, SP_gZengping, SP_gJifen, SP_gTejia, SP_gTjjiage, SP_gHueiyuan, SP_gQiantime, SP_gHoutime, SP_gKucuen, SP_gZhuangtai, SP_gKucuenx,CK_tID ,SP_tId)
values( @SP_gName, @SP_gTiaoma, @SP_gXinghao, @SP_gDanweiid, @SP_gType, @SP_gYid, @SP_gJijie, @SP_gXijie, @SP_gRiqi, @SP_gSchang, @SP_gBeizhi, @SP_gZhekou, @SP_gZengping, @SP_gJifen, @SP_gTejia, @SP_gTjjiage, @SP_gHueiyuan, @SP_gQiantime, @SP_gHoutime, @SP_gKucuen, @SP_gZhuangtai, @SP_gKucuenx,@CK_tID,@SP_tId)
go



---��Ա�����MEMLEVEL
if exists(select * from sysobjects where name='MEMLEVEL')
	drop table MEMLEVEL
go
CREATE TABLE MEMLEVEL(                                     ---------------------------
MEMLEVEL_NAME varchar(10)  NOT NULL check(MEMLEVEL_NAME in('�߼���Ա','��ͨ��Ա','�м���Ա')), --��������
MHY_Jibei  int identity(1,1) primary key ,  --������
MEMLEVEL_DISCOUNT decimal(1,1) ,   --�����ۿ�
MEMLEVEL_LOWSCORE  decimal(7,2),   --��������
MEMLEVEL_HIGHSCORE  decimal(7,2),   --��������
)
insert into MEMLEVEL
select '�߼���Ա',0.5,500,1000 union
select  '��ͨ��Ա',0.8,100,500 union
select  '�м���Ա',0.9,0,100 
select * from memlevel


--��Ա�����(HY_guanli)
if exists(select * from sysobjects where name='HY_guanli')
	drop table HY_guanli
go

create table HY_guanli
(
	HY_Id int primary key identity(1,1) not null,		--����
	HY_Jibei int not null references MEMLEVEL(MHY_Jibei),--check(HY_Jibei in('�߼���Ա','��ͨ��Ա','�м���Ա'))
	HY_ACOUNT money not null,							--�˻����
	HY_ALLCOST money not null,							--�����Ѷ�
	HY_COSTNUM  int not null,							--���Ѵ���
	HY_Name varchar(10) not null,						--��Ա����
	HY_Password varchar(16) not null,					--��Ա����
	HY_Shengri datetime not null,						--��Ա����
	HY_Jifen int not null,								--��Ա����
	HY_Dianhua varchar(12) null,						--��Ա�绰
	HY_Jiarutime datetime not null,						--��Ա��������
	HY_Daoqitime datetime  null,						--��Ա��������
	HY_Zhuangtai int check(HY_Zhuangtai in(0,1)) default(0) not null,	--��Ա״̬
	HY_Shengji	int check(HY_Shengji in(0,1)) default(0) not null,		--��Ա����
	HY_SYQX varchar(2) not null,						--ʹ������	
	HY_Beizhu varchar(100) null							--��Ա��ע
)	
go
insert into HY_guanli
select 1,1111,10000,3,'С��','aaaa','1989-07-23',500,'1111111','2008-08-08','',1,1,'��','aaaaaaa' union
select 2,2222,32434,4,'С��','bbbb','1990-03-03',50,'333333','2002-09-04','2009-09-07',0,0,'��','ssssss' union
select 2,3333,4324,1,'С��','cccc','1985-02-23',100,'1666666','2005-03-01','',1,0,'��','rrrrrrr' union
select 3,5555,34545,6,'С��','dddd','1998-01-21',200,'999999','2007-01-08','2008-07-03',0,1,'��','yyyyyyy' 

select * from HY_guanli




--��Ա��ϸ��(HY_mingxi)
if exists(select * from sysobjects where name='HY_mingxi')
	drop table HY_mingxi
go
create table HY_mingxi
(
	HY_mID int primary key identity(1,1) not null,			--����
	HY_mdanhao varchar(15) not null,						--���۵���
	HY_id	int references HY_guanli(HY_Id) not null,		--��Ա������	
	HY_mTime datetime  null,								--��������
	HY_mXmoney money default(0) null,						--���۽��
	HY_mSavecard money default(0) null,						--���
	HY_mMoney money default(0) null,						--�ֽ�
	HY_mBankcard money default(0) null,						--���п�
	HY_mDaijinjuan money default(0) null,					--�����
	HY_mBjifen int not null,								--���λ���
	HY_mJfmoney money null default(0),						--�������
	HY_mCaozuo int not null,								--����Ա���
	HY_mBeizhu varchar(100) null							--��ע
	
)
go
insert into HY_mingxi
select 'h0001',1,'2008-09-07',222,111,100,10000,400,9,300,1,'aaaaaaa' union
select 'h0002',2,'2009-04-07',444,222,500,50000,200,3,100,2,'ddddddd' union
select 'h0003',3,'2006-06-03',333,777,400,60000,100,6,900,3,'yyyyyyy' union
select 'h0004',4,'2008-09-07',888,555,200,20000,400,1,400,4,'uuuuuuu' 

select * from HY_mingxi




--��Ʒ������ϸ��(SP_xmingxi)
if exists(select * from sysobjects where name='SP_xmingxi')
	drop table SP_xmingxi
go
create table SP_xmingxi
(
	SP_xID int not null primary key identity(1,1),	--����
	SP_xType int not null references HY_guanli(HY_Id),	--�˿ͷ������
	SP_xName int not null references SP_goods(SP_gId),	--��Ʒ�������
	SP_xDmoney money not null,							--��Ʒ����
	SP_xSzhekou decimal(7,2) not null,					--��Ʒ�ۿ�
	SP_xGzhekou decimal(7,2) not null,					--�˿��ۿ�
	SP_xDzhekou decimal(7,2) not null,					--�����ۿ�
	SP_xZzhekou decimal(7,2) not null,					--�����ۿ�
	SP_xTejia char(2) not null,							--�ؼ���Ʒ
	SP_xGtejia money not null,							--�˿��ؼ�
	SP_xZdanjia money not null							--���յ���
	
)
go
insert into SP_xmingxi
select 1,1,22,0.9,0.89,0.89,0.85,'��',20,19 union
select 2,2,60,0.8,0.76,0.78,0.76,'��',50,45 union
select 3,3,100,0.95,0.89,0.91,0.90,'��',90,80 union
select 1,4,200,0.7,0.68,0.67,0.66,'��',180,160 

select * from SP_xmingxi




--����Ա��(CZ_Yuangong)
if exists(select * from sysobjects where name='CZ_Yuangong')
	drop table CZ_Yuangong
go
create table CZ_Yuangong
(
	CZ_yId int primary key identity(1,1) not null,
	CZ_yName varchar(10) not null,
	CZ_yZhiwei varchar(10) not null,
	CZ_yPOS int check( CZ_yPOS in(0,1)) default(0),
	CZ_yPossword varchar(16) null 
	
)
go
insert into cz_yuangong
select 'С��','����',1,'1111111' union
select 'С΢','Ա��',0,'2222222' union
select 'С��','����',1,'3333333' union
select 'С��','Ա��',0,'44444444' union
select 'С��','Ա��',1,'55555555' 
select * from CZ_Yuangong
insert cz_yuangong(CZ_yName, CZ_yZhiwei, CZ_yPOS, CZ_yPossword) values('Admin','��������Ա',0,'')


insert into cz_yuangong
select 'С��','����',1,'1111111' union
select 'С΢','Ա��',0,'2222222' union
select 'С��','����',1,'3333333' union
select 'С��','Ա��',0,'44444444' union
select 'С��','Ա��',1,'55555555' 

update cz_yuangong set CZ_yZhiwei='��������Ա' where cz_yid=2
update cz_yuangong set CZ_yZhiwei='����Ա' where cz_yid=3
update cz_yuangong set CZ_yZhiwei='����Ա' where cz_yid=4
update cz_yuangong set CZ_yZhiwei='����Ա' where cz_yid=5
update cz_yuangong set CZ_yZhiwei='����Ա' where cz_yid=6 

select * from CZ_Yuangong




--�����û���
create table [User]
(
	uID int not null primary key identity(1, 1),
	uLoginName varchar(20) not null,
	uLoginPwd varchar(20) not null,
	uRID int
)

go

--������ɫ��
create table [Role]
(
	rID int not null primary key identity(1, 1),
	rName varchar(20) not null
)

go

--����Ȩ�ޱ�
create table [Grant]
(
	gId int not null primary key identity(1, 1),
	gName varchar(20) not null,
	gPID int not null,
	gFormName varchar(50) not null
)
go

--������ɫȨ�ޱ�
create table RoleGrant
(
	rgID int not null primary key identity(1, 1),
	rgRID int not null,
	rgGID int not null
)

go

--�����������ϵ
alter table [User]
	add constraint FK_uRID foreign key(uRID) references [Role](rID)

alter table RoleGrant
	add constraint FK_rgRID foreign key(rgRID) references [Role](rID)

alter table RoleGrant
	add constraint FK_rgGID foreign key(rgGID) references [Grant](gId)

go

--��ӽ�ɫ���û�
insert into [Role]
values('��������Ա')

insert into [User]
values('admin', 'admin', @@identity)

insert into [Role]
values('����Ա')

insert into [User]
values('tiger', 'tiger', @@identity)

insert into [Role]
values('����Ա')

insert into [User]
values('lion', 'lion', @@identity)

go

--���Ȩ����Ŀ
insert into [Grant]
values('��������', 0, '')

go

insert into [Grant]
values('���۹���', 0, '')

go

insert into [Grant]
values('������', 0, '')

go

insert into [Grant]
values('ϵͳ����', 0, '')

go

insert into [Grant]
values('�ɹ�����', 1, 'PopeTest.FrmCGJH')

go

insert into [Grant]
values('�ɹ��˻�', 1, 'PopeTest.FrmCGTH')

go

insert into [Grant]
values('�ɹ����ݲ�ѯ', 1, 'PopeTest.FrmCGDJCX')

go

insert into [Grant]
values('��ɫ����', 4, 'PopeTest.FrmJSGL')

go

insert into [Grant]
values('�û�����', 4, 'PopeTest.FrmYHGL')

go

insert into [Grant]
values('Ȩ�޹���', 4, 'PopeTest.FrmQXGL')

go

insert into [Grant]
values('��ɫȨ�޹���', 4, 'PopeTest.FrmJSQXGL')

go

--��ӽ�ɫȨ����Ŀ
insert into RoleGrant
select 1, gid from [Grant]

go

select * from [Grant]
select * from RoleGrant







--�����̱�(GH_shang)
if exists(select * from sysobjects where name='GH_shang')
	drop table GH_shang
go
create table GH_shang
(
	GH_sId int primary key identity(1,1) not null,	--����
	GH_sName varchar(20) not null,					--����������
	GH_sLianxiren varchar(10) not null,				--��������ϵ��
	GH_sDianhua varchar(12) null,					--�����̵绰
	GH_sDizhi varchar(50) null,						--�����̵�ַ
	GH_sBeizhu varchar(100) null,					--��ע
	GH_sMoney money null,							--����Ӧ�����
	GH_sMoren int check( GH_sMoren in(0,1)) default(0),	--Ĭ�Ϲ�����
)
go
insert into gh_shang
select '����˾','С��','111111111','dslfdlsfdslk','wegfsdgidsiogjfo','10000000',1 union
select '�����촬��','����','22222222','erggrrfgfdg','ykjytktkymukm','5000000',0 union
select '������˾','С��','3333333','rfgtregytre','ytikkyulyulhkuh','600000000',1 union
select '���繫˾','С��','55555555','rehytrhrthrt','uoiyulkuyyu','4000000',0 
select * from GH_shang



--�ͻ���Ϣ��(KH_xinxi)
if exists(select * from sysobjects where name='KH_xinxi')
	drop table KH_xinxi
go
create table KH_xinxi
(
	KH_xId int primary key identity(1,1) not null,	--�������
	KH_xName varchar(20) not null,					--�ͻ�����
	KH_xlianxiren varchar(10) not null,				--��ϵ��
	KH_xDianhua varchar(12) null,					--�绰
	KH_xDizhi varchar(50) null,						--��ַ
	KH_xBeizhu varchar(100) null,					--��ע
	KH_xMoney money null default(0),				--����Ӧ��
	KH_xMoren int check( KH_xMoren in(0,1)) default(0),	--Ĭ�Ͽͻ�
)
go
insert KH_xinxi(KH_xName, KH_xlianxiren, KH_xDianhua, KH_xDizhi, KH_xBeizhu, KH_xMoney, KH_xMoren)
values('���ݴ�Ƶ�','��ĳ','7373777','��������','setfewr','4545',0)
insert KH_xinxi(KH_xName, KH_xlianxiren, KH_xDianhua, KH_xDizhi, KH_xBeizhu, KH_xMoney, KH_xMoren)
values('�Ϻ���Ƶ�','��ĳ','2222222','����˫��','aaaaaaaa','3434',1)
insert KH_xinxi(KH_xName, KH_xlianxiren, KH_xDianhua, KH_xDizhi, KH_xBeizhu, KH_xMoney, KH_xMoren)
values('��ͨ�ͻ�','��ĳ','55555555','������Ͽ','asssssss','2233',0)
select * from KH_xinxi

--�ͻ���Ϣ�洢����
if exists(select * from sysobjects where name='procKH')
	drop proc procKH
go
create proc procKH
@KH_xName varchar(20),
@KH_xlianxiren varchar(10),
@KH_xDianhua varchar(12),
@KH_xDizhi varchar(50),
@KH_xBeizhu varchar(100),
@KH_xMoney money,
@KH_xMonen int
as
insert KH_xinxi(KH_xName, KH_xlianxiren, KH_xDianhua, KH_xDizhi, KH_xBeizhu, KH_xMoney, KH_xMoren)
values(@KH_xName,@KH_xlianxiren,@KH_xDianhua,@KH_xDizhi,@KH_xBeizhu,@KH_xMoney,@KH_xMonen)
go




--Ա������(YG_xinxi)
if exists(select * from sysobjects where name='YG_xinxi')
	drop table YG_xinxi
go
create table YG_xinxi
(
	YG_xId int primary key identity(1,1) not null,		--�������
	YG_xName varchar(10) not null,						--Ա������
	YG_xZhiwu varchar(10) not null,						--ְ��
	YG_xDianhua varchar(12) null,						--�绰
	YG_xDizhi varchar(50) null,							--��ַ
	YG_xBeizhu varchar(100) null,						--��ע
	YG_xCaigou int check( YG_xCaigou in(0,1)) default(0),	--�ɹ�Ȩ��
	YG_xXiaoshou int check( YG_xXiaoshou in(0,1)) default(0),	--����Ȩ��
	YG_xkucuen int check( YG_xkucuen in(0,1)) default(0),		--������Ȩ��
)
go




insert YG_xinxi(YG_xName, YG_xZhiwu, YG_xDianhua, YG_xDizhi, YG_xBeizhu, YG_xCaigou, YG_xXiaoshou, YG_xkucuen)
values('СС','����Ա','25259595','��������','ttttttt',0,0,0)
insert YG_xinxi(YG_xName, YG_xZhiwu, YG_xDianhua, YG_xDizhi, YG_xBeizhu, YG_xCaigou, YG_xXiaoshou, YG_xkucuen)
values('С΢','����','33333333','��������','rrrrrr',1,0,0)
insert YG_xinxi(YG_xName, YG_xZhiwu, YG_xDianhua, YG_xDizhi, YG_xBeizhu, YG_xCaigou, YG_xXiaoshou, YG_xkucuen)
values('С��','����','55555555','����˫��','yyyyyyyy',1,1,1)
select * from YG_xinxi

select * from XS_tbale,YG_xinxi,CK_table,KH_xinxi where XS_tbale.XS_tCK=CK_table.CK_tID and XS_tbale.XS_tJinbanren=YG_xinxi.YG_xId and  XS_tbale.XS_tKHname=KH_xinxi.KH_xId and XS_tTime between '2010-01-01 00:00:00' and '2010-01-23 01:52:50' and XS_tID like '%%'
select XS_tDanhao,CK_tName,DH_tYmoney,DH_tSmoney,YG_xName,XS_tType,XS_tKHname 
from XS_tbale as a inner join CK_table as b on(a.XS_tCK=b.CK_tID) inner join YG_xinxi as c on(a.XS_tJinbanren=c.YG_xId) 
where XS_tKHname in (select KH_xId from KH_xinxi where KH_xName='��ʦ������')


--���ű�(XS_tbale)
if exists(select * from sysobjects where name='XS_tbale')
	drop table XS_tbale
go
create table XS_tbale
(
	XS_tID int primary key identity(1,1) not null,	--�������
	XS_tKHname int not null,                        --�ͻ��������*
	XS_tDanhao varchar(15) not null,				--����
	XS_tTime datetime not null,						--����
	XS_tCK int references CK_table(CK_tID),			--�ֿ��������*
	XS_tType varchar(10) not null,					--��������
	XS_tBeizhu varchar(100) null,					--��ע*
	XS_tJinbanren int references YG_xinxi(YG_xId),	--���������*
	DH_tYmoney money null default(0),				--Ӧ�ս��
	DH_tSmoney money null default(0),				--ʵ�ս��
	XS_tYanshi varchar(15) null						--ԭʼ����*	
	
)
go
select XS_tDanhao,XS_tTime,GH_sName,CK_tName,DH_tYmoney,DH_tSmoney,(DH_tYmoney-DH_tSmoney) as qiankuan,XS_tType,XS_tYanshi,YG_xName,XS_tBeizhu 
from XS_tbale,YG_xinxi,CK_table,GH_shang 
where XS_tKHname=GH_sId and XS_tCK=CK_tID and XS_tJinbanren=YG_xId and XS_tType='�ɹ�' and XS_tTime>'2010-01-01 00:00:00' and XS_tTime<'2010-01-23 02:55:35'

select XS_tDanhao,CK_tName,DH_tYmoney,DH_tSmoney,YG_xName,XS_tType,GH_sName
from CK_table,XS_tbale,YG_xinxi,GH_shang
where XS_tCK=CK_tID and XS_tJinbanren=YG_xId and XS_tKHname=GH_sId and GH_sName='��ͨ�ͻ�'

select XS_tDanhao,CK_tName,DH_tYmoney,DH_tSmoney,YG_xName,XS_tType,KH_xName
from CK_table,XS_tbale,YG_xinxi,KH_xinxi
where XS_tCK=CK_tID and XS_tJinbanren=YG_xId and XS_tKHname=KH_xId and KH_xName='{0}'


select XS_tDanhao,XS_tTime,GH_sName,CK_tName,DH_tYmoney,DH_tSmoney,(DH_tYmoney-DH_tSmoney) as qiankuan,XS_tType,XS_tYanshi,YG_xName,XS_tBeizhu
from XS_tbale,YG_xinxi,CK_table,GH_shang
where XS_tKHname=GH_sId and XS_tCK=CK_tID and XS_tJinbanren=YG_xId and XS_tType='�ɹ�' and XS_tTime>'' or XS_tTime<''

select KH_xName,XS_tTime,XS_tDanhao,XS_tType,DH_tYmoney,DH_tSmoney,(DH_tYmoney-DH_tSmoney) as qiankuan,(DH_tYmoney-DH_tSmoney) as youhuei,YG_xName,XS_tBeizhu
from XS_tbale,KH_xinxi,YG_xinxi
where XS_tJinbanren=YG_xId and XS_tKHname=KH_xId and XS_tType='����'


select SP_gTiaoma,SP_gName,SP_gDanweiid,DH_tShuliang,SP_gKucuen,DH_tZongjine,SP_gXinghao,Y_Name,SP_gSchang,SP_gBeizhi
from SP_goods,DH_tabel,Yshe
where SP_gTiaoma=DH_tshangpID and SP_gYid=Y_Id and DH_tDanhao='CJ201001120002' and XS_tTime>'2010-01-12' or XS_tTime>''


insert XS_tbale(XS_tKHname, XS_tDanhao, XS_tTime, XS_tType, XS_tBeizhu, XS_tJinbanren, DH_tYmoney, DH_tSmoney)
values('','','','','','','','')

select SP_gName,SP_gDanweiid,SP_gXinghao,Y_Name,SP_gSchang,SP_gBeizhi
from SP_goods,Yshe
where SP_gYid=Y_Id

select DH_tDanhao,SP_gName,DH_tShuliang,SP_gDanweiid,DH_tZongjine,SP_gXinghao,Y_Name,
from SP_goods,Yshe,DH_tabel
where SP_gYid=Y_Id and DH_tshangpID=SP_gTiaoma and DH_tType='����'


select GH_sName,XS_tTime,XS_tDanhao,,DH_tYmoney,DH_tSmoney,(DH_tYmoney-DH_tSmoney) as qiankuan,YG_xName,XS_tBeizhu
from XS_tbale,GH_shang,YG_xinxi
where XS_tJinbanren=YG_xId and XS_tKHname=GH_sId



select DH_tDanhao,DH_tshangpID,SP_gName,SP_gDanweiid,DH_tdanjia,DH_tShuliang,DH_tZongjine,SP_gXinghao,Y_Name
from DH_tabel,SP_goods,Yshe
where DH_tshangpID=SP_gTiaoma and Y_Id=SP_gYid and DH_tDanhao=''

insert into XS_tbale
select 1,'xs200003','2001-09-05',1,'XS','aaaaa',1,100,90,'x00001' union
select 2,'xs200004','2005-02-02',2,'XS','eeeee',2,300,280,'x00002' union
select 3,'xs200005','2003-06-03',2,'XS','wwwww',3,600,5000,'x00003'
insert XS_tbale(XS_tDanhao, XS_tTime, XS_tType)
values('xs201001050002',getdate(),'XS')
select * from XS_tbale


select XS_tDanhao,XS_tTime,GH_sName,CK_tName,DH_tYmoney,DH_tSmoney,(DH_tYmoney-DH_tSmoney) as qiankuan,XS_tType,YG_xName,XS_tBeizhu
from XS_tbale,GH_shang,CK_table,YG_xinxi
where XS_tKHname=GH_sId and XS_tCK=CK_tID and XS_tJinbanren=YG_xId and XS_tType='�˻�' and GH_sName='����˾' and XS_tTime<'2010-01-12' and XS_tTime>'2010-01-10'

select XS_tTime,XS_tDanhao,DH_tshangpID,SP_gName,DH_tdanjia,DH_tShuliang,DH_tZongjine,SP_gDanweiid,SP_gXinghao,Y_Name,CK_tName,YG_xName,GH_sName,SP_gSchang,XS_tYanshi
from XS_tbale,DH_tabel,SP_goods,GH_shang,CK_table,YG_xinxi,Yshe
where XS_tDanhao=DH_tDanhao and XS_tKHname=GH_sId and XS_tCK=CK_table.CK_tID  and XS_tJinbanren=YG_xId and DH_tshangpID=SP_gTiaoma and Y_Id=SP_gYid and DH_tType='�ɹ�' and DH_tshangpID='s00004' 


select DH_tshangpID,SP_gName,SP_gDanweiid,DH_tdanjia,DH_tShuliang,DH_tZongjine,SP_gXinghao,Y_Name
from DH_tabel,SP_goods,Yshe
where DH_tshangpID=SP_gTiaoma and Y_Id=SP_gYid and DH_tDanhao='TH201001120004'

select XS_tDanhao,XS_tTime,GH_sName,CK_tName,DH_tYmoney,DH_tSmoney,(DH_tYmoney-DH_tSmoney) as youhuei,XS_tType,XS_tYanshi,YG_xName,XS_tBeizhu
from XS_tbale,GH_shang,CK_table,YG_xinxi
where XS_tKHname=GH_sId and XS_tCK=CK_tID and XS_tJinbanren=YG_xId and XS_tType='�ɹ�'

select DH_tDanhao,DH_tshangpID,SP_gName,DH_tdanjia,DH_tShuliang,DH_tZongjine,SP_gDanweiid,SP_gXinghao,Y_Name,CK_tName,YG_xName
from XS_tbale,DH_tabel,SP_goods,GH_shang,CK_table,YG_xinxi,Yshe
where XS_tDanhao=DH_tDanhao and XS_tKHname=GH_sId and XS_tCK=CK_table.CK_tID  and XS_tJinbanren=YG_xId and DH_tshangpID=SP_gTiaoma and Y_Id=SP_gYid and DH_tType='�ɹ�' and DH_tshangpID='s00004' 

select DH_tshangpID,SP_gName,SP_gDanweiid,DH_tShuliang,DH_tZongjine,SP_gJijie,Y_Name,SP_gSchang,SP_gBeizhi
from DH_tabel,SP_goods,Yshe
where DH_tshangpID=SP_gTiaoma and Y_Id=SP_gYid and DH_tType='����'

select DH_tDanhao,DH_tshangpID,SP_gName,SP_gDanweiid,SP_gJijie,DH_tShuliang,(SP_gJijie*DH_tShuliang) as zje,SP_gXinghao,Y_Name
from DH_tabel,SP_goods,Yshe
where DH_tshangpID=SP_gTiaoma and Y_Id=SP_gYid and DH_tType='����'

select XS_tDanhao,XS_tTime,DH_tshangpID,SP_gName,DH_tdanjia,DH_tShuliang,DH_tZongjine,SP_gDanweiid,Y_Name,CK_tName,YG_xName,GH_sName
from XS_tbale,DH_tabel,GH_shang,SP_goods,CK_table,YG_xinxi,Yshe
where DH_tDanhao=XS_tDanhao and DH_tshangpID=SP_gTiaoma and XS_tCK=CK_table.CK_tID and Y_Id=SP_gYid and XS_tJinbanren=YG_xId and XS_tType='�ɹ�' or XS_tType='�˻�'

select XS_tDanhao,XS_tTime,DH_tshangpID,SP_gName,DH_tdanjia,DH_tShuliang,DH_tZongjine,SP_gDanweiid,CK_tName
from XS_tbale,DH_tabel,GH_shang,SP_goods,CK_table
where DH_tDanhao=XS_tDanhao and DH_tshangpID=SP_gTiaoma and XS_tCK=CK_table.CK_tID and XS_tType='�ɹ�' or XS_tType='�˻�'

select DH_tshangpID,SP_gName,SP_gDanweiid,DH_tdanjia,DH_tShuliang,DH_tZongjine
from SP_goods,DH_tabel]
where DH_tshangpID=SP_gTiaoma and DH_tDanhao='{0}'

--���ű���ϸ(DH_tabel)
if exists(select * from sysobjects where name='DH_tabel')
	drop table DH_tabel
go
create table DH_tabel
(
	DH_tId int primary key identity(1,1) not null,	--�������
	DH_tDanhao varchar(20) not null,				--����
	DH_tshangpID varchar(20) not null,				--��Ʒ���
	DH_tType varchar(10) not null,					--��������
	DH_tShuliang int not null,						--��������
	DH_tdzl decimal(7,2) null,						--������
	DH_tdanjia money	null,						--����
	DH_tZongjine money null							--�ܽ��
)	
go
insert into DH_tabel
select 'd000001','0001','aaaa',111,0.90,20,2220 union
select 'd000002','0002','bbbb',9,0.80,2,18 union
select 'd000003','0003','cccc',10,0.95,3,30 union
select 'd000004','0004','dddd',100,0.90,5,500
select * from DH_tabel

select DH_tshangpID,SP_gName,DH_tdanjia,DH_tShuliang,DH_tZongjine,SP_gDanweiid,SP_gXinghao,Y_Name
from DH_tabel,SP_goods,Yshe
where DH_tshangpID=SP_gTiaoma and Y_Id=SP_gYid and DH_tDanhao='CF201001160002'


select SP_gTiaoma,SP_gName,SP_gDanweiid,SP_gXinghao,Y_Name,SP_gXijie,SP_gKucuen from SP_goods,Yshe,SP_type where SP_gYid=Y_Id and SP_gType=SP_type.SP_tId and CK_tID='1'  and SP_gTiaoma like '%s%' or SP_gName like '%s%' 

select CF_tdanhao,CF_ttime,CK_tName,CF_spbianhao,SP_gName,SP_gJijie,CF_shuliang,(SP_gJijie*CF_shuliang) as zje,YG_xName,CF_beizhu
from CG_table,CK_table,YG_xinxi,SP_goods
where CF_spbianhao=SP_gTiaoma and CF_tcangku=CK_table.CK_tID and CF_tjbren=YG_xId and 

insert DH_tabel(DH_tDanhao, DH_tshangpID, DH_tType, DH_tShuliang, DH_tdzl, DH_tdanjia, DH_tZongjine)
values('','','','','','','')

select XS_tTime,DH_tDanhao,DH_tdanjia,DH_tShuliang,DH_tZongjine from XS_tbale,DH_tabel where DH_tDanhao=XS_tDanhao and DH_tshangpID=''



--��������(CG_table)
if exists(select * from sysobjects where name='CG_table')
	drop table CG_table
go
create table CG_table
(
	CF_tID int primary key identity(1,1) not null,  --����
	CF_tdanhao varchar(16) not null,				--����
	CF_ttype varchar(10) not null,					--����
	CF_tcangku int not null,						--�ֿ����
	CF_ttime datetime not null,						--ʱ��
	CF_spbianhao varchar(15) not null,				--�������Ʒ���
	CF_shuliang int not null,						--����
	CF_tjbren int not null,							--���������
	CF_beizhu varchar(100) null						--��ע
	
)
go
insert CG_table(CF_tdanhao, CF_ttype, CF_tcangku, CF_ttime, CF_spbianhao, CF_tshangping, CF_tjbren, CF_beizhu)
values('','','','','','','','')
insert into CG_table
select 'cg0001','ˮ����','���Ųֿ�','2008-09-01','gs0001',3,'ƻ��','С��','sdgsdgsdfgsfd' union
select 'cg0002','�߲���','���Ųֿ�','2009-07-01','gs0001',3,'�ײ�','С��','etwertg4ryg4g' union
select 'cg0003','�ճ���Ʒ��','���Ųֿ�','2005-07-01','gs0001',3,'ֽ��','С΢','et6u67y7ujy' union
select 'cg0004','������','���Ųֿ�','2006-03-01','gs0001',3,'�ϰ׽�','С��','qfreedgfdsgdg' union
select 'cg0005','����','���Ųֿ�','2008-08-01','gs0001',3,'�׾�','С��','dhgtrhtrhjuy' 
select * from CG_table
insert CG_table(CF_tdanhao, CF_ttype, CF_tcangku, CF_ttime,CF_tshangping, CF_tjbren, CF_beizhu) values('CF201001160001','���','1','2010-01-16 09:07:43','s00004','1','')

select CF_tdanhao,CF_ttime,CK_tName,CF_spbianhao,SP_gName,SP_gJijie,CF_shuliang,(SP_gJijie*CF_shuliang) as zje,YG_xName,CF_beizhu from CG_table,CK_table,YG_xinxi,SP_goods where CF_spbianhao=SP_gTiaoma and CF_tcangku=CK_table.CK_tID and CF_tjbren=YG_xId and CF_ttype='����' and CF_ttime>'2010-01-05 09:16:00' and CF_ttime<'2010-01-16 10:47:32'

--��־��(RZ_)
if exists(select * from sysobjects where name='RZ_')
	drop table RZ_
go
create table RZ_
(
	RZ_id int primary key identity(1,1) not null,
	RZ_time datetime not null,
	RZ_czyuan varchar(10) not null,
	RZ_neirong varchar(100) not null
)
go
insert into RZ_
select '2009-03-21','aa','sdgfsdg' union
select '2006-02-24','bb','aserfsf' union
select '2008-04-07','cc','gujjjgf'
select * from RZ_






--������ֽ�����(CW_xianjin)
if exists(select * from sysobjects where name='CW_xianjin')
	drop table CW_xianjin
go
create table CW_xianjin
(
	CW_xId int primary key identity(1,1) not null,
	CW_xkemu varchar(10) not null,
	CW_xyue money not null default(0),
	CW_zfujia varchar(100) null,
	CW_xtime datetime not null,
	CW_xdanju varchar(16) not null,
	CW_xdjtype varchar(10) not null,
	CW_xjine money not null,
	CW_xjbren varchar(10) not null,
	CW_xghs varchar(20) not null,
	CW_xbeizhu varchar(100) null
)
go
insert into cw_xianjin
select 'a',12421,'dsfdsg','2009-02-1','r000001','A',1000,'sgd','ewt','dgfdgtsad' union
select 'b',34344,'gfhgfh','2004-02-5','r000002','B',400,'dsg','dgg','hyfdhed' union
select 'c',325,'jghjgfj','2004-04-1','r000003','C',5500,'gfh','gjg','drfyhrf'
select * from CW_xianjin





---***********************************************************************
--������ü�����(CW_feiy)
if exists(select * from sysobjects where name='CW_feiy')
	drop table CW_feiy
go
create table CW_feiy
(
	CW_fId	int primary key identity(1,1) not null,			--������ʶ��
	CW_ftypename varchar(10)  null,						--��������
	CW_fzmoney money  null default(0),					--�ܽ��
	CW_ftype varchar(10)  null,							--����
	CW_ffujia varchar(100) null,							--����˵��
	CW_ftime datetime  null,								--ʱ��
	CW_fmoney money  null default(0),					--���
	CW_fJbren varchar(10)  null,							--������
	CW_fczyuan varchar(10) null,						--����Ա
	CW_fbeizhu varchar(100)  null						--��ע
)
go
insert into CW_feiy
select 'AAA',100000,'Q','rtgs','2008-02-02',30000,'ɳɳ','С��','sdoifjdiofd' union
select 'BBB',450000,'T','dsgfdg','2004-02-02',90000,'����','С΢','edgfegfedf' union
select 'CCC',90000,'E','gtrjuyj','2003-06-02',2000,'ԲԲ','С��','iuhjmhgj'
select * from CW_feiy





--����̶��ʲ�(CW_guding)
if exists(select * from sysobjects where name='CW_guding')
	drop table CW_guding
go
create table CW_guding
(
	CW_gId int primary key identity(1,1) not null,
	CW_gtime datetime not null,
	CW_gtype varchar(10) not null,
	CW_gmoney money default(0) not null,
	 CW_gjbren varchar(10) not null,
	CW_gbeizhu varchar(100) null,
)
go
insert into cw_guding
select '2009-09-08','BBB',555555,'HH','REFGFSD'union
select '2003-06-08','CCC',777777,'MM','SDFGSDF'union
select '2005-02-08','AAA',222222,'JJ','RET64RT'
select * from CW_guding





--���񱨱�(CW_yingsyf)
if exists(select * from sysobjects where name='CW_yingsyf')
	drop table CW_yingsyf
go
create table CW_yingsyf
(
	CW_yid int primary key identity(1,1) not null,
	CW_ydanwei varchar(20) not null,
	CW_ytype varchar(10) not null,
	CW_yyshou money null default(0),
	CW_yyfu money null default(0),
	CW_ytime datetime not null,
	CW_ydanhao varchar(16) not null,
	CW_ynrong varchar(20) not null,
	CW_yyingfu money null default(0),
	CW_yyingshou money null default(0),
	CW_yczyuan varchar(10) not null,
	CW_yjbren varchar(10) not null,
	CW_ybeizhu varchar(100) null
)
go
insert into CW_yingsyf
select 'edsf','aa',21222,21111,'2009-01-02','c0001','rsedgted',20000,20000,'С��','aadsa','adsfg' union
select 'sdff','bb',5435,2654,'2005-06-02','c0002','rtrsder',7000,3000,'С��','etewt','frtgre' union
select 'edsf','cc',44352,26546,'2003-03-05','c0003','rytrdy',20000,20000,'С΢','hykjhg','hkljhlk'
select * from CW_yingsyf





--��Ӫ�����(JY_qkuang)
if exists(select * from sysobjects where name='JY_qkuang')
	drop table JY_qkuang
go
create table JY_qkuang
(
	JY_qID int primary key identity(1,1) not null,
	JY_qkemu varchar(10) not null,
	JY_qfjine money null default(0),
	JY_qleiji money null default(0),
	JY_qtime datetime not null,
	JY_qshuom varchar(10) not null,
	JY_qjine money null default(0),
	JY_qjbren varchar(10) null,
	JY_qbeizhu varchar(100) null
)
go
insert into JY_qkuang
select 'fff',555,5643,2008-08-08,'ewtegtrw',343,'iiii','regrewgh' union
select 'www',444,4532,2006-04-08,'465wett',6765,'uuuu','ytkjhyju' union
select 'kkk',555,5656,2004-02-08,'ewtewt',546,'gggg','rfhfdhh'
select * from JY_qkuang


--�ֽ�����(XJ_yhang)
if exists(select * from sysobjects where name='XJ_yhang')
	drop table XJ_yhang
go
create table XJ_yhang
(
	XJ_ID int primary key identity(1,1) not null,
	XJ_name varchar(20),
	XJ_money money,
	XJ_beizhu varchar(100)
)
go

insert XJ_yhang(XJ_name, XJ_money, XJ_beizhu) values('��������',3000,'')




--�ʲ���ծ��(ZC_fuzhai)
if exists(select * from sysobjects where name='ZC_fuzhai')
	drop table ZC_fuzhai
go
create table ZC_fuzhai
(
	ZC_fID int primary key identity(1,1) not null,
	ZC_fkemu varchar(20) not null,
	ZC_fjine money null default(0),
)
go
insert into ZC_fuzhai
select 'sss',500000 union
select 'aaa',200000 union
select 'ddd',600000 
select * from ZC_fuzhai



--��װ����(BZ_shezhi)
if exists(select * from sysobjects where name='BZ_shezhi')
	drop table BZ_shezhi
go
create table BZ_shezhi
(
	BZ_sID int primary key identity(1,1) not null,
	BZ_sdcangku varchar(10) not null,
	BZ_sdSPbianhao varchar(10) not null,
	BZ_sxcangku varchar(10) not null,	
	BZ_sxSpbianhao varchar(10) not null,
	BZ_sbilv int not null check(BZ_sbilv>0 and BZ_sbilv<100),
)
go
insert into BZ_shezhi
select '���Ųֿ�','s001','һ�Ųֿ�','g001',3 union
select '���Ųֿ�','s002','���Ųֿ�','g002',2 union
select '�ĺŲֿ�','s003','���Ųֿ�','g003',4 union
select 'һ�Ųֿ�','s004','һ�Ųֿ�','g004',7
select * from  BZ_shezhi




--��ʱ��
if exists(select * from sysobjects where name='temp')
	drop table temp
go
create table temp
(
	id int primary key identity(1,1) not null,
	spbianhao varchar(20),
	spname varchar(20),
	SPdanwei varchar(10),
	danjia money,
	dazhel money,
	zhj money,
	shuliang int,
	zje money
)
go

--��ʱ��洢����
if exists(select * from sysobjects where name='proc_temp')
	drop proc proc_temp

go
create proc proc_temp

	@spbianhao varchar(20),
	@spname varchar(20),
	@SPdanwei varchar(10),
	@danjia money,
	@dazhel money,
	@zhj money,
	@shuliang int,
	@zje money
as
insert temp(spbianhao,spname, SPdanwei, danjia, dazhel, zhj, shuliang, zje)
values(@spbianhao,@spname,@SPdanwei,@danjia,@dazhel,@zhj,@shuliang,@zje)
go

---*************************************************
---*************************************************
---*************************************************
---*************************************************
---*************************************************
---*************************************************
---*************************************************
---*************************************************

select * from CG_table
--******************************
select * from CK_table
--*******************************
select * from CW_xianjin
--*******************************
select * from CZ_Yuangong
--*******************************
select * from DH_tabel
--*******************************
select * from Dwei
--*******************************

select * from GH_shang
--*******************************

select * from HY_guanli
--*******************************

select * from KH_xinxi
--*******************************

select * from MEMLEVEL
--*******************************

select * from RZ_
--*******************************

select * from SP_goods
--*******************************

select * from SP_type
--*******************************

select * from SP_xmingxi
--*******************************

select * from XS_tbale
--*******************************

select * from YG_xinxi
--*******************************

select * from Yshe
--*******************************















































































































































































































