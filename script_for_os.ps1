Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
<#Описание элементов формы
-----------------------------------#>
<#Формы, группы#>
<#Общие параметры в программе#>
<#1-PrName, 2-CPU, 3-Ws, 4-NPM, 5-SI, 6-PM, 7-Handles#>
$ProcessParameters = @($true, $true, $false,
$false, $false, $false, $false, $false)
$Global:n = 8
$stringWhere = $PSScriptRoot
<#$FullPathToEXE = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
$DirectoryContainingEXE = [System.IO.Path]::GetDirectoryName($FullPathToEXE)
$stringWhere = [string]$DirectoryContainingEXE#>
<#Главная форма#>
$MainForm = New-Object system.Windows.Forms.Form
$MainForm.ClientSize = New-Object System.Drawing.Point(790,565)
$MainForm.Text = "Вывод списка исполняемых процессов"
$MainForm.TopMost = $false
$MainForm.Icon = $stringWhere + "\icons\monitor.ico"
$MainForm.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$MainForm.BackgroundImage = [System.Drawing.Image]::FromFile($stringWhere+"\icons\main_page.jpg")

$MainForm.BackgroundImageLayout = "Stretch"
$InputDataGroup = New-Object system.Windows.Forms.Groupbox
$InputDataGroup.Height = 170
$InputDataGroup.Width = 733
$InputDataGroup.Text = "Параметры списка"
$InputDataGroup.Location = New-Object System.Drawing.Point(20,50)
$InputDataGroup.BackColor = [System.Drawing.Color]::FromName("Transparent")
$OutputDataGroup = New-Object system.Windows.Forms.Groupbox
$OutputDataGroup.Height = 329
$OutputDataGroup.Width = 731
$OutputDataGroup.Text = "Исполняемые процессы"
$OutputDataGroup.Location = New-Object System.Drawing.Point(20,223)
$OutputDataGroup.BackColor = [System.Drawing.Color]::FromName("Transparent")
<#Форма справки#>
<#Элементы главной формы#>
$LabelMainTitle = New-Object system.Windows.Forms.Label
$LabelMainTitle.Text = "Вывод списка исполняемых процессов"
$LabelMainTitle.AutoSize = $true
$LabelMainTitle.Width = 100
$LabelMainTitle.Height = 25
$LabelMainTitle.Location = New-Object System.Drawing.Point(225,25)
$LabelMainTitle.Font = New-Object System.Drawing.Font ('Microsoft Sans Serif',13)
$LabelMainTitle.BackColor = [System.Drawing.Color]::FromName("Transparent")
$StartButton = New-Object system.Windows.Forms.Button
$StartButton.Text = "Вывести список"
$StartButton.Width = 251
$StartButton.Height = 30
$StartButton.Location = New-Object System.Drawing.Point(450,120)
$StartButton.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$StartButton.BackColor = "255, 255, 255"
$AdditionallyButton = New-Object system.Windows.Forms.Button
$AdditionallyButton.Text = "Дополнительно..."
$AdditionallyButton.Width = 251
$AdditionallyButton.Height = 30
$AdditionallyButton.Location = New-Object System.Drawing.Point(450,80)
$AdditionallyButton.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$AdditionallyButton.BackColor = "255, 255, 255"
$DataGridView = New-Object system.Windows.Forms.DataGridView
$DataGridView.Width = 688
$DataGridView.Height = 300
$DataGridView.Location = New-Object System.Drawing.Point(17,21)

29
$DataGridView.BackgroundColor = "255, 255, 255"
$DataGridView.GridColor = "95, 216, 250"
$DataGridView.ReadOnly = $true
$DataGridView.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
<#Элементы группы входных параметров#>
$RadioButtonAllProcess = New-Object system.Windows.Forms.RadioButton
$RadioButtonAllProcess.text = "Все процессы"
$RadioButtonAllProcess.AutoSize = $true
$RadioButtonAllProcess.Checked = $true
$RadioButtonAllProcess.width = 104
$RadioButtonAllProcess.height = 20
$RadioButtonAllProcess.location = New-Object System.Drawing.Point(18,15)
$RadioButtonAllProcess.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$RadioButtonSomeProcess = New-Object system.Windows.Forms.RadioButton
$RadioButtonSomeProcess.text = "Некоторые процессы"
$RadioButtonSomeProcess.AutoSize = $true
$RadioButtonSomeProcess.width = 104
$RadioButtonSomeProcess.height = 20
$RadioButtonSomeProcess.location = New-Object System.Drawing.Point(18,35)
$RadioButtonSomeProcess.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$PanelParametrInput = New-Object system.Windows.Forms.Panel
$PanelParametrInput.height = 90
$PanelParametrInput.width = 320
$PanelParametrInput.location = New-Object System.Drawing.Point(41,60)
$CheckBoxGUI = New-Object system.Windows.Forms.CheckBox
$CheckBoxGUI.text = "Графические открытые"
$CheckBoxGUI.AutoSize = $false
$CheckBoxGUI.width = 200
$CheckBoxGUI.height = 20
$CheckBoxGUI.location = New-Object System.Drawing.Point(0,0)
$CheckBoxGUI.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBoxBadProcess = New-Object system.Windows.Forms.CheckBox
$CheckBoxBadProcess.text = "Неотвечающие процессы"
$CheckBoxBadProcess.AutoSize = $false
$CheckBoxBadProcess.width = 200
$CheckBoxBadProcess.height = 20
$CheckBoxBadProcess.location = New-Object System.Drawing.Point(0,20)
$CheckBoxBadProcess.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBoxWorkingSat = New-Object system.Windows.Forms.CheckBox
$CheckBoxWorkingSat.text = "min/max рабочее пространство"
$CheckBoxWorkingSat.AutoSize = $false
$CheckBoxWorkingSat.width = 250
$CheckBoxWorkingSat.height = 20
$CheckBoxWorkingSat.location = New-Object System.Drawing.Point(0,40)
$CheckBoxWorkingSat.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
<#параметры рабочего пространства вывода процессов#>
$TextBoxMinWs = New-Object system.Windows.Forms.NumericUpDown
$TextBoxMinWs.width = 84
$TextBoxMinWs.height = 20
$TextBoxMinWs.Minimum = 0
$TextBoxMinWs.Maximum = 1000000000
$TextBoxMinWs.location = New-Object System.Drawing.Point(36,3)
$LabelMinWS = New-Object system.Windows.Forms.Label
$LabelMinWS.text = "min:"
$LabelMinWS.AutoSize = $true
$LabelMinWS.width = 25
$LabelMinWS.height = 10
$LabelMinWS.location = New-Object System.Drawing.Point(0,6)
$LabelMinWS.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$LabelMaxWs = New-Object system.Windows.Forms.Label
$LabelMaxWs.text = "max:"
$LabelMaxWs.AutoSize = $true
$LabelMaxWs.width= 25
$LabelMaxWs.height = 10
$LabelMaxWs.location = New-Object System.Drawing.Point(138,6)
$LabelMaxWs.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$TextBoxMaxWs = New-Object system.Windows.Forms.NumericUpDown
$TextBoxMaxWs.width = 100
$TextBoxMaxWs.height = 20
$TextBoxMaxWs.location = New-Object System.Drawing.Point(177,4)
$PanelWsMinMax = New-Object system.Windows.Forms.Panel
$PanelWsMinMax.height = 35
$PanelWsMinMax.width = 320
$TextBoxMaxWs.Minimum = 0
$TextBoxMaxWs.Maximum = 1000000000
$PanelWsMinMax.location = New-Object System.Drawing.Point(30,60)

30

<#Меню главной форм#>
$Menu = New-Object System.Windows.Forms.MainMenu
$menuItemMain= New-Object System.Windows.Forms.menuItem
$menuItemMain.Text= 'Основное'
$Menu.MenuItems.Add($menuItemMain)
$menuItemAboutProject= New-Object System.Windows.Forms.menuItem
$menuItemAboutProject.Text= 'О проекте'
$menuItemMain.MenuItems.Add($menuItemAboutProject)
$menuItemAboutCreator = New-Object System.Windows.Forms.MenuItem
$menuItemAboutCreator.Text = 'О разработчике'
$menuItemMain.MenuItems.Add($menuItemAboutCreator)
$menuItemTools = New-Object System.Windows.Forms.menuItem
$menuItemTools.Text= 'Инструменты'
$Menu.MenuItems.Add($menuItemTools)
$menuItemToolsAddProcess = New-Object System.Windows.Forms.MenuItem
$menuItemToolsAddProcess.Text = 'Создание процесса'
$menuItemTools.MenuItems.Add($menuItemToolsAddProcess)
$menuItemToolsDelProcess = New-Object System.Windows.Forms.MenuItem
$menuItemToolsDelProcess.Text = 'Остановка процесса'
$menuItemTools.MenuItems.Add($menuItemToolsDelProcess)
$menuItemReference= New-Object System.Windows.Forms.menuItem
$menuItemReference.Text= 'Справка'
$Menu.MenuItems.Add($menuItemReference)
<#Добавление элементов на гланую форму#>
$MainForm.Menu= $Menu
$MainForm.controls.AddRange(@($InputDataGroup,$OutputDataGroup,$LabelMainTitle))
$InputDataGroup.controls.AddRange(@($StartButton, $RadioButtonAllProcess, $RadioButtonSomeProcess,
$AdditionallyButton))
$OutputDataGroup.controls.AddRange(@($DataGridView))
$PanelParametrInput.Controls.AddRange(@($CheckBoxGUI, $CheckBoxBadProcess, $CheckBoxWorkingSat))
$PanelWsMinMax.Controls.AddRange(@($LabelMinWS, $LabelMaxWs, $TextBoxMinWs, $TextBoxMaxWs))
<#!!!!!!!!!!!!!!!!!!!!!!ФОРМА ДОПОЛНИТЕЛЬНЫХ ПАРАМЕТРОВ!!!!!!!!!!!!!!!!11#>
$FormNewParametr = New-Object system.Windows.Forms.Form
$FormNewParametr.ClientSize = New-Object System.Drawing.Point(550,280)
$FormNewParametr.text = "Дополнительные параметры списка"
$FormNewParametr.TopMost = $false
$FormNewParametr.BackColor = "255, 255, 255"
$FormNewParametr.Icon = $stringWhere + '\icons\monitor.ico'
$ErrorProvider1 = New-Object system.Windows.Forms.ErrorProvider
$ToolTip1 = New-Object system.Windows.Forms.ToolTip
$LabelNewParametr = New-Object system.Windows.Forms.Label
$LabelNewParametr.Text = "Параметры процессов"
$LabelNewParametr.AutoSize = $true
$LabelNewParametr.Width = 100
$LabelNewParametr.Height = 30
$LabelNewParametr.Location = New-Object System.Drawing.Point(160,17)
$LabelNewParametr.Font = New-Object System.Drawing.Font ('Microsoft Sans Serif', 12)
$LabelNewParametr.BackColor = [System.Drawing.Color]::FromName("Transparent")
$GOutParametrs = New-Object system.Windows.Forms.Groupbox
$GOutParametrs.height = 161
$GOutParametrs.width = 500
$GOutParametrs.text = "Выводимые параметры процессов"
$GOutParametrs.location = New-Object System.Drawing.Point(21,52)
$CheckBoxProcessName = New-Object system.Windows.Forms.CheckBox
$CheckBoxProcessName.text = "Имя процесса"
$CheckBoxProcessName.AutoSize = $false
$CheckBoxProcessName.width = 120
$CheckBoxProcessName.height = 20
$CheckBoxProcessName.Checked = $true
$CheckBoxProcessName.location = New-Object System.Drawing.Point(8,20)
$CheckBoxProcessName.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBoxSI = New-Object system.Windows.Forms.CheckBox
$CheckBoxSI.text = "Идентификатор сеанса"
$CheckBoxSI.AutoSize = $false
$CheckBoxSI.width = 200
$CheckBoxSI.height = 20
$CheckBoxSI.location = New-Object System.Drawing.Point(220,20)
$CheckBoxSI.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBoxCPU = New-Object system.Windows.Forms.CheckBox
$CheckBoxCPU.text = "Процессорное время"
$CheckBoxCPU.AutoSize = $false
$CheckBoxCPU.width = 180
$CheckBoxCPU.height = 20

31

$CheckBoxCPU.Checked = $true
$CheckBoxCPU.location = New-Object System.Drawing.Point(8,40)
$CheckBoxCPU.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBoxWS = New-Object system.Windows.Forms.CheckBox
$CheckBoxWS.text = "Рабочий набор"
$CheckBoxWS.AutoSize = $false
$CheckBoxWS.width = 180
$CheckBoxWS.height = 20
$CheckBoxWS.location = New-Object System.Drawing.Point(220,40)
$CheckBoxWS.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBoxPM = New-Object system.Windows.Forms.CheckBox
$CheckBoxPM.text = "Выгружаемая память"
$CheckBoxPM.AutoSize = $false
$CheckBoxPM.width = 180
$CheckBoxPM.height = 20
$CheckBoxPM.location = New-Object System.Drawing.Point(220,60)
$CheckBoxPM.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBoxNPM = New-Object system.Windows.Forms.CheckBox
$CheckBoxNPM.text = "Невыгружаемая память"
$CheckBoxNPM.AutoSize = $false
$CheckBoxNPM.width = 180
$CheckBoxNPM.height = 20
$CheckBoxNPM.location = New-Object System.Drawing.Point(8,60)
$CheckBoxNPM.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBoxHandles = New-Object system.Windows.Forms.CheckBox
$CheckBoxHandles.text = "Дескриптор процесса"
$CheckBoxHandles.AutoSize = $false
$CheckBoxHandles.width = 190
$CheckBoxHandles.height = 20
$CheckBoxHandles.location = New-Object System.Drawing.Point(8,80)
$CheckBoxHandles.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBoxID = New-Object system.Windows.Forms.CheckBox
$CheckBoxID.text = "Идентификатор процесса"
$CheckBoxID.AutoSize = $false
$CheckBoxID.width = 190
$CheckBoxID.height = 20
$CheckBoxID.location = New-Object System.Drawing.Point(220,80)
$CheckBoxID.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$OKButton = New-Object system.Windows.Forms.Button
$OKButton.Text = "ОК"
$OKButton.Width = 100
$OKButton.Height = 30
$OKButton.Location = New-Object System.Drawing.Point(390,240)
$OKButton.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CancelButton = New-Object system.Windows.Forms.Button
$CancelButton.Text = "Отмена"
$CancelButton.Width = 100
$CancelButton.Height = 30
$CancelButton.Location = New-Object System.Drawing.Point(280,240)
$CancelButton.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$FormNewParametr.controls.AddRange(@($GOutParametrs, $OKButton, $CancelButton, $LabelNewParametr))
$GOutParametrs.Controls.AddRange(@($CheckBoxSI, $CheckBoxProcessName, $CheckBoxCPU, $CheckBoxWS,
$CheckBoxPM,
$CheckBoxNPM, $CheckBoxHandles, $CheckBoxID))
<#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1#>
<#Форма запуска и удаления процесса#>
$FormStartProcess = New-Object system.Windows.Forms.Form
$FormStartProcess.ClientSize = New-Object System.Drawing.Point(392,126)
$FormStartProcess.text = "Запуск процесса"
$FormStartProcess.TopMost = $false
$FormStartProcess.BackColor = "255, 247, 217"
$FormStartProcess.Icon = $stringWhere + '\icons\monitor.ico'
$LabelDelProcess = New-Object system.Windows.Forms.Label
$LabelDelProcess.text = "Введите необходимые данные"
$LabelDelProcess.AutoSize = $true
$LabelDelProcess.width = 25
$LabelDelProcess.height = 10
$LabelDelProcess.location = New-Object System.Drawing.Point(18,19)
$LabelDelProcess.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$LabelNameProcess = New-Object system.Windows.Forms.Label
$LabelNameProcess.text = "Название процесса: "
$LabelNameProcess.AutoSize = $true
$LabelNameProcess.width = 20
$LabelNameProcess.height = 10
$LabelNameProcess.location = New-Object System.Drawing.Point(28,57)

32

$LabelNameProcess.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$TextBoxNameProcess = New-Object system.Windows.Forms.TextBox
$TextBoxNameProcess.multiline = $false
$TextBoxNameProcess.width = 170
$TextBoxNameProcess.height = 20
$TextBoxNameProcess.location = New-Object System.Drawing.Point(170,52)
$TextBoxNameProcess.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$ButtomOkStart = New-Object system.Windows.Forms.Button
$ButtomOkStart.text = "ОК"
$ButtomOkStart.width = 60
$ButtomOkStart.height = 30
$ButtomOkStart.location = New-Object System.Drawing.Point(321,86)
$ButtomOkStart.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',8)
$ButtomOkStart.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$ButtonCancelStart = New-Object system.Windows.Forms.Button
$ButtonCancelStart.text = "ОТМЕНА"
$ButtonCancelStart.width = 60
$ButtonCancelStart.height = 30
$ButtonCancelStart.location = New-Object System.Drawing.Point(252,86)
$ButtonCancelStart.Font = New-Object System.Drawing.Font('Microsoft Sans Serif',8)
$ButtonCancelStart.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$FormStartProcess.controls.AddRange(@($LabelDelProcess,$LabelNameProcess,$TextBoxNameProcess,$ButtomOkStart,$ButtonCancelStart))
<#Функции элементов
-------------------------------------#>
<#Вывод списка исполняемых процессов при нажатии на кнопку вывода#>
$StartButton.Add_Click({
FindCheckSomeProcess
ShowProcess
})
<#-----------------------------Меню----------------------------------#>
$menuItemAboutProject.Add_Click({
[System.Windows.Forms.MessageBox]::Show("Курсовой проект по предмету: Операционные
системы.`nТема: вывод списка исполняемых процессов.", "О проекте")
})
$menuItemAboutCreator.Add_Click({
[System.Windows.Forms.MessageBox]::Show("Разработчик проекта: Григорий Иванин.", "О
разработчике")
})
$menuItemReference.Add_Click({
[System.Windows.Forms.MessageBox]::Show("Программа предназначена для работы со списками
исполняемых процессов.
На панеле ПАРАМЕТРЫ СПИСКА необходимо установить необходимые вам параметры
Обновление списка происходит при нажатии кнопки ВЫВЕСТИ СПИСОК.
Во вкладке меню ИНСТРУМЕНТЫ можно остановить или запустить процесс (вводится имя процесса без
расширения).", "Справка")
})
<#--------------------------Ввод данных-------------------#>
$RadioButtonAllProcess.Add_Click({
$InputDataGroup.Controls.Remove($PanelParametrInput) })
$RadioButtonSomeProcess.Add_Click({
$InputDataGroup.Controls.Add($PanelParametrInput) })
$CheckBoxWorkingSat.Add_Click({
if ($CheckBoxWorkingSat.Checked){
$PanelParametrInput.Controls.Add($PanelWsMinMax)
}
else{
$PanelParametrInput.Controls.Remove($PanelWsMinMax)
}
})
$AdditionallyButton.Add_Click({
ReturnCheckParametrs
$FormNewParametr.ShowDialog()
})
$CancelButton.Add_Click({
AddCheckParametrs
$FormNewParametr.Close()
})
$OKButton.Add_Click({
ReturnCheckParametrs
$FormNewParametr.Close()
FindCheckSomeProcess
ShowProcess
})
$StPrs = $false
$menuItemToolsAddProcess.Add_Click({

33

$StPrs = $true
$FormStartProcess.ShowDialog()
})
<#-------------------Остановка процесса-------------------#>
$menuItemToolsDelProcess.Add_Click({
$FormStartProcess.text = "Остановка процесса"
$FormStartProcess.ShowDialog()
})
$ButtomOkStart.Add_Click({
AddDelProcess($StPrs)
FindCheckSomeProcess
ShowProcess
})
$TextBoxNameProcess.Add_KeyDown({
if ($_.KeyCode -eq "Enter") {
AddDelProcess($StPrs)
FindCheckSomeProcess
ShowProcess
}
})
$ButtonCancelStart.Add_Click({
$FormStartProcess.Close()
})
<#!!!!!!!!!!!!!!!!!#>
<#---------------------Функции------------------------#>
<#Вывод списка процессов#>
function ShowProcess{
$DataGridView.columns.Clear()
$dataGridView.ColumnCount = 0
$dataGridView.ColumnHeadersVisible = $true
$dataGridView.ColumnHeadersHeight = 60
$s = @(" ", " ")
$ccount = 0
for ([int]$i = 0; $i -lt $Global:n; $i++){
if ($ProcessParameters[$i] -eq $true){
$dataGridView.ColumnCount++
$s = FindNameSize($i, $s)
$DataGridView.Columns[$ccount].Name = $s[0]
$DataGridView.Columns[$ccount].Width = [int]$s[1]
$ccount++
}
}
<#Определние списка процессов#>
$a = Get-Process
if (!($RadioButtonAllProcess.Checked)){
if ($CheckBoxGUI.Checked){
$a = $a | Where-Object {$_.mainWindowTitle}
}
if($CheckBoxBadProcess.Checked){
$a = $a | where-object {$_.Responding -eq $false}
}
if ($CheckBoxWorkingSat.Checked){
if (!($TextBoxMinWs.Value -eq 0)){ $a = $a | where-object {$_.WorkingSet -GT
$TextBoxMinWs.Value} }
if (!($TextBoxMaxWs.Value -eq 0)){
$a = $a | where-object {$_.WorkingSet -lt $TextBoxMaxWs.Value}
}
}
}
$a | foreach {
$l = @()
$count = 0
for ([int]$i=0; $i -lt $ccount; $i++){
if ($DataGridView.columns[$i].Name -eq "Имя`nпроцесса"){
$l+=$_.ProcessName }
if ($DataGridView.columns[$i].Name -eq "Процессорное`nвремя"){
$l+=$_.CPU}
if ($DataGridView.columns[$i].Name -eq "Рабочий`nнабор`nпроцесса"){
$l+=$_.WorkingSet}

34

if ($DataGridView.columns[$i].Name -eq "Невыгружаемая`nпамять"){
$l+=$_.NPM}
if ($DataGridView.columns[$i].Name -eq "Идентификатор`nсеанса"){
$l+=$_.SI}
if ($DataGridView.columns[$i].Name -eq "Выгружаемая`nпамять"){
$l+=$_.PM}
if ($DataGridView.columns[$i].Name -eq "Дескриптор`nпроцесса"){
$l+=$_.Handles}
if ($DataGridView.columns[$i].Name -eq "Идентификатор`nпроцесса"){
$l+=$_.ID}}
$dataGridView.Rows.Add($l)
}
}
<#Проверяет, нажаты ли какие-то элементы дополнительных процессов#>
function FindCheckSomeProcess{
if ((!($CheckBoxWorkingSat.Checked)) -and (!($CheckBoxBadProcess.Checked)) -and
(!($CheckBoxGUI.Checked))){
$InputDataGroup.Controls.Remove($PanelParametrInput)
$RadioButtonAllProcess.Checked = $true
}
}
<#Добавляет значения флагов дополнительного окна#>
function AddCheckParametrs{
$CheckBoxProcessName.Checked = $ProcessParameters[0]
$CheckBoxCPU.Checked = $ProcessParameters[1]
$CheckBoxWS.Checked = $ProcessParameters[2]
$CheckBoxNPM.Checked = $ProcessParameters[3]
$CheckBoxSI.Checked = $ProcessParameters[4]
$CheckBoxPM.Checked = $ProcessParameters[5]
$CheckBoxHandles.Checked = $ProcessParameters[6]
$CheckBoxID.Checked = $ProcessParameters[7]
}
<#Возвращает в массив значения флагов дополнительного окна#>
function ReturnCheckParametrs{
$ProcessParameters[0] = $CheckBoxProcessName.Checked
$ProcessParameters[1] = $CheckBoxCPU.Checked
$ProcessParameters[2] = $CheckBoxWS.Checked
$ProcessParameters[3] = $CheckBoxNPM.Checked
$ProcessParameters[4] = $CheckBoxSI.Checked
$ProcessParameters[5] = $CheckBoxPM.Checked
$ProcessParameters[6] = $CheckBoxHandles.Checked
$ProcessParameters[7] = $CheckBoxID.Checked
}
function FindNameSize{
param($i, $s)
switch ($i)
{
0 {$s = @("Имя`nпроцесса", "130")}
1 {$s = @("Процессорное`nвремя", "100")}
2 {$s = @("Рабочий`nнабор`nпроцесса","80")}
3 {$s = @("Невыгружаемая`nпамять","120")}
4 {$s = @("Идентификатор`nсеанса","120")}
5 {$s = @("Выгружаемая`nпамять","110")}
6 {$s = @("Дескриптор`nпроцесса","100")}
7 {$s = @("Идентификатор`nпроцесса", "120")}
}
return $s
}
function AddDelProcess{
param($StPrs)
if ($StPrs -eq $true){
Start-Process -FilePath $TextBoxNameProcess.Text
}
else{
Kill -Name $TextBoxNameProcess.Text
}} $MainForm.ShowDialog()