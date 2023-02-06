/// <summary>
/// Report 50400cCustomer Overview (ID 50002).
/// </summary>h 
report 50400 "KNH Customer Overview"
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
                TopXCustomers.TopNumberOfRows(TopX);
                TopXCustomers.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if TopXCustomers.Read() then begin
                    CustomerNo := TopXCustomers.No;
                    CustomerName := TopXCustomers.Name;
                    CustBalance := TopXCustomers.BalanceLCY;
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
                        Caption = 'TopX?';
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
        TopXCustomers.Close();
    end;

    var
        TopXCustomers: Query "KNH Customer Overview";
        CustomerNo: Code[20];
        CustomerName: Text[50];
        CustBalance: Decimal;
        TopX: Integer;

}
