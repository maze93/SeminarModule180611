table 123456704 "CSD Seminar Comment Line"
{
    LookupPageId = "CSD Seminar Comment List";
    DrillDownPageId = "CSD Seminar Comment List";
    Caption = 'Seminar Comment Line';
    
    
    fields
    {
     field(10;"Table Name";Option) {
         Caption = 'Table Name';
         OptionMembers = Seminar,"Seminar Registration Header","Posted Seminar Reg. Header";
     } 
     field(20;"Document Line No.";Integer) {}
     field(30;"No.";Code[20]) {
         Caption = 'No.';
         TableRelation = IF ("Table Name" =CONST(Seminar)) "CSD Seminar" else if ("Table Name"=const("Seminar Registration Header")) "CSD Sem. Registration Header"; 
    }  
     field(40;"Line No.";Integer) {
         Caption = 'Line No.';
     }
     field(50;Date;Date) {
         Caption = 'Date';
     }
     field(60;Code;Code[10]) {
         Caption = 'Code';
     }
     field(70;Comment;text[80]) {
         Caption = 'Comment';
     }
    }

    keys
    {
        key(PK;"Table Name","Document Line No.","No.","Line No.")
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

    procedure SetupNewLine();
    var
        SeminarCommentLine : Record "CSD Seminar Comment Line";
    begin
        SeminarCommentLine.SetRange("Table Name","Table Name"); 
        SeminarCommentLine.SetRange("No.","No."); 
        SeminarCommentLine.SetRange("Document Line No.", "Document Line No."); 
        SeminarCommentLine.SetRange("Date",WorkDate); 
        if SeminarCommentLine.IsEmpty then 
            Date:=WorkDate;
    end;

}