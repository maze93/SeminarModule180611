page 123456706 "CSD Seminar Comment Sheet"
{
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    UsageCategory = Lists;
    ShowFilter = false;
    Caption = 'Seminar Comment Sheet';
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date;Date) {}
                field(Code;Code) {
                    Visible= false;
                }
                field(Comment;Comment) {}
            }
        }
    }

    actions
    {
        area(processing)
        {

        }
    }

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        SetupNewLine;
    end;
}