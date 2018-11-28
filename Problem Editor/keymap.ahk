

; TeX map   Tex 符号映射
global tex_symbols_map := {≤:"\leq ",≥:"\geq ",∫:"\int ",∑:"\sum ",（:" (",）:") ",，:", ", ≠:"\neq ",％:"%", ∪:"\cup",……:"\cdots ", …:"\cdots "
, ：:":",？:"?",×:"\times ", ；:"; ",←:"\leftarrow ", 𝜋:"\pi ", ⊕:"\oplus ", ⨁:"\bigoplus ", ～:"\sim ", ⌊:"\lfloor ", ⌋:"\rfloor "}

global tex_str_symbols_map := {"...":"\cdots ", "<=":"\leq ", ">=":"\geq ","~":"\sim ", "\cdots \cdots":"\cdots","&lt;=":"\leq ","!=":"\neq "}

global italic_lower_letters_map := {𝑎:"a",𝑏:"b",𝑐:"c",𝑑:"d",𝑒:"e",𝑓:"f",𝑔:"g",ℎ:"h",𝑖:"i",𝑗:"j",𝑘:"k",𝑙:"l",𝑚:"m",𝑛:"n",𝑜:"o",𝑝:"p",𝑞:"q"
,𝑟:"r",𝑠:"s",𝑡:"t",𝑢:"u",𝑣:"v",𝑤:"w",𝑥:"x",𝑦:"y",𝑧:"z"}

global italic_upper_letters_map := {𝐴:"A",𝐵:"B",𝐶:"C",𝐷:"D",𝐸:"E",𝐹:"F",𝐺:"G",𝐻:"H",𝐼:"I",𝐽:"J",𝐾:"K",𝐿:"L",𝑀:"M",𝑁:"N",𝑂:"O",𝑃:"P",𝑄:"Q"
,𝑅:"R",𝑆:"S",𝑇:"T",𝑈:"U",𝑉:"V",𝑊:"W",𝑋:"X",𝑌:"Y",𝑍:"Z"}

global tex_replace_map := [tex_symbols_map, tex_str_symbols_map, italic_lower_letters_map, italic_upper_letters_map]


;  Ctrl+4   $text$ (use TeX)  在当前选中文本两端加$
^4::
Send ^c
Sleep, 10
Send {Space}
Sleep, 10
Send $
Sleep, 10
Send ^v
Sleep, 10
Send $
Sleep, 10
Send {Space}
Return

; less equal
^,::
Send \leq{Space}
Return

;  Ctrl+3   delete first and last char, then #### (h4)   转换成h4标题
^3::
Send {Home}{Del}+3+3+3+3{Space}{End}{BS}
Return

; \texttt{text}
^t::
Send ^c
Sleep, 10
Send \texttt
Send {{}
Sleep, 10
Send ^v
Sleep, 10
Send {}}
Sleep, 10
Send {Space}
Return

;  Ctrl+5  x% -> $x\%$  当前选中文本转换成TeX格式的百分数
^5::
Send ^c
Sleep, 10
Send {Space}
Sleep, 10
Send $
Sleep, 10
Send ^v
Sleep, 10
Send $
Sleep, 10
Send {Space}{left}{left}{left}\
Return

^8::
Send \times{Space}
Return

!,::
Send ^c
Sleep, 10
Send +,td+.
Send ^v
Sleep, 10
Send +,/td+.
Return


;  Alt+0  symbol to TeX  一些符号转为 TeX 格式
!0::
For index, value in tex_replace_map
	For what, with in value
    	StringReplace, clipboard, clipboard, %what%, %with%, All

return

;  Alt+9  (汉字|。|换行)(其它字符)(汉字|。|换行) ->  (汉字|。|换行) $ (其它字符) $ (汉字|。|换行)   transform to LaTex format
!9::
clipboard := RegExReplace(clipboard, "([\p{Han}|\r|\n|#|" Chr(0x3002) "])([^\p{Han}|\r|\n|" Chr(0x3002) "]{0,}[^\p{Han}|\r|\n|\s|#|,|" Chr(0x3002) "]+[^\p{Han}|\r\n|" Chr(0x3002) "]{0,})([\p{Han}|\r|\n|#|" Chr(0x3002) "])", "$1 $ $2 $ $3")
; 百分数百分号前面加\
clipboard := RegExReplace(clipboard, "(\d{2}|100)%", "$1\%")
return

!-::
Clipboard := StrReplace(Clipboard, "`r`n", "`r`n`r`n")    
return

; Alt+F2  文件名改成ex_原文件名
!F2::
Send {F2}
Sleep, 10
Send {End}{Left}{Left}{Left}
Sleep, 10
Send {BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{Home}ex_{Enter}
return

; Alt+4   全选，然后Ctrl+4
!4::
Send ^a^4
return
