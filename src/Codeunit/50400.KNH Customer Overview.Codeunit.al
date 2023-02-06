/// <summary>
/// Codeunit KNH Customer Overview (ID 50001).
/// </summary>
codeunit 50400 "KNH Customer Overview"
{
    trigger OnRun()
    var
        CustOverview: Query "KNH Customer Overview";
        TextCustOverviewMsg: Label 'Customer name = %1, Amount (LCY) = %2', Comment = '%1 = Customer Name, %2 = Amount (LCY)';
    begin
        CustOverview.Open();
        while CustOverview.Read() do
            Message(TextCustOverviewMsg, CustOverview.Name, CustOverview.AmountLCY);
        CustOverview.Close();
    end;
}
