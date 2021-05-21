#pragma warning disable AL0432,AL0603
codeunit 31327 "Sales Post Adv. Handler CZL"
{
    Access = Internal;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post Advances", 'OnPostLetter_SetInvHeaderOnBeforeInsertSalesInvoiceHeader', '', false, false)]
    local procedure CopyFieldsOnPostLetter_SetInvHeaderOnBeforeInsertSalesInvoiceHeader(var SalesInvoiceHeader: Record "Sales Invoice Header"; SalesAdvanceLetterHeader: Record "Sales Advance Letter Header")
    begin
        SalesInvoiceHeader."VAT Date CZL" := SalesInvoiceHeader."VAT Date";
        SalesInvoiceHeader."Registration No. CZL" := SalesAdvanceLetterHeader."Registration No.";
        SalesInvoiceHeader."Tax Registration No. CZL" := SalesAdvanceLetterHeader."Tax Registration No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post Advances", 'OnAfterPostLetterPostToGL', '', false, false)]
    local procedure CopyFieldsOnAfterPostLetterPostToGL(var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."VAT Date CZL" := GenJournalLine."VAT Date";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post Advances", 'OnPostLetter_SetCrMemoHeaderOnBeforeInsertSalesCrMemoHeader', '', false, false)]
    local procedure CopyFieldsOnPostLetter_SetCrMemoHeaderOnBeforeInsertSalesCrMemoHeader(var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; SalesAdvanceLetterHeader: Record "Sales Advance Letter Header")
    begin
        SalesCrMemoHeader."Credit Memo Type CZL" := Enum::"Credit Memo Type CZL"::"Corrective Tax Document";
        SalesCrMemoHeader."VAT Date CZL" := SalesAdvanceLetterHeader."VAT Date";
        if SalesCrMemoHeader."VAT Date CZL" = 0D then
            SalesCrMemoHeader."VAT Date CZL" := SalesCrMemoHeader."Posting Date";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post Advances", 'OnPostVATCrMemoHeaderOnBeforeInsertSalesCrMemoHeader', '', false, false)]
    local procedure CopyFieldsOnPostVATCrMemoHeaderOnBeforeInsertSalesCrMemoHeader(var SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    begin
        SalesCrMemoHeader."VAT Date CZL" := SalesCrMemoHeader."VAT Date";
        SalesCrMemoHeader."Credit Memo Type CZL" := Enum::"Credit Memo Type CZL"::"Corrective Tax Document";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post Advances", 'OnAfterPostVATCrMemoPrepareGL', '', false, false)]
    local procedure CopyFieldsOnAfterPostVATCrMemoPrepareGL(var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."VAT Date CZL" := GenJournalLine."VAT Date";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post Advances", 'OnPostRefundCorrToGLOnFillAdvanceRefundGenJnlLine', '', false, false)]
    local procedure CopyFieldsOnPostRefundCorrToGLOnFillAdvanceRefundGenJnlLine(var GenJnlLine: Record "Gen. Journal Line")
    begin
        GenJnlLine."VAT Date CZL" := GenJnlLine."VAT Date";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post Advances", 'OnPostRefundCorrToGLOnBeforePostAdvancePaymentGenJnlLine', '', false, false)]
    local procedure CopyFieldsOnPostRefundCorrToGLOnBeforePostAdvancePaymentGenJnlLine(SalesAdvanceLetterHeader: Record "Sales Advance Letter Header"; var GenJnlLine: Record "Gen. Journal Line")
    begin
        GenJnlLine."VAT Date CZL" := GenJnlLine."VAT Date";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post Advances", 'OnFillVATFieldsOfDeductionEntryOnBeforeTempSalesAdvanceLetterEntry', '', false, false)]
    local procedure CopyFieldsOnFillVATFieldsOfDeductionEntryOnBeforeTempSalesAdvanceLetterEntry(var TempSalesAdvanceLetterEntry: Record "Sales Advance Letter Entry"; VATEntry: Record "VAT Entry")
    begin
        TempSalesAdvanceLetterEntry."VAT Date" := VATEntry."VAT Date CZL";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post Advances", 'OnUnapplyCustLedgEntryOnBeforeUnapply', '', false, false)]
    local procedure CopyFieldsOnUnapplyCustLedgEntryOnBeforeUnapply(var GenJnlLine: Record "Gen. Journal Line")
    begin
        GenJnlLine."VAT Date CZL" := GenJnlLine."Posting Date";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post Advances", 'OnCreateBlankCrMemoOnBeforeInsertSalesCrMemoHeader', '', false, false)]
    local procedure CopyFieldsOnCreateBlankCrMemoOnBeforeInsertSalesCrMemoHeader(var SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    begin
        SalesCrMemoHeader."VAT Date CZL" := SalesCrMemoHeader."VAT Date";
        SalesCrMemoHeader."Credit Memo Type CZL" := Enum::"Credit Memo Type CZL"::"Corrective Tax Document";
    end;
}