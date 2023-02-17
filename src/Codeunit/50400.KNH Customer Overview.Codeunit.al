/// <summary>
/// Codeunit KNH Customer Overview (ID 50400).
/// </summary>
codeunit 50400 "KNH Customer Overview"
{
    trigger OnRun()
    var
        KNHCustomerOverview: Query "KNH Customer Overview";
        TextCustOverviewMsg: Label 'Customer name = %1, Amount (LCY) = %2', Comment = '%1 = Customer Name, %2 = Amount (LCY)';
    begin
        KNHCustomerOverview.Open();
        while KNHCustomerOverview.Read() do
            Message(TextCustOverviewMsg, KNHCustomerOverview.Name, KNHCustomerOverview.AmountLCY);
        KNHCustomerOverview.Close();
    end;
}
