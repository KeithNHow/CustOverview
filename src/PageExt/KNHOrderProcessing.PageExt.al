/// <summary>
/// Page Demo Order Proc. (ID 50400) Extends Order Processor Role Center 9006
/// New action to show report
/// </summary>
pageextension 50400 "KNH_OrderProcessing" extends "Order Processor Role Center"
{
    actions
    {
        addafter("History")
        {
            action("KNH_KNH TopX Customer report")
            {
                ApplicationArea = All;
                Caption = 'TopX Customers';
                ToolTip = 'TopX Customers';
                RunObject = Report "KNH_TopX_Customers";
            }
        }
    }
}