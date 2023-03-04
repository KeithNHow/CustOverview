/// <summary>
/// Report "KNH_Datafix" (ID 50402).
/// </summary>
report 50402 KNH_Datafix
{
    ApplicationArea = All;
    Caption = 'KNH_Datafix';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", Name;
            DataItemTableView = sorting(Name) where(Name = filter('A*|B*'));

            trigger OnAfterGetRecord()
            begin
                if UpdateRecords then begin
                    Validate(Name, CopyStr(Name, 1, 90) + '-X');
                    Counter += Counter + 1;
                    Customer.Modify(true);
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(TableUpdate; UpdateRecords)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Update Records';
                        ToolTip = 'Run Table Update.';
                    }
                }
            }
        }
    }

    trigger OnInitReport()
    begin
        UpdateRecords := false;
    end;

    trigger OnPreReport()
    begin
    end;

    trigger OnPostReport()
    begin
        if UpdateRecords then
            Message(Count2Msg, Counter)
        else
            Message(Count1Msg, Counter);
    end;

    var
        UpdateRecords: Boolean;
        Counter: Integer;
        Count1Msg: Label 'Records for Update = %1.', Comment = '%1 = Counter';
        Count2Msg: Label 'Records Updated = %1.', Comment = '%1 = Counter';
}
