/// <summary>
/// Codeunit KNH Customer Overview (ID 50400).
/// Read query and show message
/// </summary>
/*
codeunit 50400 "KNH Customer Query Function"
{
    trigger OnRun()
    var
        KNHCustomerQuery: Query "KNH Customer Query";
        TextCustOverviewMsg: Label 'Customer name = %1, Amount (LCY) = %2', Comment = '%1 = Customer Name, %2 = Amount (LCY)';
    begin
        KNHCustomerQuery.Open();
        if KNHCustomerQuery.Read() then
            Message(TextCustOverviewMsg, KNHCustomerQuery.Name, KNHCustomerQuery.AmountLCY);
        KNHCustomerQuery.Close();
    end;
}
*/