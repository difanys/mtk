--МТК ЧАЭС
require("component").gpu.setResolution(120,60)
local c = require("component")
local rsio = c.proxy("8ab1384e-a8a3-448c-9db5-7ea28d560e17") --Дебаг рсио
forms=require("forms")
forms.ignoreAll()

function Form1onCreate(self)
forms.stop()
end

Form1=forms.addForm()
Form1.color=5197647
Form1.border=1

exit=Form1:addButton(116,59,"Выход")
exit.W=2

--Режимы МТК
Label1=Form1:addLabel(20,3,"Tгаз")
Label1.W=4

Label2=Form1:addLabel(29,3,"Nтк")
Label2.W=3

Label3=Form1:addLabel(38,3,"Тгр")
Label3.W=3

Label4=Form1:addLabel(47,3,"Pтк")
Label4.W=3

Label5=Form1:addLabel(11,3,"G")
Label5.color=16777215
Label5.W=1
Label5.fontColor=0

Label6=Form1:addLabel(2,3,"G")
Label6.color=16777215
Label6.W=1
Label6.fontColor=0

Label7=Form1:addLabel(4,59,"00-00(ТК)")
Label7.W=9

--Параметры реактора
Label8=Form1:addLabel(16,59,"Тгаз=000")
Label8.W=8

Label9=Form1:addLabel(27,59,"Nтк=000")
Label9.W=7

Label10=Form1:addLabel(37,59,"Тгр=0000")
Label10.W=8

Label11=Form1:addLabel(48,59,"Ртк=000")
Label11.W=7

Frame2=Form1:addFrame(63,2,1)
Frame2.color=5197647
Frame2.H=3
Frame2.W=40

--Вывод реального времени
Label12=Form1:addLabel(110,3,"time")
Label12.W=4
Label12.fontColor=65535

Label13=Form1:addLabel(10,8,"ТК")
Label13.W=2

Label14=Form1:addLabel(13,8,"00-00")
Label14.color=16777215
Label14.W=5
Label14.fontColor=255


Form1onCreate(Form1)
forms.run(Form1)
