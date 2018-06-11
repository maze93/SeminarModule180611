pageextension 123456701 "CSD Resource List" extends "Resource List"
{
    layout
    {
        addafter(Type) {
            field("CSD Resource Type";"CSD Resource Type") {}
            field("CSD Maximum Participants";"CSD Maximum Participants") {
                Visible = ShowMaxField;
            }
        }
        modify(Type) {
            Visible = ShowType;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage();
    begin
        FilterGroup(3);
        ShowType:= (GetFilter(Type) = '');
        ShowMaxField := (GetFilter(Type) = format(Type::Machine));
        FilterGroup(0);
    end;
    
    var
        [InDataSet]
        ShowType : Boolean;
        [InDataSet]
        ShowMaxField : Boolean;
}