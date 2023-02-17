/// <summary>
/// PermSet "KNH Cust Overview"" (ID 50400).
/// </summary>
permissionset 50400 "KNH Cust Overview"
{
    Assignable = true;
    Caption = 'Customer Overview', MaxLength = 30;
    Permissions =
        codeunit "KNH Customer Overview" = X,
        query "KNH Customer Overview" = X,
        report "KNH TopX Customers" = X;
}
