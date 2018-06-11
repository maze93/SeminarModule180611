page 123456702 "CSD Seminar List"
{
    PageType = List;
    SourceTable = "CSD Seminar";
    CardPageId = 123456701;
    Caption = 'Seminar List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.") {}
                field(Name;Name) {}
                field("Seminar Duration";"Seminar Duration") {}
                field("Seminar Price";"Seminar Price") {}
                field("Minimum Participants";"Minimum Participants") {}
                field("Maximum Participants";"Maximum Participants") {}
                

            }
        }
        area(FactBoxes) {
            systempart("Links";Links) {}
            systempart("Notes";Notes) {}
        }
    }

    actions
    {
        area(processing)
        {
             action("Co&mments")
                {
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    PromotedCategory = new;

                    trigger OnAction();
                    var
                        SeminarCommentLine : Record "CSD Seminar Comment Line";
                    begin
                        SeminarCommentLine.Reset;
                        SeminarCommentLine.SetRange("Table Name", SeminarCommentLine."Table Name"::Seminar);
                        SeminarCommentLine.SetRange("No.", "No.");
                        if Page.RunModal(Page::"CSD Seminar Comment Sheet",SeminarCommentLine) = Action::LookupOk then begin

                        end;
                    end;
                }
        }
    }
}