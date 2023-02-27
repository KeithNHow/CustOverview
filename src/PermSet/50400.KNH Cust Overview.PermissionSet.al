/// <summary>
/// PermSet "KNH Cust Overview"" (ID 50400).
/// </summary>
permissionset 50400 "KNH Cust Overview"
{
    Assignable = true;
    Caption = 'Customer Overview', MaxLength = 30;
    Permissions =
        query "KNH Customer Query" = X,
        report "KNH TopX Customers" = X;
}
