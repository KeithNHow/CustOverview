/// <summary>
/// Page Demo Order Proc. (ID 50400) Extends Order Processor Role Center 9006
/// New action to show report
/// </summary>
pageextension 50400 "KNH Order Processing" extends "Order Processor Role Center"
{
    actions
    {
        addafter("History")
        {
            action("KNH TopX Customer report")
            {
                ApplicationArea = All;
                Caption = 'TopX Customers';
                ToolTip = 'TopX Customers';
                RunObject = Report "KNH TopX Customers";
            }
        }
    }
}