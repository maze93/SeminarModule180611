page 123456706 "CSD Seminar Comment Sheet"
{
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    UsageCategory = Tasks;
    ShowFilter = false;
    Caption = 'Seminar Comment Sheets';

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
}