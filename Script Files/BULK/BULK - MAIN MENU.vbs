'GATHERING STATS----------------------------------------------------------------------------------------------------
name_of_script = "BULK - MAIN MENU.vbs"
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

'DIALOGS---------------------------------------------------------------------------
BeginDialog BULK_main_menu_dialog, 0, 0, 381, 210, "BULK Main Menu"
  ButtonGroup ButtonPressed
    PushButton 5, 25, 60, 10, "CALI to Excel", BULK_cali_to_excel_button
    PushButton 5, 50, 60, 10, "Case Transfer", BULK_case_transfer_button
    PushButton 5, 75, 100, 10, "Companion Case Finder - CP", BULK_cp_companion_case_finder_button
    PushButton 5, 95, 105, 10, "Companion Case Finder - NCP", BULK_ncp_companion_case_finder_button
    PushButton 5, 115, 60, 10, "Evaluate NOCS", BULK_evaluate_nocs_button
    PushButton 5, 135, 90, 10, "Failure POF -- SSA, DFAS", BULK_failure_pof_rsdi_dfas_button
    CancelButton 325, 190, 50, 15
    PushButton 300, 5, 75, 10, "PRISM Scripts in SIR", SIR_button
  Text 75, 25, 295, 20, "-- This script builds a list in Microsoft Excel of case numbers, function types, program codes, interstate codes, and parent names."
  Text 75, 50, 295, 20, "-- This script allows users to transfer up to 15 cases to as many workers as they need OR to transfer an entire caseload to as many workers as needed."
  Text 110, 75, 260, 10, "--- This script builds a list of companion cases for your CPs on a given CALI."
  Text 115, 95, 255, 10, "-- This script builds a list of companion cases for your NCPs on a given CALI."
  Text 75, 115, 260, 10, "-- This script evaluates D0800 worklist items for continued services."
  Text 100, 135, 270, 20, "-- Clears E0014 worklist item when income is from RSDI (US Treasury) or Dept of Defense."
EndDialog


'THE SCRIPT-----------------------------------------------------------------------------------------------

DO
	'Shows the dialog
	Dialog BULK_main_menu_dialog
	If buttonpressed = cancel then StopScript
	IF ButtonPressed = SIR_button THEN CreateObject("WScript.Shell").Run("https://www.dhssir.cty.dhs.state.mn.us/MAXIS/blzn/PRISMscripts/PRISM%20script%20wiki/Forms/AllPages.aspx")
LOOP UNTIL ButtonPressed <> SIR_button

IF ButtonPressed = BULK_cali_to_excel_button 					THEN CALL run_from_GitHub(script_repository & "BULK/BULK - CALI TO EXCEL.vbs")
IF ButtonPressed = BULK_case_transfer_button 					THEN CALL run_from_GitHub(script_repository & "BULK/BULK - CASE TRANSFER.vbs")
IF ButtonPressed = BULK_cp_companion_case_finder_button 			THEN CALL run_from_GitHub(script_repository & "BULK/BULK - CP COMPANION CASE FINDER.vbs")
IF ButtonPressed = BULK_ncp_companion_case_finder_button			THEN CALL run_from_GitHub(script_repository & "BULK/BULK - NCP COMPANION CASE FINDER.vbs")
IF ButtonPressed = BULK_failure_pof_rsdi_dfas_button				THEN CALL run_from_GitHub(script_repository & "BULK/BULK - FAILURE POF RSDI DFAS.vbs")
IF ButtonPressed = BULK_evaluate_nocs_button 					THEN CALL run_from_GitHub(script_repository & "BULK/BULK - EVALUATE NOCS.vbs")
