
CREATE TABLE Attachment
(
	AttachmentId	  CHAR(18)  NOT NULL ,
	MailingId	  CHAR(18)  NOT NULL ,
	Content		  BLOB  NULL 
);



CREATE UNIQUE INDEX XPKAttachment ON Attachment
(AttachmentId  ASC);



ALTER TABLE Attachment
	ADD CONSTRAINT  XPKAttachment PRIMARY KEY (AttachmentId);



CREATE TABLE Cashflow
(
	CashflowId	  CHAR(18)  NOT NULL ,
	CompanyId	  CHAR(18)  NOT NULL ,
	CashflowTypeId	  CHAR(18)  NOT NULL ,
	Comment		  VARCHAR2(20)  NULL ,
	OperationDate	  DATE  NULL ,
	Amount		  INTEGER  NULL 
);



CREATE UNIQUE INDEX XPKCashflow ON Cashflow
(CashflowId  ASC);



ALTER TABLE Cashflow
	ADD CONSTRAINT  XPKCashflow PRIMARY KEY (CashflowId);



CREATE TABLE CashflowType
(
	CashflowTypeId	  CHAR(18)  NOT NULL ,
	CashflowTypeName  VARCHAR2(20)  NULL 
);



CREATE UNIQUE INDEX XPKCashflowType ON CashflowType
(CashflowTypeId  ASC);



ALTER TABLE CashflowType
	ADD CONSTRAINT  XPKCashflowType PRIMARY KEY (CashflowTypeId);



CREATE TABLE Company
(
	CompanyId	  CHAR(18)  NOT NULL ,
	Name		  VARCHAR2(20)  NULL ,
	Logo		  BLOB  NULL ,
	CurrentBudget	  INTEGER  NULL 
);



CREATE UNIQUE INDEX XPKCompany ON Company
(CompanyId  ASC);



ALTER TABLE Company
	ADD CONSTRAINT  XPKCompany PRIMARY KEY (CompanyId);



CREATE TABLE Customer
(
	CustomerId	  CHAR(18)  NOT NULL ,
	Name		  VARCHAR2(20)  NULL 
);



CREATE UNIQUE INDEX XPKCustomer ON Customer
(CustomerId  ASC);



ALTER TABLE Customer
	ADD CONSTRAINT  XPKCustomer PRIMARY KEY (CustomerId);



CREATE TABLE Department
(
	DepartmentId	  CHAR(18)  NOT NULL ,
	CompanyId	  CHAR(18)  NOT NULL ,
	Name		  VARCHAR2(20)  NULL 
);



CREATE UNIQUE INDEX XPKDepartment ON Department
(DepartmentId  ASC);



ALTER TABLE Department
	ADD CONSTRAINT  XPKDepartment PRIMARY KEY (DepartmentId);



CREATE TABLE Employee
(
	EmployeeId	  CHAR(18)  NOT NULL ,
	DepartmentId	  CHAR(18)  NOT NULL ,
	EmployeeTypeId	  CHAR(18)  NOT NULL ,
	BirthDate	  VARCHAR2(20)  NULL ,
	LastName	  CHAR(18)  NULL ,
	FirstName	  CHAR(18)  NULL 
);



CREATE UNIQUE INDEX XPKEmployee ON Employee
(EmployeeId  ASC);



ALTER TABLE Employee
	ADD CONSTRAINT  XPKEmployee PRIMARY KEY (EmployeeId);



CREATE TABLE EmployeeType
(
	EmployeeTypeId	  CHAR(18)  NOT NULL ,
	TypeName	  VARCHAR2(20)  NULL 
);



CREATE UNIQUE INDEX XPKEmployeeType ON EmployeeType
(EmployeeTypeId  ASC);



ALTER TABLE EmployeeType
	ADD CONSTRAINT  XPKEmployeeType PRIMARY KEY (EmployeeTypeId);



CREATE TABLE Equipment
(
	EquipmentId	  CHAR(18)  NOT NULL ,
	EquipmentTypeId	  CHAR(18)  NOT NULL ,
	OfficeId	  CHAR(18)  NOT NULL ,
	Quantity	  INTEGER  NULL 
);



CREATE UNIQUE INDEX XPKEquipment ON Equipment
(EquipmentId  ASC);



ALTER TABLE Equipment
	ADD CONSTRAINT  XPKEquipment PRIMARY KEY (EquipmentId);



CREATE TABLE EquipmentType
(
	EquipmentTypeId	  CHAR(18)  NOT NULL ,
	EquipmentTypeName  VARCHAR2(20)  NULL 
);



CREATE UNIQUE INDEX XPKEquipmentType ON EquipmentType
(EquipmentTypeId  ASC);



ALTER TABLE EquipmentType
	ADD CONSTRAINT  XPKEquipmentType PRIMARY KEY (EquipmentTypeId);



CREATE TABLE Mailing
(
	MailingId	  CHAR(18)  NOT NULL ,
	Text		  VARCHAR2(20)  NULL 
);



CREATE UNIQUE INDEX XPKMailing ON Mailing
(MailingId  ASC);



ALTER TABLE Mailing
	ADD CONSTRAINT  XPKMailing PRIMARY KEY (MailingId);



CREATE TABLE Meeting
(
	MeetingId	  CHAR(18)  NOT NULL ,
	Topic		  VARCHAR2(20)  NULL ,
	Organizator	  CHAR(18)  NULL 
);



CREATE UNIQUE INDEX XPKMeeting ON Meeting
(MeetingId  ASC);



ALTER TABLE Meeting
	ADD CONSTRAINT  XPKMeeting PRIMARY KEY (MeetingId);



CREATE TABLE Office
(
	OfficeId	  CHAR(18)  NOT NULL ,
	CompanyId	  CHAR(18)  NOT NULL ,
	Adress		  VARCHAR2(20)  NULL 
);



CREATE UNIQUE INDEX XPKOffice ON Office
(OfficeId  ASC);



ALTER TABLE Office
	ADD CONSTRAINT  XPKOffice PRIMARY KEY (OfficeId);



CREATE TABLE Project
(
	ProjectId	  CHAR(18)  NOT NULL ,
	CompanyId	  CHAR(18)  NOT NULL ,
	CustomerId	  CHAR(18)  NOT NULL ,
	Name		  VARCHAR2(20)  NULL ,
	DateStart	  DATE  NULL ,
	Deadline	  DATE  NULL ,
	Price		  CHAR(18)  NULL 
);



CREATE UNIQUE INDEX XPKProject ON Project
(ProjectId  ASC);



ALTER TABLE Project
	ADD CONSTRAINT  XPKProject PRIMARY KEY (ProjectId);



CREATE TABLE Salary
(
	SalaryId	  CHAR(18)  NOT NULL ,
	EmployeeId	  CHAR(18)  NOT NULL ,
	Amount		  INTEGER  NULL ,
	StartDate	  DATE  NULL ,
	EndDate		  DATE  NULL 
);



CREATE UNIQUE INDEX XPKSalary ON Salary
(SalaryId  ASC);



ALTER TABLE Salary
	ADD CONSTRAINT  XPKSalary PRIMARY KEY (SalaryId);



ALTER TABLE Attachment
	ADD (CONSTRAINT  R_11 FOREIGN KEY (MailingId) REFERENCES Mailing(MailingId));



ALTER TABLE Cashflow
	ADD (CONSTRAINT  R_18 FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId));



ALTER TABLE Cashflow
	ADD (CONSTRAINT  R_19 FOREIGN KEY (CashflowTypeId) REFERENCES CashflowType(CashflowTypeId));



ALTER TABLE Department
	ADD (CONSTRAINT  R_6 FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId));



ALTER TABLE Employee
	ADD (CONSTRAINT  R_4 FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId));



ALTER TABLE Employee
	ADD (CONSTRAINT  R_5 FOREIGN KEY (EmployeeTypeId) REFERENCES EmployeeType(EmployeeTypeId));



ALTER TABLE Equipment
	ADD (CONSTRAINT  R_8 FOREIGN KEY (EquipmentTypeId) REFERENCES EquipmentType(EquipmentTypeId));



ALTER TABLE Equipment
	ADD (CONSTRAINT  R_10 FOREIGN KEY (OfficeId) REFERENCES Office(OfficeId));



ALTER TABLE Office
	ADD (CONSTRAINT  R_9 FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId));



ALTER TABLE Project
	ADD (CONSTRAINT  R_13 FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId));



ALTER TABLE Project
	ADD (CONSTRAINT  R_14 FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId));



ALTER TABLE Salary
	ADD (CONSTRAINT  R_20 FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId));



CREATE  TRIGGER tI_Attachment BEFORE INSERT ON Attachment for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- INSERT trigger on Attachment 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Mailing R/11 Attachment on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f415", PARENT_OWNER="", PARENT_TABLE="Mailing"
    CHILD_OWNER="", CHILD_TABLE="Attachment"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="MailingId" */
    SELECT count(*) INTO NUMROWS
      FROM Mailing
      WHERE
        /* %JoinFKPK(:%New,Mailing," = "," AND") */
        :new.MailingId = Mailing.MailingId;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Attachment because Mailing does not exist.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_Attachment AFTER UPDATE ON Attachment for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on Attachment 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Mailing R/11 Attachment on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000f89c", PARENT_OWNER="", PARENT_TABLE="Mailing"
    CHILD_OWNER="", CHILD_TABLE="Attachment"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="MailingId" */
  SELECT count(*) INTO NUMROWS
    FROM Mailing
    WHERE
      /* %JoinFKPK(:%New,Mailing," = "," AND") */
      :new.MailingId = Mailing.MailingId;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Attachment because Mailing does not exist.'
    );
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/


CREATE  TRIGGER tI_Cashflow BEFORE INSERT ON Cashflow for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- INSERT trigger on Cashflow 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Company R/18 Cashflow on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="000207bc", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Cashflow"
    P2C_VERB_PHRASE="R/18", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="CompanyId" */
    SELECT count(*) INTO NUMROWS
      FROM Company
      WHERE
        /* %JoinFKPK(:%New,Company," = "," AND") */
        :new.CompanyId = Company.CompanyId;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Cashflow because Company does not exist.'
      );
    END IF;

    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* CashflowType R/19 Cashflow on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CashflowType"
    CHILD_OWNER="", CHILD_TABLE="Cashflow"
    P2C_VERB_PHRASE="R/19", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="CashflowTypeId" */
    SELECT count(*) INTO NUMROWS
      FROM CashflowType
      WHERE
        /* %JoinFKPK(:%New,CashflowType," = "," AND") */
        :new.CashflowTypeId = CashflowType.CashflowTypeId;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Cashflow because CashflowType does not exist.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_Cashflow AFTER UPDATE ON Cashflow for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on Cashflow 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Company R/18 Cashflow on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00020d22", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Cashflow"
    P2C_VERB_PHRASE="R/18", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="CompanyId" */
  SELECT count(*) INTO NUMROWS
    FROM Company
    WHERE
      /* %JoinFKPK(:%New,Company," = "," AND") */
      :new.CompanyId = Company.CompanyId;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Cashflow because Company does not exist.'
    );
  END IF;

  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* CashflowType R/19 Cashflow on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CashflowType"
    CHILD_OWNER="", CHILD_TABLE="Cashflow"
    P2C_VERB_PHRASE="R/19", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="CashflowTypeId" */
  SELECT count(*) INTO NUMROWS
    FROM CashflowType
    WHERE
      /* %JoinFKPK(:%New,CashflowType," = "," AND") */
      :new.CashflowTypeId = CashflowType.CashflowTypeId;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Cashflow because CashflowType does not exist.'
    );
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/


CREATE  TRIGGER tD_CashflowType AFTER DELETE ON CashflowType for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- DELETE trigger on CashflowType 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* CashflowType R/19 Cashflow on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f65b", PARENT_OWNER="", PARENT_TABLE="CashflowType"
    CHILD_OWNER="", CHILD_TABLE="Cashflow"
    P2C_VERB_PHRASE="R/19", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="CashflowTypeId" */
    SELECT count(*) INTO NUMROWS
      FROM Cashflow
      WHERE
        /*  %JoinFKPK(Cashflow,:%Old," = "," AND") */
        Cashflow.CashflowTypeId = :old.CashflowTypeId;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete CashflowType because Cashflow exists.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_CashflowType AFTER UPDATE ON CashflowType for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on CashflowType 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* CashflowType R/19 Cashflow on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000125b6", PARENT_OWNER="", PARENT_TABLE="CashflowType"
    CHILD_OWNER="", CHILD_TABLE="Cashflow"
    P2C_VERB_PHRASE="R/19", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="CashflowTypeId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    CashflowType.CashflowTypeId <> CashflowType.CashflowTypeId
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Cashflow
      WHERE
        /*  %JoinFKPK(Cashflow,:%Old," = "," AND") */
        Cashflow.CashflowTypeId = :old.CashflowTypeId;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update CashflowType because Cashflow exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/


CREATE  TRIGGER tD_Company AFTER DELETE ON Company for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- DELETE trigger on Company 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Company R/6 Department on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0003d607", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Department"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="CompanyId" */
    SELECT count(*) INTO NUMROWS
      FROM Department
      WHERE
        /*  %JoinFKPK(Department,:%Old," = "," AND") */
        Department.CompanyId = :old.CompanyId;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Company because Department exists.'
      );
    END IF;

    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Company R/9 Office on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Office"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="CompanyId" */
    SELECT count(*) INTO NUMROWS
      FROM Office
      WHERE
        /*  %JoinFKPK(Office,:%Old," = "," AND") */
        Office.CompanyId = :old.CompanyId;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Company because Office exists.'
      );
    END IF;

    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Company R/14 Project on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Project"
    P2C_VERB_PHRASE="R/14", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="CompanyId" */
    SELECT count(*) INTO NUMROWS
      FROM Project
      WHERE
        /*  %JoinFKPK(Project,:%Old," = "," AND") */
        Project.CompanyId = :old.CompanyId;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Company because Project exists.'
      );
    END IF;

    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Company R/18 Cashflow on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Cashflow"
    P2C_VERB_PHRASE="R/18", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="CompanyId" */
    SELECT count(*) INTO NUMROWS
      FROM Cashflow
      WHERE
        /*  %JoinFKPK(Cashflow,:%Old," = "," AND") */
        Cashflow.CompanyId = :old.CompanyId;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Company because Cashflow exists.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_Company AFTER UPDATE ON Company for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on Company 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Company R/6 Department on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000450bb", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Department"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="CompanyId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    Company.CompanyId <> Company.CompanyId
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Department
      WHERE
        /*  %JoinFKPK(Department,:%Old," = "," AND") */
        Department.CompanyId = :old.CompanyId;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Company because Department exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Company R/9 Office on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Office"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="CompanyId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    Company.CompanyId <> Company.CompanyId
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Office
      WHERE
        /*  %JoinFKPK(Office,:%Old," = "," AND") */
        Office.CompanyId = :old.CompanyId;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Company because Office exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Company R/14 Project on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Project"
    P2C_VERB_PHRASE="R/14", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="CompanyId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    Company.CompanyId <> Company.CompanyId
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Project
      WHERE
        /*  %JoinFKPK(Project,:%Old," = "," AND") */
        Project.CompanyId = :old.CompanyId;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Company because Project exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Company R/18 Cashflow on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Cashflow"
    P2C_VERB_PHRASE="R/18", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="CompanyId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    Company.CompanyId <> Company.CompanyId
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Cashflow
      WHERE
        /*  %JoinFKPK(Cashflow,:%Old," = "," AND") */
        Cashflow.CompanyId = :old.CompanyId;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Company because Cashflow exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/


CREATE  TRIGGER tD_Customer AFTER DELETE ON Customer for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- DELETE trigger on Customer 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Customer R/13 Project on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000dcb4", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Project"
    P2C_VERB_PHRASE="R/13", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="CustomerId" */
    SELECT count(*) INTO NUMROWS
      FROM Project
      WHERE
        /*  %JoinFKPK(Project,:%Old," = "," AND") */
        Project.CustomerId = :old.CustomerId;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Customer because Project exists.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_Customer AFTER UPDATE ON Customer for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on Customer 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Customer R/13 Project on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00010909", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Project"
    P2C_VERB_PHRASE="R/13", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="CustomerId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    Customer.CustomerId <> Customer.CustomerId
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Project
      WHERE
        /*  %JoinFKPK(Project,:%Old," = "," AND") */
        Project.CustomerId = :old.CustomerId;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Customer because Project exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/


CREATE  TRIGGER tI_Department BEFORE INSERT ON Department for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- INSERT trigger on Department 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Company R/6 Department on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000fc1c", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Department"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="CompanyId" */
    SELECT count(*) INTO NUMROWS
      FROM Company
      WHERE
        /* %JoinFKPK(:%New,Company," = "," AND") */
        :new.CompanyId = Company.CompanyId;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Department because Company does not exist.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tD_Department AFTER DELETE ON Department for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- DELETE trigger on Department 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Department R/4 Employee on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e54b", PARENT_OWNER="", PARENT_TABLE="Department"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="R/4", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="DepartmentId" */
    SELECT count(*) INTO NUMROWS
      FROM Employee
      WHERE
        /*  %JoinFKPK(Employee,:%Old," = "," AND") */
        Employee.DepartmentId = :old.DepartmentId;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Department because Employee exists.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_Department AFTER UPDATE ON Department for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on Department 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Department R/4 Employee on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00022de0", PARENT_OWNER="", PARENT_TABLE="Department"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="R/4", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="DepartmentId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    Department.DepartmentId <> Department.DepartmentId
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Employee
      WHERE
        /*  %JoinFKPK(Employee,:%Old," = "," AND") */
        Employee.DepartmentId = :old.DepartmentId;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Department because Employee exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Company R/6 Department on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Department"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="CompanyId" */
  SELECT count(*) INTO NUMROWS
    FROM Company
    WHERE
      /* %JoinFKPK(:%New,Company," = "," AND") */
      :new.CompanyId = Company.CompanyId;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Department because Company does not exist.'
    );
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/


CREATE  TRIGGER tI_Employee BEFORE INSERT ON Employee for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- INSERT trigger on Employee 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Department R/4 Employee on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00022450", PARENT_OWNER="", PARENT_TABLE="Department"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="R/4", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="DepartmentId" */
    SELECT count(*) INTO NUMROWS
      FROM Department
      WHERE
        /* %JoinFKPK(:%New,Department," = "," AND") */
        :new.DepartmentId = Department.DepartmentId;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Employee because Department does not exist.'
      );
    END IF;

    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* EmployeeType R/5 Employee on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EmployeeType"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="R/5", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="EmployeeTypeId" */
    SELECT count(*) INTO NUMROWS
      FROM EmployeeType
      WHERE
        /* %JoinFKPK(:%New,EmployeeType," = "," AND") */
        :new.EmployeeTypeId = EmployeeType.EmployeeTypeId;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Employee because EmployeeType does not exist.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tD_Employee AFTER DELETE ON Employee for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- DELETE trigger on Employee 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Employee R/20 Salary on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e312", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Salary"
    P2C_VERB_PHRASE="R/20", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="EmployeeId" */
    SELECT count(*) INTO NUMROWS
      FROM Salary
      WHERE
        /*  %JoinFKPK(Salary,:%Old," = "," AND") */
        Salary.EmployeeId = :old.EmployeeId;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Employee because Salary exists.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_Employee AFTER UPDATE ON Employee for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on Employee 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Employee R/20 Salary on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00033863", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Salary"
    P2C_VERB_PHRASE="R/20", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="EmployeeId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    Employee.EmployeeId <> Employee.EmployeeId
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Salary
      WHERE
        /*  %JoinFKPK(Salary,:%Old," = "," AND") */
        Salary.EmployeeId = :old.EmployeeId;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Employee because Salary exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Department R/4 Employee on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Department"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="R/4", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="DepartmentId" */
  SELECT count(*) INTO NUMROWS
    FROM Department
    WHERE
      /* %JoinFKPK(:%New,Department," = "," AND") */
      :new.DepartmentId = Department.DepartmentId;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Employee because Department does not exist.'
    );
  END IF;

  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* EmployeeType R/5 Employee on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EmployeeType"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="R/5", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="EmployeeTypeId" */
  SELECT count(*) INTO NUMROWS
    FROM EmployeeType
    WHERE
      /* %JoinFKPK(:%New,EmployeeType," = "," AND") */
      :new.EmployeeTypeId = EmployeeType.EmployeeTypeId;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Employee because EmployeeType does not exist.'
    );
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/


CREATE  TRIGGER tD_EmployeeType AFTER DELETE ON EmployeeType for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- DELETE trigger on EmployeeType 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* EmployeeType R/5 Employee on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f145", PARENT_OWNER="", PARENT_TABLE="EmployeeType"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="R/5", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="EmployeeTypeId" */
    SELECT count(*) INTO NUMROWS
      FROM Employee
      WHERE
        /*  %JoinFKPK(Employee,:%Old," = "," AND") */
        Employee.EmployeeTypeId = :old.EmployeeTypeId;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete EmployeeType because Employee exists.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_EmployeeType AFTER UPDATE ON EmployeeType for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on EmployeeType 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* EmployeeType R/5 Employee on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00012288", PARENT_OWNER="", PARENT_TABLE="EmployeeType"
    CHILD_OWNER="", CHILD_TABLE="Employee"
    P2C_VERB_PHRASE="R/5", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="EmployeeTypeId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    EmployeeType.EmployeeTypeId <> EmployeeType.EmployeeTypeId
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Employee
      WHERE
        /*  %JoinFKPK(Employee,:%Old," = "," AND") */
        Employee.EmployeeTypeId = :old.EmployeeTypeId;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update EmployeeType because Employee exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/


CREATE  TRIGGER tI_Equipment BEFORE INSERT ON Equipment for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- INSERT trigger on Equipment 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* EquipmentType R/8 Equipment on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00020871", PARENT_OWNER="", PARENT_TABLE="EquipmentType"
    CHILD_OWNER="", CHILD_TABLE="Equipment"
    P2C_VERB_PHRASE="R/8", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="EquipmentTypeId" */
    SELECT count(*) INTO NUMROWS
      FROM EquipmentType
      WHERE
        /* %JoinFKPK(:%New,EquipmentType," = "," AND") */
        :new.EquipmentTypeId = EquipmentType.EquipmentTypeId;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Equipment because EquipmentType does not exist.'
      );
    END IF;

    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Office R/10 Equipment on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Office"
    CHILD_OWNER="", CHILD_TABLE="Equipment"
    P2C_VERB_PHRASE="R/10", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="OfficeId" */
    SELECT count(*) INTO NUMROWS
      FROM Office
      WHERE
        /* %JoinFKPK(:%New,Office," = "," AND") */
        :new.OfficeId = Office.OfficeId;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Equipment because Office does not exist.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_Equipment AFTER UPDATE ON Equipment for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on Equipment 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* EquipmentType R/8 Equipment on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="000207ff", PARENT_OWNER="", PARENT_TABLE="EquipmentType"
    CHILD_OWNER="", CHILD_TABLE="Equipment"
    P2C_VERB_PHRASE="R/8", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="EquipmentTypeId" */
  SELECT count(*) INTO NUMROWS
    FROM EquipmentType
    WHERE
      /* %JoinFKPK(:%New,EquipmentType," = "," AND") */
      :new.EquipmentTypeId = EquipmentType.EquipmentTypeId;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Equipment because EquipmentType does not exist.'
    );
  END IF;

  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Office R/10 Equipment on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Office"
    CHILD_OWNER="", CHILD_TABLE="Equipment"
    P2C_VERB_PHRASE="R/10", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="OfficeId" */
  SELECT count(*) INTO NUMROWS
    FROM Office
    WHERE
      /* %JoinFKPK(:%New,Office," = "," AND") */
      :new.OfficeId = Office.OfficeId;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Equipment because Office does not exist.'
    );
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/


CREATE  TRIGGER tD_EquipmentType AFTER DELETE ON EquipmentType for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- DELETE trigger on EquipmentType 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* EquipmentType R/8 Equipment on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f38c", PARENT_OWNER="", PARENT_TABLE="EquipmentType"
    CHILD_OWNER="", CHILD_TABLE="Equipment"
    P2C_VERB_PHRASE="R/8", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="EquipmentTypeId" */
    SELECT count(*) INTO NUMROWS
      FROM Equipment
      WHERE
        /*  %JoinFKPK(Equipment,:%Old," = "," AND") */
        Equipment.EquipmentTypeId = :old.EquipmentTypeId;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete EquipmentType because Equipment exists.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_EquipmentType AFTER UPDATE ON EquipmentType for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on EquipmentType 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* EquipmentType R/8 Equipment on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00012787", PARENT_OWNER="", PARENT_TABLE="EquipmentType"
    CHILD_OWNER="", CHILD_TABLE="Equipment"
    P2C_VERB_PHRASE="R/8", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="EquipmentTypeId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    EquipmentType.EquipmentTypeId <> EquipmentType.EquipmentTypeId
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Equipment
      WHERE
        /*  %JoinFKPK(Equipment,:%Old," = "," AND") */
        Equipment.EquipmentTypeId = :old.EquipmentTypeId;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update EquipmentType because Equipment exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/


CREATE  TRIGGER tD_Mailing AFTER DELETE ON Mailing for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- DELETE trigger on Mailing 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Mailing R/11 Attachment on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000ea1d", PARENT_OWNER="", PARENT_TABLE="Mailing"
    CHILD_OWNER="", CHILD_TABLE="Attachment"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="MailingId" */
    SELECT count(*) INTO NUMROWS
      FROM Attachment
      WHERE
        /*  %JoinFKPK(Attachment,:%Old," = "," AND") */
        Attachment.MailingId = :old.MailingId;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Mailing because Attachment exists.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_Mailing AFTER UPDATE ON Mailing for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on Mailing 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Mailing R/11 Attachment on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000106f4", PARENT_OWNER="", PARENT_TABLE="Mailing"
    CHILD_OWNER="", CHILD_TABLE="Attachment"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="MailingId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    Mailing.MailingId <> Mailing.MailingId
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Attachment
      WHERE
        /*  %JoinFKPK(Attachment,:%Old," = "," AND") */
        Attachment.MailingId = :old.MailingId;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Mailing because Attachment exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/


CREATE  TRIGGER tI_Office BEFORE INSERT ON Office for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- INSERT trigger on Office 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Company R/9 Office on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000ee46", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Office"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="CompanyId" */
    SELECT count(*) INTO NUMROWS
      FROM Company
      WHERE
        /* %JoinFKPK(:%New,Company," = "," AND") */
        :new.CompanyId = Company.CompanyId;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Office because Company does not exist.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tD_Office AFTER DELETE ON Office for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- DELETE trigger on Office 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Office R/10 Equipment on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e607", PARENT_OWNER="", PARENT_TABLE="Office"
    CHILD_OWNER="", CHILD_TABLE="Equipment"
    P2C_VERB_PHRASE="R/10", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="OfficeId" */
    SELECT count(*) INTO NUMROWS
      FROM Equipment
      WHERE
        /*  %JoinFKPK(Equipment,:%Old," = "," AND") */
        Equipment.OfficeId = :old.OfficeId;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Office because Equipment exists.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_Office AFTER UPDATE ON Office for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on Office 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Office R/10 Equipment on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00020c6a", PARENT_OWNER="", PARENT_TABLE="Office"
    CHILD_OWNER="", CHILD_TABLE="Equipment"
    P2C_VERB_PHRASE="R/10", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="OfficeId" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    Office.OfficeId <> Office.OfficeId
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Equipment
      WHERE
        /*  %JoinFKPK(Equipment,:%Old," = "," AND") */
        Equipment.OfficeId = :old.OfficeId;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Office because Equipment exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Company R/9 Office on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Office"
    P2C_VERB_PHRASE="R/9", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_9", FK_COLUMNS="CompanyId" */
  SELECT count(*) INTO NUMROWS
    FROM Company
    WHERE
      /* %JoinFKPK(:%New,Company," = "," AND") */
      :new.CompanyId = Company.CompanyId;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Office because Company does not exist.'
    );
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/


CREATE  TRIGGER tI_Project BEFORE INSERT ON Project for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- INSERT trigger on Project 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Customer R/13 Project on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001ff31", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Project"
    P2C_VERB_PHRASE="R/13", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="CustomerId" */
    SELECT count(*) INTO NUMROWS
      FROM Customer
      WHERE
        /* %JoinFKPK(:%New,Customer," = "," AND") */
        :new.CustomerId = Customer.CustomerId;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Project because Customer does not exist.'
      );
    END IF;

    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Company R/14 Project on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Project"
    P2C_VERB_PHRASE="R/14", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="CompanyId" */
    SELECT count(*) INTO NUMROWS
      FROM Company
      WHERE
        /* %JoinFKPK(:%New,Company," = "," AND") */
        :new.CompanyId = Company.CompanyId;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Project because Company does not exist.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_Project AFTER UPDATE ON Project for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on Project 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Customer R/13 Project on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001feca", PARENT_OWNER="", PARENT_TABLE="Customer"
    CHILD_OWNER="", CHILD_TABLE="Project"
    P2C_VERB_PHRASE="R/13", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="CustomerId" */
  SELECT count(*) INTO NUMROWS
    FROM Customer
    WHERE
      /* %JoinFKPK(:%New,Customer," = "," AND") */
      :new.CustomerId = Customer.CustomerId;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Project because Customer does not exist.'
    );
  END IF;

  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Company R/14 Project on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Company"
    CHILD_OWNER="", CHILD_TABLE="Project"
    P2C_VERB_PHRASE="R/14", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="CompanyId" */
  SELECT count(*) INTO NUMROWS
    FROM Company
    WHERE
      /* %JoinFKPK(:%New,Company," = "," AND") */
      :new.CompanyId = Company.CompanyId;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Project because Company does not exist.'
    );
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/


CREATE  TRIGGER tI_Salary BEFORE INSERT ON Salary for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- INSERT trigger on Salary 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
    /* Employee R/20 Salary on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000fc9b", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Salary"
    P2C_VERB_PHRASE="R/20", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="EmployeeId" */
    SELECT count(*) INTO NUMROWS
      FROM Employee
      WHERE
        /* %JoinFKPK(:%New,Employee," = "," AND") */
        :new.EmployeeId = Employee.EmployeeId;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Salary because Employee does not exist.'
      );
    END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

CREATE  TRIGGER tU_Salary AFTER UPDATE ON Salary for each row
-- ERwin Builtin 13 травня 2015 р. 2:12:13
-- UPDATE trigger on Salary 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 13 травня 2015 р. 2:12:13 */
  /* Employee R/20 Salary on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000fb58", PARENT_OWNER="", PARENT_TABLE="Employee"
    CHILD_OWNER="", CHILD_TABLE="Salary"
    P2C_VERB_PHRASE="R/20", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="EmployeeId" */
  SELECT count(*) INTO NUMROWS
    FROM Employee
    WHERE
      /* %JoinFKPK(:%New,Employee," = "," AND") */
      :new.EmployeeId = Employee.EmployeeId;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Salary because Employee does not exist.'
    );
  END IF;


-- ERwin Builtin 13 травня 2015 р. 2:12:13
END;
/

