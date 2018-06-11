page 123456701 "CSD Seminar Card"
{
    PageType = Card;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar Card';

    layout
    {
        area(content)
        {
            group("CSD General")
            {
                Caption = 'General';
                field("No.";"No.") {
                    trigger OnAssistEdit();
                    begin
                        if Rec.AssistEdit then
                            CurrPage.Update(false);
                    end;
                }
                field(Name;Name) {}
                field("Search Name";"Search Name") {}
                field("Seminar Duration";"Seminar Duration") {}
                field("Minimum Participants";"Minimum Participants") {}
                field("Maximum Participants";"Maximum Participants") {}
                field(Blocked;Blocked) {}
                field("Last Date Modified";"Last Date Modified") {}
            }
            group("CSD Invoicing") {
                Caption = 'Invoicing';
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group") {}
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group") {}
                field("Seminar Price";"Seminar Price") {}

            }
        }
        area(FactBoxes) {
            systempart("Links";Links) {}
            systempart("Notes";Notes) {}
        }
    }


    actions
    {
        area(Navigation)
        {
            group("&Seminar") {
                action("Co&mments")
                {
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;

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

    
    var
        myInt : Integer;
}