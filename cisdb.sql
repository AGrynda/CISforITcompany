/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     19.05.2015 2:36:35                           */
/*==============================================================*/


drop index R_11_FK;

drop index ATTACHMENT_PK;

drop table Attachment;

drop index R_19_FK;

drop index R_18_FK;

drop index CASHFLOW_PK;

drop table Cashflow;

drop index CASHFLOWTYPE_PK;

drop table CashflowType;

drop index COMPANY_PK;

drop table Company;

drop index CUSTOMER_PK;

drop table Customer;

drop index R_6_FK;

drop index DEPARTMENT_PK;

drop table Department;

drop index R_5_FK;

drop index R_4_FK;

drop index EMPLOYEE_PK;

drop table Employee;

drop index EMPLOYEETYPE_PK;

drop table EmployeeType;

drop index R_10_FK;

drop index R_8_FK;

drop index EQUIPMENT_PK;

drop table Equipment;

drop index EQUIPMENTTYPE_PK;

drop table EquipmentType;

drop index MAILING_PK;

drop table Mailing;

drop index MEETING_PK;

drop table Meeting;

drop index R_9_FK;

drop index OFFICE_PK;

drop table Office;

drop index R_14_FK;

drop index R_13_FK;

drop index PROJECT_PK;

drop table Project;

drop index R_12_FK2;

drop index R_12_FK;

drop table R_12;

drop index R_15_FK2;

drop index R_15_FK;

drop table R_15;

drop index R_7_FK2;

drop index R_7_FK;

drop table R_7;

drop index R_20_FK;

drop index SALARY_PK;

drop table Salary;

drop domain "<default>";

drop domain "<root>";

drop domain Blob;

drop domain Datetime;

drop domain Number;

drop domain String;

/*==============================================================*/
/* Domain: "<default>"                                          */
/*==============================================================*/
create domain "<default>" as CHAR(18);

/*==============================================================*/
/* Domain: "<root>"                                             */
/*==============================================================*/
create domain "<root>" as CHAR(18);

/*==============================================================*/
/* Domain: Blob                                                 */
/*==============================================================*/
create domain Blob as CHAR;

/*==============================================================*/
/* Domain: Datetime                                             */
/*==============================================================*/
create domain Datetime as DATE;

/*==============================================================*/
/* Domain: Number                                               */
/*==============================================================*/
create domain Number as INT4;

/*==============================================================*/
/* Domain: String                                               */
/*==============================================================*/
create domain String as VARCHAR(20);

/*==============================================================*/
/* Table: Attachment                                            */
/*==============================================================*/
create table Attachment (
   AttachmentId         "<default>"          not null,
   MailingId            "<default>"          not null,
   Content              Blob                 null,
   constraint PK_ATTACHMENT primary key (AttachmentId)
);

/*==============================================================*/
/* Index: ATTACHMENT_PK                                         */
/*==============================================================*/
create unique index ATTACHMENT_PK on Attachment (
AttachmentId
);

/*==============================================================*/
/* Index: R_11_FK                                               */
/*==============================================================*/
create  index R_11_FK on Attachment (
MailingId
);

/*==============================================================*/
/* Table: Cashflow                                              */
/*==============================================================*/
create table Cashflow (
   CashflowId           "<default>"          not null,
   CompanyId            "<default>"          not null,
   CashflowTypeId       "<default>"          not null,
   Comment              String               null,
   OperationDate        Datetime             null,
   Amount               Number               null,
   constraint PK_CASHFLOW primary key (CashflowId)
);

/*==============================================================*/
/* Index: CASHFLOW_PK                                           */
/*==============================================================*/
create unique index CASHFLOW_PK on Cashflow (
CashflowId
);

/*==============================================================*/
/* Index: R_18_FK                                               */
/*==============================================================*/
create  index R_18_FK on Cashflow (
CompanyId
);

/*==============================================================*/
/* Index: R_19_FK                                               */
/*==============================================================*/
create  index R_19_FK on Cashflow (
CashflowTypeId
);

/*==============================================================*/
/* Table: CashflowType                                          */
/*==============================================================*/
create table CashflowType (
   CashflowTypeId       "<default>"          not null,
   CashflowTypeName     String               null,
   constraint PK_CASHFLOWTYPE primary key (CashflowTypeId)
);

/*==============================================================*/
/* Index: CASHFLOWTYPE_PK                                       */
/*==============================================================*/
create unique index CASHFLOWTYPE_PK on CashflowType (
CashflowTypeId
);

/*==============================================================*/
/* Table: Company                                               */
/*==============================================================*/
create table Company (
   CompanyId            "<default>"          not null,
   Name                 String               null,
   Logo                 Blob                 null,
   CurrentBudget        Number               null,
   constraint PK_COMPANY primary key (CompanyId)
);

/*==============================================================*/
/* Index: COMPANY_PK                                            */
/*==============================================================*/
create unique index COMPANY_PK on Company (
CompanyId
);

/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table Customer (
   CustomerId           "<default>"          not null,
   Name                 String               null,
   constraint PK_CUSTOMER primary key (CustomerId)
);

/*==============================================================*/
/* Index: CUSTOMER_PK                                           */
/*==============================================================*/
create unique index CUSTOMER_PK on Customer (
CustomerId
);

/*==============================================================*/
/* Table: Department                                            */
/*==============================================================*/
create table Department (
   DepartmentId         "<default>"          not null,
   CompanyId            "<default>"          not null,
   Name                 String               null,
   constraint PK_DEPARTMENT primary key (DepartmentId)
);

/*==============================================================*/
/* Index: DEPARTMENT_PK                                         */
/*==============================================================*/
create unique index DEPARTMENT_PK on Department (
DepartmentId
);

/*==============================================================*/
/* Index: R_6_FK                                                */
/*==============================================================*/
create  index R_6_FK on Department (
CompanyId
);

/*==============================================================*/
/* Table: Employee                                              */
/*==============================================================*/
create table Employee (
   EmployeeId           "<default>"          not null,
   DepartmentId         "<default>"          not null,
   EmployeeTypeId       "<default>"          not null,
   BirthDate            String               null,
   LastName             "<default>"          null,
   FirstName            "<default>"          null,
   constraint PK_EMPLOYEE primary key (EmployeeId)
);

/*==============================================================*/
/* Index: EMPLOYEE_PK                                           */
/*==============================================================*/
create unique index EMPLOYEE_PK on Employee (
EmployeeId
);

/*==============================================================*/
/* Index: R_4_FK                                                */
/*==============================================================*/
create  index R_4_FK on Employee (
DepartmentId
);

/*==============================================================*/
/* Index: R_5_FK                                                */
/*==============================================================*/
create  index R_5_FK on Employee (
EmployeeTypeId
);

/*==============================================================*/
/* Table: EmployeeType                                          */
/*==============================================================*/
create table EmployeeType (
   EmployeeTypeId       "<default>"          not null,
   TypeName             String               null,
   constraint PK_EMPLOYEETYPE primary key (EmployeeTypeId)
);

/*==============================================================*/
/* Index: EMPLOYEETYPE_PK                                       */
/*==============================================================*/
create unique index EMPLOYEETYPE_PK on EmployeeType (
EmployeeTypeId
);

/*==============================================================*/
/* Table: Equipment                                             */
/*==============================================================*/
create table Equipment (
   EquipmentId          "<default>"          not null,
   EquipmentTypeId      "<default>"          not null,
   OfficeId             "<default>"          not null,
   Quantity             Number               null,
   constraint PK_EQUIPMENT primary key (EquipmentId)
);

/*==============================================================*/
/* Index: EQUIPMENT_PK                                          */
/*==============================================================*/
create unique index EQUIPMENT_PK on Equipment (
EquipmentId
);

/*==============================================================*/
/* Index: R_8_FK                                                */
/*==============================================================*/
create  index R_8_FK on Equipment (
EquipmentTypeId
);

/*==============================================================*/
/* Index: R_10_FK                                               */
/*==============================================================*/
create  index R_10_FK on Equipment (
OfficeId
);

/*==============================================================*/
/* Table: EquipmentType                                         */
/*==============================================================*/
create table EquipmentType (
   EquipmentTypeId      "<default>"          not null,
   EquipmentTypeName    String               null,
   constraint PK_EQUIPMENTTYPE primary key (EquipmentTypeId)
);

/*==============================================================*/
/* Index: EQUIPMENTTYPE_PK                                      */
/*==============================================================*/
create unique index EQUIPMENTTYPE_PK on EquipmentType (
EquipmentTypeId
);

/*==============================================================*/
/* Table: Mailing                                               */
/*==============================================================*/
create table Mailing (
   MailingId            "<default>"          not null,
   Text                 String               null,
   constraint PK_MAILING primary key (MailingId)
);

/*==============================================================*/
/* Index: MAILING_PK                                            */
/*==============================================================*/
create unique index MAILING_PK on Mailing (
MailingId
);

/*==============================================================*/
/* Table: Meeting                                               */
/*==============================================================*/
create table Meeting (
   MeetingId            "<default>"          not null,
   Topic                String               null,
   Organizator          "<default>"          null,
   constraint PK_MEETING primary key (MeetingId)
);

/*==============================================================*/
/* Index: MEETING_PK                                            */
/*==============================================================*/
create unique index MEETING_PK on Meeting (
MeetingId
);

/*==============================================================*/
/* Table: Office                                                */
/*==============================================================*/
create table Office (
   OfficeId             "<default>"          not null,
   CompanyId            "<default>"          not null,
   Adress               String               null,
   constraint PK_OFFICE primary key (OfficeId)
);

/*==============================================================*/
/* Index: OFFICE_PK                                             */
/*==============================================================*/
create unique index OFFICE_PK on Office (
OfficeId
);

/*==============================================================*/
/* Index: R_9_FK                                                */
/*==============================================================*/
create  index R_9_FK on Office (
CompanyId
);

/*==============================================================*/
/* Table: Project                                               */
/*==============================================================*/
create table Project (
   ProjectId            "<default>"          not null,
   CompanyId            "<default>"          not null,
   CustomerId           "<default>"          not null,
   Name                 String               null,
   DateStart            Datetime             null,
   Deadline             Datetime             null,
   Price                "<default>"          null,
   constraint PK_PROJECT primary key (ProjectId)
);

/*==============================================================*/
/* Index: PROJECT_PK                                            */
/*==============================================================*/
create unique index PROJECT_PK on Project (
ProjectId
);

/*==============================================================*/
/* Index: R_13_FK                                               */
/*==============================================================*/
create  index R_13_FK on Project (
CustomerId
);

/*==============================================================*/
/* Index: R_14_FK                                               */
/*==============================================================*/
create  index R_14_FK on Project (
CompanyId
);

/*==============================================================*/
/* Table: R_12                                                  */
/*==============================================================*/
create table R_12 (
   MailingId            "<default>"          not null,
   EmployeeId           "<default>"          not null
);

/*==============================================================*/
/* Index: R_12_FK                                               */
/*==============================================================*/
create  index R_12_FK on R_12 (
MailingId
);

/*==============================================================*/
/* Index: R_12_FK2                                              */
/*==============================================================*/
create  index R_12_FK2 on R_12 (
EmployeeId
);

/*==============================================================*/
/* Table: R_15                                                  */
/*==============================================================*/
create table R_15 (
   EmployeeId           "<default>"          not null,
   MeetingId            "<default>"          not null
);

/*==============================================================*/
/* Index: R_15_FK                                               */
/*==============================================================*/
create  index R_15_FK on R_15 (
EmployeeId
);

/*==============================================================*/
/* Index: R_15_FK2                                              */
/*==============================================================*/
create  index R_15_FK2 on R_15 (
MeetingId
);

/*==============================================================*/
/* Table: R_7                                                   */
/*==============================================================*/
create table R_7 (
   ProjectId            "<default>"          not null,
   EmployeeId           "<default>"          not null
);

/*==============================================================*/
/* Index: R_7_FK                                                */
/*==============================================================*/
create  index R_7_FK on R_7 (
ProjectId
);

/*==============================================================*/
/* Index: R_7_FK2                                               */
/*==============================================================*/
create  index R_7_FK2 on R_7 (
EmployeeId
);

/*==============================================================*/
/* Table: Salary                                                */
/*==============================================================*/
create table Salary (
   SalaryId             "<default>"          not null,
   EmployeeId           "<default>"          not null,
   Amount               Number               null,
   StartDate            Datetime             null,
   EndDate              Datetime             null,
   constraint PK_SALARY primary key (SalaryId)
);

/*==============================================================*/
/* Index: SALARY_PK                                             */
/*==============================================================*/
create unique index SALARY_PK on Salary (
SalaryId
);

/*==============================================================*/
/* Index: R_20_FK                                               */
/*==============================================================*/
create  index R_20_FK on Salary (
EmployeeId
);

alter table Attachment
   add constraint FK_ATTACHME_R_11_MAILING foreign key (MailingId)
      references Mailing (MailingId)
      on delete restrict on update restrict;

alter table Cashflow
   add constraint FK_CASHFLOW_R_18_COMPANY foreign key (CompanyId)
      references Company (CompanyId)
      on delete restrict on update restrict;

alter table Cashflow
   add constraint FK_CASHFLOW_R_19_CASHFLOW foreign key (CashflowTypeId)
      references CashflowType (CashflowTypeId)
      on delete restrict on update restrict;

alter table Department
   add constraint FK_DEPARTME_R_6_COMPANY foreign key (CompanyId)
      references Company (CompanyId)
      on delete restrict on update restrict;

alter table Employee
   add constraint FK_EMPLOYEE_R_4_DEPARTME foreign key (DepartmentId)
      references Department (DepartmentId)
      on delete restrict on update restrict;

alter table Employee
   add constraint FK_EMPLOYEE_R_5_EMPLOYEE foreign key (EmployeeTypeId)
      references EmployeeType (EmployeeTypeId)
      on delete restrict on update restrict;

alter table Equipment
   add constraint FK_EQUIPMEN_R_10_OFFICE foreign key (OfficeId)
      references Office (OfficeId)
      on delete restrict on update restrict;

alter table Equipment
   add constraint FK_EQUIPMEN_R_8_EQUIPMEN foreign key (EquipmentTypeId)
      references EquipmentType (EquipmentTypeId)
      on delete restrict on update restrict;

alter table Office
   add constraint FK_OFFICE_R_9_COMPANY foreign key (CompanyId)
      references Company (CompanyId)
      on delete restrict on update restrict;

alter table Project
   add constraint FK_PROJECT_R_13_CUSTOMER foreign key (CustomerId)
      references Customer (CustomerId)
      on delete restrict on update restrict;

alter table Project
   add constraint FK_PROJECT_R_14_COMPANY foreign key (CompanyId)
      references Company (CompanyId)
      on delete restrict on update restrict;

alter table R_12
   add constraint FK_R_12_R_12_EMPLOYEE foreign key (EmployeeId)
      references Employee (EmployeeId)
      on delete restrict on update restrict;

alter table R_12
   add constraint FK_R_12_R_12_MAILING foreign key (MailingId)
      references Mailing (MailingId)
      on delete restrict on update restrict;

alter table R_15
   add constraint FK_R_15_R_15_EMPLOYEE foreign key (EmployeeId)
      references Employee (EmployeeId)
      on delete restrict on update restrict;

alter table R_15
   add constraint FK_R_15_R_15_MEETING foreign key (MeetingId)
      references Meeting (MeetingId)
      on delete restrict on update restrict;

alter table R_7
   add constraint FK_R_7_R_7_EMPLOYEE foreign key (EmployeeId)
      references Employee (EmployeeId)
      on delete restrict on update restrict;

alter table R_7
   add constraint FK_R_7_R_7_PROJECT foreign key (ProjectId)
      references Project (ProjectId)
      on delete restrict on update restrict;

alter table Salary
   add constraint FK_SALARY_R_20_EMPLOYEE foreign key (EmployeeId)
      references Employee (EmployeeId)
      on delete restrict on update restrict;

