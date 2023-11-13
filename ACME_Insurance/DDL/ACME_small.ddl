
CREATE TABLE Claim
( 
	Claim_Identifier     int  NOT NULL ,
	Catastrophe_Identifier int  NULL ,
	Claim_Description    varchar(5000)  NULL ,
	Claims_Made_Date     datetime  NULL ,
	Company_Claim_Number varchar(20)  NULL ,
	Company_Subclaim_Number varchar(5)  NULL ,
	Insurable_Object_Identifier int  NULL ,
	Occurrence_Identifier int  NULL ,
	Entry_Into_Claims_Made_Program_Date datetime  NULL ,
	Claim_Open_Date      datetime  NULL ,
	Claim_Close_Date     datetime  NULL ,
	Claim_Reopen_Date    datetime  NULL ,
	Claim_Status_Code    varchar(5)  NULL ,
	Claim_Reported_Date  datetime  NULL ,
	 PRIMARY KEY (Claim_Identifier ASC),
	 FOREIGN KEY (Catastrophe_Identifier) REFERENCES Catastrophe(Catastrophe_Identifier),
 FOREIGN KEY (Claim_Identifier) REFERENCES Claim(Claim_Identifier),
 FOREIGN KEY (Insurable_Object_Identifier) REFERENCES Insurable_Object(Insurable_Object_Identifier),
 FOREIGN KEY (Occurrence_Identifier) REFERENCES Occurrence(Occurrence_Identifier)
)

CREATE TABLE Claim_Amount
( 
	Claim_Amount_Identifier bigint  NOT NULL ,
	Claim_Identifier     int  NOT NULL ,
	Claim_Offer_Identifier int  NULL ,
	Amount_Type_Code     varchar(20)  NULL ,
	Event_Date           datetime  NULL ,
	Claim_Amount         decimal(15,2)  NULL ,
	Insurance_Type_Code  char(1)  NULL ,
	 PRIMARY KEY (Claim_Amount_Identifier ASC),
	 FOREIGN KEY (Claim_Offer_Identifier) REFERENCES Claim_Offer(Claim_Offer_Identifier),
 FOREIGN KEY (Claim_Identifier) REFERENCES Claim(Claim_Identifier)
)

CREATE TABLE Loss_Payment
( 
	Claim_Amount_Identifier bigint  NOT NULL ,
	 PRIMARY KEY (Claim_Amount_Identifier ASC),
	 FOREIGN KEY (Claim_Amount_Identifier) REFERENCES Claim_Payment(Claim_Amount_Identifier)
)

CREATE TABLE Loss_Reserve
( 
	Claim_Amount_Identifier bigint  NOT NULL ,
	 PRIMARY KEY (Claim_Amount_Identifier ASC),
	 FOREIGN KEY (Claim_Amount_Identifier) REFERENCES Claim_Reserve(Claim_Amount_Identifier)
)

CREATE TABLE Expense_Payment
( 
	Claim_Amount_Identifier bigint  NOT NULL ,
	 PRIMARY KEY (Claim_Amount_Identifier ASC),
	 FOREIGN KEY (Claim_Amount_Identifier) REFERENCES Claim_Payment(Claim_Amount_Identifier)
)

CREATE TABLE Expense_Reserve
( 
	Claim_Amount_Identifier bigint  NOT NULL ,
	 PRIMARY KEY (Claim_Amount_Identifier ASC),
	 FOREIGN KEY (Claim_Amount_Identifier) REFERENCES Claim_Reserve(Claim_Amount_Identifier)
)

CREATE TABLE Claim_Coverage
( 
	Claim_Identifier     int  NOT NULL ,
	Effective_Date       datetime  NOT NULL ,
	Policy_Coverage_Detail_Identifier int  NOT NULL ,
	 PRIMARY KEY (Claim_Identifier ASC,Effective_Date ASC,Policy_Coverage_Detail_Identifier ASC),
	 FOREIGN KEY (Claim_Identifier) REFERENCES Claim(Claim_Identifier),
 FOREIGN KEY (Effective_Date,Policy_Coverage_Detail_Identifier) REFERENCES Policy_Coverage_Detail(Effective_Date,Policy_Coverage_Detail_Identifier)
)

CREATE TABLE Policy_Coverage_Detail
( 
	Effective_Date       datetime  NOT NULL ,
	Policy_Coverage_Detail_Identifier int  NOT NULL ,
	Coverage_Identifier  int  NOT NULL ,
	Insurable_Object_Identifier int  NOT NULL ,
	Policy_Identifier    int  NOT NULL ,
	Coverage_Part_Code   varchar(20)  NOT NULL ,
	Coverage_Description varchar(2000)  NULL ,
	Expiration_Date      datetime  NULL ,
	Coverage_Inclusion_Exclusion_Code char(1)  NULL ,
	 PRIMARY KEY (Effective_Date ASC,Policy_Coverage_Detail_Identifier ASC),
	 FOREIGN KEY (Insurable_Object_Identifier) REFERENCES Insurable_Object(Insurable_Object_Identifier),
 FOREIGN KEY (Coverage_Identifier) REFERENCES Coverage(Coverage_Identifier),
 FOREIGN KEY (Coverage_Part_Code,Policy_Identifier) REFERENCES Policy_Coverage_Part(Coverage_Part_Code,Policy_Identifier)
)

CREATE TABLE Policy
( 
	Policy_Identifier    int  NOT NULL ,
	Effective_Date       datetime  NULL ,
	Expiration_Date      datetime  NULL ,
	Policy_Number        varchar(50)  NULL ,
	Status_Code          varchar(20)  NULL ,
	Geographic_Location_Identifier int  NULL ,
	 PRIMARY KEY (Policy_Identifier ASC),
	 FOREIGN KEY (Geographic_Location_Identifier) REFERENCES Geographic_Location(Geographic_Location_Identifier),
 FOREIGN KEY (Policy_Identifier) REFERENCES Agreement(Agreement_Identifier)
)

CREATE TABLE Policy_Amount
( 
	Policy_Amount_Identifier bigint  NOT NULL ,
	Geographic_Location_Identifier int  NOT NULL ,
	Policy_Identifier    int  NULL ,
	Effective_Date       datetime  NULL ,
	Amount_Type_Code     varchar(5)  NULL ,
	Earning_Begin_Date   datetime  NULL ,
	Earning_End_Date     datetime  NULL ,
	Policy_Coverage_Detail_Identifier int  NULL ,
	Policy_Amount        decimal(15,2)  NULL ,
	Insurable_Object_Identifier int  NULL ,
	Insurance_Type_Code  char(1)  NULL ,
	 PRIMARY KEY (Policy_Amount_Identifier ASC),
	 FOREIGN KEY (Effective_Date,Policy_Coverage_Detail_Identifier) REFERENCES Policy_Coverage_Detail(Effective_Date,Policy_Coverage_Detail_Identifier),
 FOREIGN KEY (Policy_Identifier) REFERENCES Policy(Policy_Identifier),
 FOREIGN KEY (Geographic_Location_Identifier) REFERENCES Geographic_Location(Geographic_Location_Identifier),
 FOREIGN KEY (Insurable_Object_Identifier) REFERENCES Insurable_Object(Insurable_Object_Identifier)
)

CREATE TABLE Agreement_Party_Role
( 
	Agreement_Identifier int  NOT NULL ,
	Party_Identifier     bigint  NOT NULL ,
	Party_Role_Code      varchar(20)  NOT NULL ,
	Effective_Date       datetime  NOT NULL ,
	Expiration_Date      datetime  NULL ,
	 PRIMARY KEY (Agreement_Identifier ASC,Party_Identifier ASC,Party_Role_Code ASC,Effective_Date ASC),
	 FOREIGN KEY (Agreement_Identifier) REFERENCES Agreement(Agreement_Identifier),
 FOREIGN KEY (Party_Identifier) REFERENCES Party(Party_Identifier),
 FOREIGN KEY (Party_Role_Code) REFERENCES Party_Role(Party_Role_Code)
)

CREATE TABLE Premium
( 
	Policy_Amount_Identifier bigint  NOT NULL ,
	 PRIMARY KEY (Policy_Amount_Identifier ASC),
	 FOREIGN KEY (Policy_Amount_Identifier) REFERENCES Policy_Amount(Policy_Amount_Identifier)
)

CREATE TABLE Catastrophe
( 
	Catastrophe_Identifier int  NOT NULL ,
	Catastrophe_Type_Code varchar(20)  NULL ,
	Catastrophe_Name     varchar(100)  NULL ,
	Industry_Catastrophe_Code varchar(20)  NULL ,
	Company_Catastrophe_Code varchar(20)  NULL ,
	 PRIMARY KEY (Catastrophe_Identifier ASC)
)