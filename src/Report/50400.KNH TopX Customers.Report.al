/// <summary>
/// Report KNH TopX Customers (ID 50400).
/// </summary>h 
report 50400 "KNH TopX Customers"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report\Layouts\KNH Customer Overview.rdlc';
    ApplicationArea = All;
    Caption = 'Customer Overview';
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
                KNHCustomerOverview.TopNumberOfRows(TopX);
                KNHCustomerOverview.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if KNHCustomerOverview.Read() then begin
                    CustomerNo := KNHCustomerOverview.No;
                    CustomerName := KNHCustomerOverview.Name;
                    CustBalance := KNHCustomerOverview.BalanceLCY;
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
        KNHCustomerOverview.Close();
    end;

    var
        KNHCustomerOverview: Query "KNH Customer Overview";
        CustomerNo: Code[20];
        CustomerName: Text[50];
        CustBalance: Decimal;
        TopX: Integer;

}
