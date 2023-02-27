/// <summary>
/// Report KNH TopX Customers (ID 50400).
/// Set number of required records
/// Filter dataitem by number of required records
/// Read data from query, pop variables
/// Show record on report
/// </summary>h 
report 50400 "KNH TopX Customers"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report\Layouts\KNH TopX Customers.rdlc';
    ApplicationArea = All;
    Caption = 'TopX Customers';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(CustOverview; "Integer")
        {
            DataItemTableView = sorting(Number);
            column(No; CustomerNo)
            {
            }
            column(Name; CustomerName)
            {
            }
            column(BalanceLCY; CustBalance)
            {
            }

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, TopX);
                KNHCustomerQuery.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if KNHCustomerQuery.Read() then begin
                    CustomerNo := KNHCustomerQuery.No;
                    CustomerName := KNHCustomerQuery.Name;
                    CustBalance := KNHCustomerQuery.BalanceLCY;
                end else
                    CurrReport.Skip();
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(Top_X; TopX)
                    {
                        ApplicationArea = All;
                        Caption = 'TopX';
                        ToolTip = 'TopX';
                    }
                }
            }
        }
    }

    trigger OnInitReport()
    begin
        TopX := 10;
    end;

    trigger OnPostReport()
    begin
        KNHCustomerQuery.Close();
    end;

    var
        KNHCustomerQuery: Query "KNH Customer Query";
        CustomerNo: Code[20];
        CustomerName: Text[50];
        CustBalance: Decimal;
        TopX: Integer;
}
