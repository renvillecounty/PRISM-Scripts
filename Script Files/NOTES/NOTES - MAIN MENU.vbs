'GATHERING STATS----------------------------------------------------------------------------------------------------
name_of_script = "NOTES - MAIN MENU.vbs"
start_time = timer

'LOADING ROUTINE FUNCTIONS FROM GITHUB REPOSITORY---------------------------------------------------------------------------
url = "https://raw.githubusercontent.com/MN-CS-Script-Team/PRISM-Scripts/master/Shared%20Functions%20Library/PRISM%20Functions%20Library.vbs"
SET req = CreateObject("Msxml2.XMLHttp.6.0")				'Creates an object to get a URL
req.open "GET", url, FALSE									'Attempts to open the URL
req.send													'Sends request
IF req.Status = 200 THEN									'200 means great success
	Set fso = CreateObject("Scripting.FileSystemObject")	'Creates an FSO
	Execute req.responseText								'Executes the script code
ELSE														'Error message, tells user to try to reach github.com, otherwise instructs to contact Veronica with details (and stops script).
	MsgBox 	"Something has gone wrong. The code stored on GitHub was not able to be reached." & vbCr &_ 
			vbCr & _
			"Before contacting Veronica Cary, please check to make sure you can load the main page at www.GitHub.com." & vbCr &_
			vbCr & _
			"If you can reach GitHub.com, but this script still does not work, ask an alpha user to contact Veronica Cary and provide the following information:" & vbCr &_
			vbTab & "- The name of the script you are running." & vbCr &_
			vbTab & "- Whether or not the script is ""erroring out"" for any other users." & vbCr &_
			vbTab & "- The name and email for an employee from your IT department," & vbCr & _
			vbTab & vbTab & "responsible for network issues." & vbCr &_
			vbTab & "- The URL indicated below (a screenshot should suffice)." & vbCr &_
			vbCr & _
			"Veronica will work with your IT department to try and solve this issue, if needed." & vbCr &_ 
			vbCr &_
			"URL: " & url
			StopScript
END IF

'-----The dialog-----
BeginDialog NOTES_main_menu_dialog, 0, 0, 431, 275, "NOTES main menu dialog"
  ButtonGroup ButtonPressed
    PushButton 10, 30, 50, 10, "Adjustments", NOTES_adjustments_button
    PushButton 10, 45, 50, 10, "Client contact", NOTES_client_contact_button
    PushButton 10, 60, 80, 10, "Court Order Requested", NOTES_court_order_requested_button
    PushButton 10, 85, 50, 10, "CSENET Info", NOTES_CSENET_button
    PushButton 10, 100, 90, 10, "Date of the hearing (expro)", NOTES_date_of_hearing_expro_button
    PushButton 10, 115, 95, 10, "Date of the hearing (judicial)", NOTES_date_of_hearing_judicial_button
    PushButton 10, 130, 70, 10, "No Pay Months 1-4", NOTES_no_pay_months_button
    PushButton 10, 145, 50, 10, "Pay or report", NOTES_pay_or_report_button
    PushButton 10, 160, 65, 10, "Quarterly reviews", NOTES_quarterly_reviews_button
    PushButton 10, 175, 50, 10, "ROP Detail", NOTES_ROP_invoice_button
    PushButton 10, 195, 50, 10, "SOP Invoice", NOTES_SOP_invoice_button
    PushButton 10, 220, 105, 10, "Waiver of Personal Service", NOTES_waiver_of_personal_service_button
    CancelButton 375, 255, 50, 15
    PushButton 355, 5, 75, 10, "PRISM Scripts in SIR", SIR_button
  Text 65, 30, 240, 10, "-- New 03/2016!!! --- Creates a CAAD note for documenting adjustments made to the case."
  Text 65, 45, 240, 10, "-- Creates a uniform CAAD note for when you have contact with a client."
  Text 95, 60, 325, 20, "-- Creates B0170 CAAD note for requesting a court order, which also creates a work list to remind the worker to check the status of the court order request."
  Text 65, 85, 350, 10, "-- Creates T0111 CAAD note script with text copied from the INTD screen."
  Text 105, 100, 200, 10, "-- Date of the hearing template for expro."
  Text 110, 115, 195, 10, "-- Date of the hearing template for judicial."
  Text 85, 130, 340, 10, "-- Creates CAAD note for documenting non-payment enforcement actions."
  Text 65, 145, 240, 10, "-- CAAD note for case noting ''pay or report'' instances."
  Text 80, 160, 225, 10, "-- CAAD note for quarterly review processes."
  Text 70, 175, 350, 10, "-- Creates CAAD note noting the dates parties signed recognition of parentage."
  Text 70, 195, 350, 20, "-- Creates CAAD note that the Service of Process invoice was received, details about the service, and if the invoice is OK to pay."
  Text 120, 220, 285, 15, "-- Creates CAAD note of the date a CP signed the waiver of personal service document."
EndDialog



'THE SCRIPT-----------------------------------------------------------------------------------------------

DO
	'Shows the dialog
	Dialog NOTES_main_menu_dialog
	If buttonpressed = cancel then StopScript
	IF ButtonPressed = SIR_button THEN CreateObject("WScript.Shell").Run("https://www.dhssir.cty.dhs.state.mn.us/MAXIS/blzn/PRISMscripts/PRISM%20script%20wiki/Forms/AllPages.aspx")	
LOOP UNTIL ButtonPressed <> SIR_button

IF ButtonPressed = NOTES_adjustments_button THEN CALL run_from_GitHub(script_repository & "NOTES/NOTES - ADJUSTMENTS.vbs")
IF ButtonPressed = NOTES_Client_contact_button then call run_from_GitHub(script_repository & "NOTES/NOTES - CLIENT CONTACT.vbs")
IF ButtonPressed = NOTES_court_order_requested_button THEN CALL run_from_GitHub(script_repository & "NOTES/NOTES - COURT ORDER REQUEST.vbs")
IF ButtonPressed = NOTES_CSENET_button THEN CALL run_from_GitHub(script_repository & "NOTES/NOTES - CSENET INFO.vbs")
IF ButtonPressed = NOTES_date_of_hearing_expro_button then call run_from_GitHub(script_repository & "NOTES/NOTES - DATE OF THE HEARING (EXPRO).vbs")
IF ButtonPressed = NOTES_date_of_hearing_judicial_button then call run_from_GitHub(script_repository & "NOTES/NOTES - DATE OF THE HEARING (JUDICIAL).vbs")
IF ButtonPressed = NOTES_no_pay_months_button THEN CALL run_from_GitHub(script_repository & "NOTES/NOTES - NO PAYMENT MONTHS ONE-FOUR.vbs")
IF ButtonPressed = NOTES_pay_or_report_button then call run_from_GitHub(script_repository & "NOTES/NOTES - PAY OR REPORT.vbs")
IF ButtonPressed = NOTES_quarterly_reviews_button then call run_from_GitHub(script_repository & "NOTES/NOTES - QUARTERLY REVIEWS.vbs")
IF ButtonPressed = NOTES_ROP_invoice_button THEN CALL run_from_GitHub(script_repository & "NOTES/NOTES - ROP DETAIL.vbs")
IF ButtonPressed = NOTES_SOP_invoice_button THEN CALL run_from_GitHub(script_repository & "NOTES/NOTES - SOP INVOICE.vbs")
IF ButtonPressed = NOTES_waiver_of_personal_service_button THEN CALL run_from_GitHub (script_repository & "NOTES/NOTES - WAIVER OF PERSONAL SERVICE.vbs")
