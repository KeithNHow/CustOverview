/// <summary>
/// Page Demo Order Proc. (ID 50400) Extends Order Processor Role Center 9006
/// </summary>
pageextension 50400 "KNH Order Processing" extends "Order Processor Role Center"
{
    actions
    {
        addafter("History")
        {
            action("KNH Customer Overview")
            {
                ApplicationArea = All;
                Caption = 'Customer Overview';
                ToolTip = 'Customer Overview';
                RunObject = report "KNH TopX Customers";
            }
        }
    }
}