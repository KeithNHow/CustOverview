/// <summary>
/// Report KNH TopX Customers (ID 50400).
/// Set number of required records
/// Filter dataitem by number of required records
/// Read data from query, pop variables
/// Show record on report
/// </summary>h 
report 50400 "KNH_TopX_Customers"
{
    //DefaultLayout = RDLC;
    //RDLCLayout = 'src\Report\Layouts\KNHTopXCustomers.rdlc';
    DefaultRenderingLayout = RDLCLayout;
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

    rendering
    {
        layout(RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './Layouts/KNHTopXCustomers.rdlc';
            Caption = 'TopX Customers (RDL)';
            Summary = 'Legacy layout';
        }
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = './Layouts/KNHTopXCustomers.docx';
            Caption = 'TopX Customers (Word)';
            Summary = 'Layout suitable for user facing documents.';
        }
        layout(ExcelLayout)
        {
            Type = Excel;
            LayoutFile = './Layouts/KNHTopXCustomers.xlsx';
            Caption = 'TopX Customers (Excel)';
            Summary = 'Layout suitable for reports.';
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
        KNHCustomerQuery: Query "KNH_CustomerQuery";
        CustomerNo: Code[20];
        CustomerName: Text[50];
        CustBalance: Decimal;
        TopX: Integer;
}
