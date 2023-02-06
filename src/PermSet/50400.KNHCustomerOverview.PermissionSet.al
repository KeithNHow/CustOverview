/// <summary>
/// Unknown "KNHCustomerOverview" (ID 50400).
/// </summary>
permissionset 50400 KNHCustomerOverview
{
    Assignable = true;
    Caption = 'Customer Overview', MaxLength = 30;
    Permissions =
        codeunit "KNH Customer Overview" = X,
        query "KNH Customer Overview" = X,
        report "KNH Customer Overview" = X;
}
