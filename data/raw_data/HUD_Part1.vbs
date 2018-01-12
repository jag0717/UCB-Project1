' Steps:
' ----------------------------------------------------------------------------

' Part I:

' 1. On each Worksheet, extract words before the phrase ", YYYY(2007)" from each header.
' 2. Extract the Year and Add to the first column of each spreadsheet.

Sub HUD_PartI()
    
    ' ' --------------------------------------------
    ' LOOP THROUGH ALL SHEETS
    ' --------------------------------------------
    For Each ws In Worksheets

        ' ' --------------------------------------------
        ' INSERT THE YEAR
        ' --------------------------------------------

        ' Created a Variable to Hold File Name, Last Row, Last Column, and Year
        Dim WorksheetName As String

        ' Determine the Last Row
        lastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row
        
        ' Grabbed the WorksheetName
        WorksheetName = ws.Name
        ' MsgBox WorksheetName
                
        ' Add the Year to the Column
        ws.Range("A1").EntireColumn.Insert
        
        ' Add the word Year to the First Column Header
        ws.Cells(1, 1).Value = "Year"
            
        ' Add the Year to all rows
        ws.Range("A2:A" & lastRow) = WorksheetName

        ' ' --------------------------------------------
        ' CORRECT THE COLUMN HEADERS
        ' ' --------------------------------------------
        
        ' Determine the Last Column Number
        LastColumn = ws.Cells(1, Columns.Count).End(xlToLeft).Column
        
        ' Rename the Year columns by looping through and renaming each
        For i = 4 To LastColumn
            YearHeader = ws.Cells(1, i).Value
            YearSplit = Split(YearHeader, ",")
            ws.Cells(1, i).Value = YearSplit(0)
        Next i
        
    ' --------------------------------------------
    ' FIXES COMPLETE
    ' --------------------------------------------
    Next ws

    MsgBox ("Formatting of Data is Complete.")


End Sub
