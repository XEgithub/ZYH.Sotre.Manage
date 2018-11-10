/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/11/10 11:43:22                          */
/*==============================================================*/


drop index IX_Department on Organization.Department;

drop table if exists Organization.Department;

drop table if exists Organization.DepartmentEmployee;

drop table if exists Organization.DepartmentRole;

drop index IX_Employee on HR.Employee;

drop table if exists HR.Employee;

drop index IX_Employee on HR.EmployeeLogin;

drop table if exists HR.EmployeeLogin;

drop table if exists Finance.FlowingCapital;

drop table if exists Finance.FlowingCapitalItem;

drop table if exists InOrOutMoneyStatistics;

drop table if exists InOrOutMoneyStatisticsItem;

drop table if exists SysMange.MaterialInfo;

drop index IX_MaterialPackage on SysMange.MaterialPackage;

drop table if exists SysMange.MaterialPackage;

drop table if exists SysMange.MaterialTypes;

drop table if exists SysMange.MeasureUnit;

drop table if exists SysMange.Menu;

drop table if exists Organization.MenuRole;

drop table if exists SysMange.Module;

drop table if exists Organization.ModuleRole;

drop table if exists Sales.Product;

drop table if exists Procurement.Purchase;

drop table if exists Procurement.PurchaseItems;

drop table if exists SalesProduct;

drop table if exists SalesProductItem;

drop index IX_WarehouseStock on Inventory.StockTaking;

drop table if exists Inventory.StockTaking;

drop index IX_WarehouseStock on Inventory.StockTakingItem;

drop table if exists Inventory.StockTakingItem;

drop table if exists SysMange.Supplier;

drop index IX_UserPosition on HR.UserPosition;

drop table if exists HR.UserPosition;

drop index IX_Warehouse on Inventory.Warehouse;

drop table if exists Inventory.Warehouse;

drop index IX_WarehouseStock on Inventory.WarehouseInventory;

drop table if exists Inventory.WarehouseInventory;

drop index IX_WarehouseRegion on Inventory.WarehouseRegion;

drop table if exists Inventory.WarehouseRegion;

/*==============================================================*/
/* User: Finance                                                */
/*==============================================================*/
create user Finance;

/*==============================================================*/
/* User: HR                                                     */
/*==============================================================*/
create user HR;

/*==============================================================*/
/* User: Inventory                                              */
/*==============================================================*/
create user Inventory;

/*==============================================================*/
/* User: Organization                                           */
/*==============================================================*/
create user Organization;

/*==============================================================*/
/* User: Procurement                                            */
/*==============================================================*/
create user Procurement;

/*==============================================================*/
/* User: Sales                                                  */
/*==============================================================*/
create user Sales;

/*==============================================================*/
/* User: SysMange                                               */
/*==============================================================*/
create user SysMange;

/*==============================================================*/
/* User: dbo                                                    */
/*==============================================================*/
create user dbo;

/*==============================================================*/
/* Table: Department                                            */
/*==============================================================*/
create table Organization.Department
(
   DepartmentGUID       char(36) not null comment '���ű�ʶ',
   DepartmentName       national varchar(20) comment '��������',
   ParentDepartmentGUID char(36) comment '�ϼ����ű�ʶ',
   DepartmentType       tinyint comment '�������� 0=��ͨ���� 1=�ӹ�˾ 2=�ŵ� ',
   Deleted              bool,
   DepartmentCode       int auto_increment comment '���ű���',
   DepartmentTel        varchar(50) comment '���ŵ绰',
   Remark               varchar(500) comment '��������',
   Enabled              bool default 1 comment '���ñ�־',
   primary key (DepartmentGUID)
);

alter table Organization.Department comment '������Դ.��֯�ܹ�.����';

/*==============================================================*/
/* Index: IX_Department                                         */
/*==============================================================*/
create index IX_Department on Organization.Department
(
   Deleted,
   DepartmentCode,
   Enabled,
   DepartmentName
);

/*==============================================================*/
/* Table: DepartmentEmployee                                    */
/*==============================================================*/
create table Organization.DepartmentEmployee
(
   DepartmentEmployeeID char(36) not null comment '���Ž�ɫ��ʶ',
   DepartmentGUID       char(36) comment '���ű�ʶ',
   DepartmentRoleGUID   char(36) comment '���Ž�ɫ��ʶ',
   RoleGUID             char(36) comment '��ɫ��ʶ',
   EmployeeID           varcahr(32),
   Enabled              bool,
   primary key (DepartmentEmployeeID)
);

alter table Organization.DepartmentEmployee comment '������Դ.��֯�ܹ�.����Ա��';

/*==============================================================*/
/* Table: DepartmentRole                                        */
/*==============================================================*/
create table Organization.DepartmentRole
(
   DepartmentRoleGUID   char(36) not null comment '���Ž�ɫ��ʶ',
   DepartmentGUID       char(36) comment '���ű�ʶ',
   RoleGUID             char(36) comment '��ɫ��ʶ',
   RoleName             varcahr(32),
   Enabled              bool,
   primary key (DepartmentRoleGUID)
);

alter table Organization.DepartmentRole comment '������Դ.��֯�ܹ�.���Ž�ɫ';

/*==============================================================*/
/* Table: Employee                                              */
/*==============================================================*/
create table HR.Employee
(
   EmployeeGUID         char(36) not null comment 'Ա��GUID',
   EmployeeName         varchar(50) not null comment '����',
   IndexCode            varchar(10) not null comment '��������ĸ��д',
   EmployeeCode         varchar(20) comment 'Ա�����',
   Birthday             datetime comment '��������',
   Gender               tinyint comment '�Ա�',
   Address              varchar(150) comment '��ס��ַ',
   IDCardNo             varchar(20) comment '���֤����',
   InductionDate        datetime comment '��ְ����',
   FormalDate           datetime comment 'ת������',
   LeaveDate            datetime comment '��ְ����',
   Status               tinyint not null comment '״̬',
   DutyID               int comment 'ְ��',
   PositionID           int comment 'ְλ',
   Tel                  varchar(30) comment '��ϵ�绰',
   primary key (EmployeeGUID)
);

alter table HR.Employee comment '������Դ.���¹���.Ա��';

/*==============================================================*/
/* Index: IX_Employee                                           */
/*==============================================================*/
create index IX_Employee on HR.Employee
(
   EmployeeName,
   IndexCode,
   Birthday,
   Gender,
   EmployeeCode,
   InductionDate,
   FormalDate,
   LeaveDate,
   Status
);

/*==============================================================*/
/* Table: EmployeeLogin                                         */
/*==============================================================*/
create table HR.EmployeeLogin
(
   EmployeeLoginID      int not null auto_increment comment 'Ա��GUID',
   EmployeeGUID         char(36) comment 'Ա�����',
   UserName             varchar(50) not null comment '����',
   Pwd                  varchar(50) not null comment '��������ĸ��д',
   Phone                varchar(11) comment '��������',
   LoginCount           int comment '�Ա�',
   LastTime             datetime comment '��ס��ַ',
   Enable               bool comment '���֤����',
   Deleted              bool not null comment '���ڲ���',
   primary key (EmployeeLoginID)
);

alter table HR.EmployeeLogin comment '������Դ.���¹���.Ա����¼';

/*==============================================================*/
/* Index: IX_Employee                                           */
/*==============================================================*/
create index IX_Employee on HR.EmployeeLogin
(
   UserName,
   Pwd,
   Phone,
   LoginCount,
   EmployeeGUID,
   Deleted
);

/*==============================================================*/
/* Table: FlowingCapital                                        */
/*==============================================================*/
create table Finance.FlowingCapital
(
   FlowingCapitalID     int not null auto_increment,
   FlowingCapitalName   varchar(64),
   FlowingCapitalType   int comment '1������ 2��֧��',
   RecordType           int comment '1:�ɹ��Զ� (֧��)2 :�����Զ�(����)������ģ��¼����Զ���д��֧��3:�ֶ�¼��',
   ApplyUserID          int,
   RecordTime           datatime,
   Amount               float(8,2),
   Remark               varchar(256),
   SourceID             int comment '��֧��Դ��ĳ�����͵�ҵ�����ͣ�Ŀǰֻ�У��ɹ� ������ ��������ֶ�',
   primary key (FlowingCapitalID)
);

alter table Finance.FlowingCapital comment '������ͳ�Ƶ�����ûһ����������֧����ϸͳ��
1.�����ֶ�¼���ʽ�����������磺������ ����ѵȣ�
                                           -&#';

/*==============================================================*/
/* Table: FlowingCapitalItem                                    */
/*==============================================================*/
create table Finance.FlowingCapitalItem
(
   FlowingCapitalItemID int not null auto_increment,
   FlowingCapitalID     int,
   RecordItemType       int comment '1:ˮ�� 2:��� 3:��Ȼ���� 4:����� 5:��ͨ�� 6:����� 7:ͨѶ�� 8:����� 9:����֧�� 10:��������',
   Amount               float(8,2),
   BeginTime            datatime,
   Endtime              datatime,
   RecordTime           datatime,
   Remark               varchar(256),
   primary key (FlowingCapitalItemID)
);

alter table Finance.FlowingCapitalItem comment '�������.�ճ�ҵ��.��֧������ϸ';

/*==============================================================*/
/* Table: InOrOutMoneyStatistics                                */
/*==============================================================*/
create table InOrOutMoneyStatistics
(
   InOrOutMoneyStatisticsID int not null auto_increment,
   Date                 date,
   AmountIn             decimal(18,2),
   AmountOut            decimal(18,2),
   primary key (InOrOutMoneyStatisticsID)
);

alter table InOrOutMoneyStatistics comment 'ͳ��ÿ��Ϊ��λ�ʽ���ͳ�ƣ�����/֧��ͳ�ƣ�
ÿ��ɹ�,֧������  ÿ����¼ͳ��
������Դ����֧��';

/*==============================================================*/
/* Table: InOrOutMoneyStatisticsItem                            */
/*==============================================================*/
create table InOrOutMoneyStatisticsItem
(
   InOrOutMoneyStatisticsItemID int not null auto_increment,
   InOrOutMoneyStatisticsID int,
   SourceID             date,
   Amount               decimal(18,2),
   RecordType           int comment '1:�ɹ��Զ� (֧��)2 :�����Զ�(����)������ģ��¼����Զ���д��֧��3:�ֶ�¼��',
   FlowingCapitalType   int comment '1������ 2��֧��',
   primary key (InOrOutMoneyStatisticsItemID)
);

alter table InOrOutMoneyStatisticsItem comment ' ';

/*==============================================================*/
/* Table: MaterialInfo                                          */
/*==============================================================*/
create table SysMange.MaterialInfo
(
   MaterialID           int not null auto_increment comment '����ID',
   MaterialCode         varchar(16),
   MaterialName         varchar(64),
   MaterialType         int comment '1:ԭ�� 2:���Ʒ ',
   MaterialTypeID       int,
   Enabled              bool not null default 1 comment '����״̬',
   MaterialShortName    varchar(50) comment '���ϼ��',
   ShortIndexCode       varchar(10) comment '���ϼ���',
   MaterialImage        varchar(200) comment '����ͼƬ',
   CreateTime           datetime,
   primary key (MaterialID)
);

alter table SysMange.MaterialInfo comment 'ϵͳ����.ҵ������.����';

/*==============================================================*/
/* Table: MaterialPackage                                       */
/*==============================================================*/
create table SysMange.MaterialPackage
(
   MaterialPackageID    int not null auto_increment comment '��װ���ID',
   MaterialID           int not null comment '����ID',
   MaterialPackageName  varchar(50) not null comment '�������',
   Remark               varchar(200) comment '���˵��',
   Ratio                float not null comment '�������',
   MeasureUnitID        int not null comment '������λ',
   BarCode              varchar(36) comment '����',
   CostPrice            float(8,2) not null default 0 comment '�ɱ���',
   SalePrice            float(8,2) not null default 0 comment '���ۼ�',
   Enabled              bool,
   primary key (MaterialPackageID)
);

alter table SysMange.MaterialPackage comment 'ϵͳ����.ҵ������.���ϰ�װ���';

/*==============================================================*/
/* Index: IX_MaterialPackage                                    */
/*==============================================================*/
create index IX_MaterialPackage on SysMange.MaterialPackage
(
   MaterialID
);

/*==============================================================*/
/* Table: MaterialTypes                                         */
/*==============================================================*/
create table SysMange.MaterialTypes
(
   MaterialTypeID       int not null auto_increment,
   ParentMaterialTypeID int,
   MaterialTypeName     varchar(64),
   Remark               varchar(200) comment '��������˵��',
   Enabled              bool not null default 1 comment '���ñ�־',
   Deleted              bool not null default 0 comment 'ɾ����־',
   primary key (MaterialTypeID)
);

alter table SysMange.MaterialTypes comment 'ϵͳ����.ҵ������.���Ϸ���';

/*==============================================================*/
/* Table: MeasureUnit                                           */
/*==============================================================*/
create table SysMange.MeasureUnit
(
   MeasureUnitID        int not null auto_increment,
   MeasureUnitName      varchar(16),
   Enable               bool,
   primary key (MeasureUnitID)
);

alter table SysMange.MeasureUnit comment 'ϵͳ����.ҵ������.������λ';

/*==============================================================*/
/* Table: Menu                                                  */
/*==============================================================*/
create table SysMange.Menu
(
   MenuID               int not null auto_increment,
   MenuName             varchar(64),
   Index                varchar(64),
   IsEnable             bool,
   MenuImg              varchar(128) comment '1.ʵ��� 2.�Ա� 3.���� 4.΢��',
   MenuURL              varchar(128),
   Remark               text,
   MenuParentID         int,
   ModuleID             int,
   primary key (MenuID)
);

alter table SysMange.Menu comment 'ϵͳ����.�˵�����.ģ��˵�';

/*==============================================================*/
/* Table: MenuRole                                              */
/*==============================================================*/
create table Organization.MenuRole
(
   MenuRoleID           char(36) not null comment '���Ž�ɫ��ʶ',
   ModuleRoleID         char(36) comment '���ű�ʶ',
   ModuleID             int,
   MenuParentID         int,
   authority            int comment '1:read 2:update 4:delete',
   primary key (MenuRoleID)
);

alter table Organization.MenuRole comment '������Դ.��֯�ܹ�.��ɫģ��˵�Ȩ��';

/*==============================================================*/
/* Table: Module                                                */
/*==============================================================*/
create table SysMange.Module
(
   ModuleID             int not null auto_increment,
   ModuleName           varchar(64),
   Index                varchar(64),
   IsEnable             bool,
   ModuleImg            varchar(128) comment '1.ʵ��� 2.�Ա� 3.���� 4.΢��',
   ModuleURL            varchar(128),
   Remark               text,
   primary key (ModuleID)
);

alter table SysMange.Module comment 'ϵͳ����.�˵�����.ģ��';

/*==============================================================*/
/* Table: ModuleRole                                            */
/*==============================================================*/
create table Organization.ModuleRole
(
   ModuleRoleID         char(36) not null comment '���Ž�ɫ��ʶ',
   DepartmentRoleGUID   char(36) comment '���ű�ʶ',
   ModuleID             int comment '��ɫ��ʶ',
   IsEnable             bool,
   primary key (ModuleRoleID)
);

alter table Organization.ModuleRole comment '������Դ.��֯�ܹ�.��ɫģ��Ȩ��';

/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
create table Sales.Product
(
   ProductID            int not null auto_increment,
   ProductName          varchar(32),
   ProductType          int comment '1.�䴮�� 2.�ȴ��� 3.С��  4.��ˮ 5.��ɫ�� 6.��ʳ 7.����',
   ProductURL           varchar(128),
   Remark               varchar(256),
   CreateTime           datatime,
   CostPrice            float(8,2),
   SalePrice            float(8,2),
   MeasureUnitID        int,
   ProductCreateURL     varchar(128) comment '��Ʒ�������̹������ĵ�·��',
   primary key (ProductID)
);

alter table Sales.Product comment '���۹���.�ճ�ҵ��.��Ʒ';

/*==============================================================*/
/* Table: Purchase                                              */
/*==============================================================*/
create table Procurement.Purchase
(
   PurchaseID           int not null auto_increment,
   Address              varchar(128),
   CostPrice            decimal(18),
   RealPrice            decimal(18),
   EmployeeGUID         char(36),
   Contact              varchar(64),
   RoadPrice            decimal(18),
   Remark               text,
   RecordTime           datatime,
   Status               int comment '0. ���ɹ�  1.�ɹ���  2.�ɹ����',
   CreateTime           datatime,
   ApplyTime            datatime,
   PlanTime             datatime,
   primary key (PurchaseID)
);

alter table Procurement.Purchase comment '�ɹ�����.�ճ�ҵ��.����ɹ�';

/*==============================================================*/
/* Table: PurchaseItems                                         */
/*==============================================================*/
create table Procurement.PurchaseItems
(
   PurchaseItemID       int not null auto_increment,
   PurchaseID           int,
   Remark               text,
   Price                decimal(18),
   Count                decimal(18),
   TotalPrice           decimal(18),
   MaterialPackageID    int,
   SupplierID           int,
   MaterialID           int,
   primary key (PurchaseItemID)
);

alter table Procurement.PurchaseItems comment '�ɹ�����.�ճ�ҵ��.����ɹ���ϸ';

/*==============================================================*/
/* Table: SalesProduct                                          */
/*==============================================================*/
create table SalesProduct
(
   SalesProductID       int not null auto_increment,
   SalesProductCode     varchar(32),
   SaleTime             datatime,
   PersonCount          int,
   Amount               float(8,2),
   Discount             decimal,
   DiscountAmount       float(8,2),
   ConsumerCode         varchar(64) comment '�����߱��룬�������������ߵģ��磺ע���˻�Ա��������֧���ȣ�',
   primary key (SalesProductID)
);

alter table SalesProduct comment '���۹���.�ճ�ҵ��.��Ʒ����';

/*==============================================================*/
/* Table: SalesProductItem                                      */
/*==============================================================*/
create table SalesProductItem
(
   SalesProductItemID   int not null auto_increment,
   SalesProductID       int,
   ProductID            int,
   SaleCount            decimal,
   MeasureUnitID        int,
   Amount               float(8,2),
   DiscountAmount       float(8,2),
   Discount             decimal,
   primary key (SalesProductItemID)
);

alter table SalesProductItem comment '���۹���.�ճ�ҵ��.��Ʒ������ϸ';

/*==============================================================*/
/* Table: StockTaking                                           */
/*==============================================================*/
create table Inventory.StockTaking
(
   StockTakingID        int not null auto_increment comment '�ֿ���ID',
   CreateTime           datetime,
   EmployeeGUID         int not null,
   Status               decimal(16,8) not null default 0.0 comment '0 �ݸ� 1���',
   WarehouseID          float(8) not null default 0,
   ApplyTime            datetime not null,
   Remark               varchar(128),
   primary key (StockTakingID)
);

alter table Inventory.StockTaking comment '������.����.�ֿ���';

/*==============================================================*/
/* Index: IX_WarehouseStock                                     */
/*==============================================================*/
create index IX_WarehouseStock on Inventory.StockTaking
(
   CreateTime,
   EmployeeGUID,
   ApplyTime
);

/*==============================================================*/
/* Table: StockTakingItem                                       */
/*==============================================================*/
create table Inventory.StockTakingItem
(
   StockTakingItemID    int not null auto_increment,
   StockTakingID        int not null,
   MaterialID           int not null,
   MaterialPackageID    decimal(16,8) not null default 0.0,
   Remark               varchar(128),
   Inventory            decimal(16,8),
   OldInventory         decimal(16,8),
   primary key (StockTakingItemID)
);

alter table Inventory.StockTakingItem comment '������.ҵ������.�ֿ���ϸ';

/*==============================================================*/
/* Index: IX_WarehouseStock                                     */
/*==============================================================*/
create index IX_WarehouseStock on Inventory.StockTakingItem
(
   MaterialID
);

/*==============================================================*/
/* Table: Supplier                                              */
/*==============================================================*/
create table SysMange.Supplier
(
   SupplierID           int not null auto_increment,
   SupplierName         varchar(64),
   ContactName          varchar(64),
   Contact              varchar(64),
   SupplierType         int comment '1.ʵ��� 2.�Ա� 3.���� 4.΢��',
   Address              varchar(128),
   Remark               text,
   primary key (SupplierID)
);

alter table SysMange.Supplier comment 'ϵͳ����.ҵ������.��Ӧ��';

/*==============================================================*/
/* Table: UserPosition                                          */
/*==============================================================*/
create table HR.UserPosition
(
   PositionID           int not null auto_increment comment 'ְλID',
   DepartmentGUID       char(36) comment '���ű�ʶ',
   PositionName         varchar(50) not null comment 'ְλ����',
   IndexCode            varchar(20) not null comment '��������',
   ParentPositionID     int not null comment '�ϼ�ְλID',
   IsDirector           tinyint not null comment '�Ƿ�Ϊ����     0=��1=��',
   Memo                 text comment 'ְλ˵����',
   Enabled              bool not null comment '����״̬ ',
   Deleted              bool not null comment 'ɾ����־',
   primary key (PositionID)
);

alter table HR.UserPosition comment '������Դ.��֯�ܹ�.ְλ';

/*==============================================================*/
/* Index: IX_UserPosition                                       */
/*==============================================================*/
create index IX_UserPosition on HR.UserPosition
(
   IndexCode,
   IsDirector,
   Enabled,
   Deleted,
   PositionName
);

/*==============================================================*/
/* Table: Warehouse                                             */
/*==============================================================*/
create table Inventory.Warehouse
(
   WarehouseID          int not null auto_increment comment '�ֿ�ID',
   WarehouseCode        varchar(20) not null comment '�ֿ���',
   WarehouseTypeID      int not null comment '�ֿ�����ID',
   WarehouseName        varchar(50) not null comment '�ֿ�����',
   IndexCode            varchar(20) not null comment '��������',
   DistrictID           int not null comment '��������ID',
   Address              varchar(200) comment '�ֿ��ַ',
   DepartmentGUID       char(36) comment '��������',
   Remark               varchar(500) comment '��ע˵��',
   Enabled              bool not null default 1 comment '����״̬',
   Deleted              bool not null default 0 comment 'ɾ����־',
   Locked               bool not null comment '����״̬',
   primary key (WarehouseID)
);

alter table Inventory.Warehouse comment '�ֿ�';

/*==============================================================*/
/* Index: IX_Warehouse                                          */
/*==============================================================*/
create index IX_Warehouse on Inventory.Warehouse
(
   WarehouseTypeID,
   IndexCode,
   Enabled,
   Deleted,
   WarehouseName,
   DistrictID,
   WarehouseCode,
   DepartmentGUID
);

/*==============================================================*/
/* Table: WarehouseInventory                                    */
/*==============================================================*/
create table Inventory.WarehouseInventory
(
   WarehouseInventoryID int not null auto_increment comment '�ֿ���ID',
   WarehouseRegionID    int comment '�ֿ�����ID',
   NewestPrice          float(8) not null default 0 comment '����۸�',
   MaterialID           int not null comment '����ID',
   MaterialPackageID    int,
   Inventory            decimal(16,8) not null default 0.0 comment '��ǰ���',
   Cost                 float(8) not null default 0 comment '��ǰ�ɱ�',
   primary key (WarehouseInventoryID)
);

alter table Inventory.WarehouseInventory comment '������.����.�ֿ���';

/*==============================================================*/
/* Index: IX_WarehouseStock                                     */
/*==============================================================*/
create index IX_WarehouseStock on Inventory.WarehouseInventory
(
   WarehouseRegionID,
   MaterialID
);

/*==============================================================*/
/* Table: WarehouseRegion                                       */
/*==============================================================*/
create table Inventory.WarehouseRegion
(
   WarehouseRegionID    int not null auto_increment comment '�ֿ�����ID',
   WarehouseID          int not null comment '�ֿ�ID',
   RegionName           int not null comment '����ID',
   Deleted              bool not null comment 'ɾ����־',
   Remark               varchar(128),
   primary key (WarehouseRegionID)
);

alter table Inventory.WarehouseRegion comment '������.��������.�ֿ�����';

/*==============================================================*/
/* Index: IX_WarehouseRegion                                    */
/*==============================================================*/
create index IX_WarehouseRegion on Inventory.WarehouseRegion
(
   WarehouseID,
   RegionName,
   Deleted
);

alter table Organization.DepartmentEmployee add constraint FK_Reference_18 foreign key (DepartmentGUID)
      references Organization.Department (DepartmentGUID);

alter table Organization.DepartmentEmployee add constraint FK_Reference_19 foreign key (DepartmentRoleGUID)
      references Organization.DepartmentRole (DepartmentRoleGUID);

alter table Organization.DepartmentRole add constraint FK_Reference_17 foreign key (DepartmentGUID)
      references Organization.Department (DepartmentGUID);

alter table HR.EmployeeLogin add constraint FK_Reference_2 foreign key (EmployeeGUID)
      references HR.Employee (EmployeeGUID);

alter table Finance.FlowingCapitalItem add constraint FK_Reference_11 foreign key (FlowingCapitalID)
      references Finance.FlowingCapital (FlowingCapitalID);

alter table InOrOutMoneyStatisticsItem add constraint FK_Reference_23 foreign key (InOrOutMoneyStatisticsID)
      references InOrOutMoneyStatistics (InOrOutMoneyStatisticsID);

alter table SysMange.MaterialInfo add constraint FK_Reference_3 foreign key (MaterialTypeID)
      references SysMange.MaterialTypes (MaterialTypeID);

alter table SysMange.MaterialPackage add constraint FK_Reference_25 foreign key (MeasureUnitID)
      references SysMange.MeasureUnit (MeasureUnitID);

alter table SysMange.MaterialPackage add constraint FK_Reference_5 foreign key (MaterialID)
      references SysMange.MaterialInfo (MaterialID);

alter table SysMange.MaterialPackage add constraint FK_Reference_9 foreign key (MaterialID)
      references SysMange.MaterialInfo (MaterialID);

alter table SysMange.Menu add constraint FK_Reference_20 foreign key (ModuleID)
      references SysMange.Module (ModuleID);

alter table Organization.MenuRole add constraint FK_Reference_22 foreign key (ModuleRoleID)
      references Organization.ModuleRole (ModuleRoleID);

alter table Organization.ModuleRole add constraint FK_Reference_21 foreign key (DepartmentRoleGUID)
      references Organization.DepartmentRole (DepartmentRoleGUID);

alter table Procurement.PurchaseItems add constraint FK_Reference_10 foreign key (MaterialPackageID)
      references SysMange.MaterialPackage (MaterialPackageID);

alter table Procurement.PurchaseItems add constraint FK_Reference_6 foreign key (PurchaseID)
      references Procurement.Purchase (PurchaseID);

alter table Procurement.PurchaseItems add constraint FK_Reference_8 foreign key (SupplierID)
      references SysMange.Supplier (SupplierID);

alter table SalesProductItem add constraint FK_Reference_12 foreign key (SalesProductID)
      references SalesProduct (SalesProductID);

alter table SalesProductItem add constraint FK_Reference_13 foreign key (ProductID)
      references Sales.Product (ProductID);

alter table SalesProductItem add constraint FK_Reference_14 foreign key (MeasureUnitID)
      references SysMange.MeasureUnit (MeasureUnitID);

alter table Inventory.StockTakingItem add constraint FK_Reference_24 foreign key (StockTakingID)
      references Inventory.StockTaking (StockTakingID);

alter table HR.UserPosition add constraint FK_Reference_1 foreign key (DepartmentGUID)
      references Organization.Department (DepartmentGUID);

alter table Inventory.WarehouseInventory add constraint FK_Reference_16 foreign key (WarehouseRegionID)
      references Inventory.WarehouseRegion (WarehouseRegionID);

alter table Inventory.WarehouseRegion add constraint FK_Reference_15 foreign key (WarehouseID)
      references Inventory.Warehouse (WarehouseID);

