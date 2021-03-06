$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type sle_text from singlelineedit within w_main
end type
type p_1 from picture within w_main
end type
type cb_1 from commandbutton within w_main
end type
end forward

global type w_main from window
integer width = 1806
integer height = 1092
boolean titlebar = true
string title = "Generate QRCode"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_text sle_text
p_1 p_1
cb_1 cb_1
end type
global w_main w_main

on w_main.create
this.sle_text=create sle_text
this.p_1=create p_1
this.cb_1=create cb_1
this.Control[]={this.sle_text,&
this.p_1,&
this.cb_1}
end on

on w_main.destroy
destroy(this.sle_text)
destroy(this.p_1)
destroy(this.cb_1)
end on

type sle_text from singlelineedit within w_main
integer x = 73
integer y = 32
integer width = 1061
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type p_1 from picture within w_main
integer x = 73
integer y = 160
integer width = 1609
integer height = 736
boolean originalsize = true
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_main
integer x = 1170
integer y = 32
integer width = 521
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Generate QRCode"
end type

event clicked;//Generate QRCode call method and parameter description
OleObject ole_qrcode
String ls_code, ls_file,ls_directory,ls_filename
Int li_rc

If sle_text.Text = "" Then Return

ole_qrcode = Create OleObject
li_rc = ole_qrcode.ConnectToNewObject("QRCode.QRCodeEncoder")
If li_rc <> 0 Then
	MessageBox("Waring", "Please Setup QRCode")
	Return
End If

ole_qrcode.Mode = "Byte" //Encoding mode(AlphaNumeric,Numeric,Byte)
ole_qrcode.Size = 4 //size QR
ole_qrcode.Version = 7 //version
ole_qrcode.ErrorCorrect = "M" //Tolerance level(L, M, Q, H) 

//ls_file = Filname： C:\1234.JPG
//ole_qrcode.EncodeToFile( "string qrcode", "UTF8", ls_file)
ls_file = "C:\temp\1234.JPG"
FileDelete(ls_file)
p_1.PictureName = ""

ole_qrcode.EncodeToFile(sle_text.Text, "UTF8", ls_file)

p_1.PictureName = ls_file

Destroy ole_qrcode
end event

