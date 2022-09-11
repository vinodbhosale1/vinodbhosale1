select * from [dbo].[Employee]
select * from [dbo].[CompanyDocuments]

go

create table CompanyDocumentsType
(
DocumentTypeId int primary key identity,
DocumentTypeName varchar(200)
)

go

insert into CompanyDocumentsType values 
('Offer Letter') , ('Increment Letter'),
('Payslips'), ('Reliving Letter'), ('Experience Letter'),
('Promotion Letter'), ('Confirmation Letter'),
('Internship Joining Letter'), ('Internship Completion Letter'),
('Training Certificate')

go 

alter table CompanyDocuments 
add CompanyDocumentsTypeId int foreign key references CompanyDocumentsType(DocumentTypeId)

go

