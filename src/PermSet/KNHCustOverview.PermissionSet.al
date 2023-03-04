/// <summary>
/// PermSet "KNH Cust Overview"" (ID 50400).
/// </summary>
permissionset 50400 "KNH_CustOverview"
{
    Assignable = true;
    Caption = 'Customer Overview', MaxLength = 30;
    Permissions =
        query "KNH_CustomerQuery" = X,
        report "KNH_TopX_Customers" = X,
        report "KNH_Datafix" = X;
}
