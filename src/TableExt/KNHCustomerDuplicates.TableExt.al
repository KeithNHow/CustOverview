/// <summary>
/// TableExtension "KNH_Customer Duplicates" (ID 50400) extends Record Customer.
/// Indicate that customer record already exists with the same name. 
/// </summary>
tableextension 50400 "KNH_CustomerDuplicates" extends Customer
{
    fields
    {
        modify(Name)
        {
            trigger OnBeforeValidate()
            var
                CustomerDup: Record Customer;
                DupMsg: Label 'A Customer with the name %1 (No. = %2) already exists, consider deleting this one!', Comment = '%1 = Customer Name, %2 = Customer No.';
            begin
                if GuiAllowed then begin
                    CustomerDup.Setfilter(Name, '@' + Rec.Name + '*');
                    CustomerDup.SetFilter("No.", '<>%1', Rec."No.");
                    if CustomerDup.FindFirst() then
                        Message(DupMsg, CustomerDup.Name, CustomerDup."No.");
                end;
            end;
        }
    }
}
