table 123456719 "CSD Posted Seminar Reg. Line"
{
    Caption = 'Posted Seminar Reg. Line';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            TableRelation = "CSD Sem. Registration Header";
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Bill-to Customer No."; Code[20])
        {
            TableRelation = Customer;
        }
        field(4; "Participant Contact No."; Code[20])
        {
            TableRelation = Contact;
        }
        field(5; "Participant Name"; Text[50])
        {
            CalcFormula = Lookup (Contact.Name where ("No." = Field ("Participant Contact No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Registration Date"; Date)
        {
            Editable = false;
        }
        field(7; "To Invoice"; Boolean)
        {
            InitValue = true;
        }
        field(8; Participated; Boolean)
        {
        }
        field(9; "Confirmation Date"; Date)
        {
            Editable = false;
        }
        field(10; "Seminar Price"; Decimal)
        {
            AutoFormatType = 2;
        }
        field(11; "Line Discount %"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(12; "Line Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
        }
        field(13; Amount; Decimal)
        {
            AutoFormatType = 1;
        }
        field(14; Registered; Boolean)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
        }
    }

    var
        myInt: Integer;

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

}