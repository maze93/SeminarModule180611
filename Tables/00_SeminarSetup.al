table 123456700 "CSD Seminar Setup"
{
    Caption = 'Seminar Setup';
    
    fields
    {
        field(10;"Primary Key";Code[10]) {
            Caption = 'Primary Key';
        }
        field(20;"Seminar Nos.";Code[20])
        {
            Caption = 'Seminar Nos';
            TableRelation = "No. Series".Code;
        }
        field(30;"Seminar Registration Nos.";Code[20]) 
        {
            Caption = 'Seminar Registration Nos';
            TableRelation = "No. Series".Code;
        }
        field(40;"Posted Seminar Reg. Nos.";Code[20]) 
        {
            Caption = 'Posted Seimnar Reg. Nos.';
            TableRelation = "No. Series".Code;
        }
    }

    keys
    {
        key(PK;"Primary Key")
        {
            Clustered = true;
        }
    }

}