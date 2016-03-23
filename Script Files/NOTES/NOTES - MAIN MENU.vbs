BeginDialog NOTES_main_menu_dialog, 0, 0, 430, 274, "NOTES main menu dialog"
  ButtonGroup ButtonPressed
    PushButton 10, 10, 50, 10, "Adjustments", NOTES_adjustments_button
    PushButton 10, 30, 70, 10, "Arrears Management", arrs_mgmt_button
    PushButton 10, 50, 50, 10, "Client contact", NOTES_client_contact_button
    PushButton 10, 70, 80, 10, "Court Order Requested", NOTES_court_order_requested_button
    PushButton 10, 90, 50, 10, "CSENET Info", NOTES_CSENET_button
    PushButton 10, 110, 90, 10, "Date of the hearing (expro)", NOTES_date_of_hearing_expro_button
    PushButton 10, 120, 100, 10, "Date of the hearing (judicial)", NOTES_date_of_hearing_judicial_button
    PushButton 10, 140, 70, 10, "No Pay Months 1-4", NOTES_no_pay_months_button
    PushButton 10, 160, 50, 10, "Pay or report", NOTES_pay_or_report_button
    PushButton 10, 180, 70, 10, "Quarterly reviews", NOTES_quarterly_reviews_button
    PushButton 10, 200, 50, 10, "ROP Detail", NOTES_ROP_invoice_button
    PushButton 10, 220, 50, 10, "SOP Invoice", NOTES_SOP_invoice_button
    PushButton 10, 240, 110, 10, "Waiver of Personal Service", NOTES_waiver_of_personal_service_button
    CancelButton 370, 250, 50, 20
    PushButton 350, 0, 80, 10, "PRISM Scripts in SIR", SIR_button
  Text 60, 10, 240, 10, "-- New 03/2016!!! --- Creates a CAAD note for documenting adjustments made to the case."
  Text 80, 30, 240, 10, "-- New 03/2016!!! --- Creates a CAAD note for documenting an arrears management review."
  Text 60, 50, 240, 10, "-- Creates a uniform CAAD note for when you have contact with a client."
  Text 90, 70, 330, 20, "-- Creates B0170 CAAD note for requesting a court order, which also creates a work list to remind the worker to check the status of the court order request."
  Text 60, 90, 350, 10, "-- Creates T0111 CAAD note script with text copied from the INTD screen."
  Text 100, 110, 200, 10, "-- Date of the hearing template for expro."
  Text 110, 120, 200, 10, "-- Date of the hearing template for judicial."
  Text 80, 140, 340, 10, "-- Creates CAAD note for documenting non-payment enforcement actions."
  Text 60, 160, 240, 10, "-- CAAD note for case noting ''pay or report'' instances."
  Text 80, 180, 230, 10, "-- CAAD note for quarterly review processes."
  Text 70, 200, 350, 10, "-- Creates CAAD note noting the dates parties signed recognition of parentage."
  Text 70, 220, 350, 20, "-- Creates CAAD note that the Service of Process invoice was received, details about the service, and if the invoice is OK to pay."
  Text 120, 240, 290, 10, "-- Creates CAAD note of the date a CP signed the waiver of personal service document."
EndDialog
