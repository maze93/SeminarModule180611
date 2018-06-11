table 123456701 "CSD Seminar"
{
    Caption = 'Seminar';
    LookupPageId = 123456702;
    DrillDownPageId = 123456702;
    
    fields
    {
        field(10;"No.";Code[20])
        {
            Caption = 'No.';
            trigger OnValidate();
            var
                NoSeries : Record "No. Series";
            begin
                SeminarSetup.Get;
                if NoSeries.Get(SeminarSetup."Seminar Nos.") then
                    if NoSeries."Manual Nos." then begin
                        "No. Series" := '';
                    end;

            end;
        }
        field(20;Name;Text[50]) {
            Caption = 'Name';
            trigger OnValidate();
            begin
                if ("Search Name" = uppercase(xRec.Name)) or ("Search Name" = '') then begin
                    "Search Name" := Name;
                end;
            end;
        }
        field(30;"Seminar Duration";Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0:1;
        }
        field(40;"Minimum Participants";Integer)    
        {
            Caption = 'Minimum Participants';
        }
        field(50;"Maximum Participants";Integer)
        {
            Caption = 'Maximum Participants';
        }
        field(60;"Search Name";Code[50])
        {
            Caption = 'Search Name';
        }
        field(70;Blocked;Boolean)
        {
            Caption = 'Blocked';
        }
        field(80;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(90;Comment;Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("CSD Seminar Comment Line" where("Table Name"= const("Seminar"),"No."=Field("No.")));
        }
        field(100;"Seminar Price";Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }
        field(110;"Gen. Prod. Posting Group";Code[10])      
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            trigger OnValidate();
            begin
                GenProdPostingGroup.Get("Gen. Prod. Posting Group");
                if xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" then
                    if GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup,"Gen. Prod. Posting Group") then begin
                        "VAT Prod. Posting Group" := GenProdPostingGroup."Def. VAT Prod. Posting Group";
                    end;    
            end;
        }
        field(120;"VAT Prod. Posting Group";Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(130;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series".Code;
            Editable = false;
        }
    }

    keys
    {
        key(PK;"No.", "Search Name")
        {
            Clustered = true;
        }
    }
    
    var
        SeminarSetup : Record "CSD Seminar Setup";
        SeminarCommentLine : Record "CSD Seminar Comment Line";
        GenProdPostingGroup : Record "Gen. Product Posting Group";
        Seminar : Record "CSD Seminar";
        NoSeriesMgt : Codeunit NoSeriesManagement;

    trigger OnInsert();
    begin
        SeminarSetup.Get;
        if "No." = '' then begin
            "No." := NoSeriesMgt.GetNextNo(SeminarSetup."Seminar Nos.",Workdate,true);
        end;
        
    end;

    trigger OnModify();
    begin
        "Last Date Modified" := WorkDate;
    end;

    trigger OnDelete();
    begin
        SeminarCommentLine.Reset;
        SeminarCommentLine.SetRange("Table Name", SeminarCommentLine."Table Name"::"Seminar");
        SeminarCommentLine.SetRange("No.", "No.");
        if SeminarCommentLine.Find('-') then repeat
            SeminarCommentLine.Delete(true);
        until SeminarCommentLine.Next = 0;
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := WorkDate;
    end;

    procedure AssistEdit() : Boolean;
    begin
        SeminarSetup.Get;
        if SeminarSetup."Seminar Nos." <> '' then
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos." ,xRec."No. Series","No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                exit(true);
            end;
    end;

}