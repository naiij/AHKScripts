
; TeX map 
global tex_symbols_map := {≤:"\leq ",≥:"\geq ",∫:"\int ",∑:"\sum ",（:" (",）:") ",，:", ", ≠:"\neq ",％:"%", ∪:"\cup",……:"\cdots ", …:"\cdots "
, ：:":",？:"?",×:"\times ", ；:"; ",←:"\leftarrow ", 𝜋:"\pi ", ⊕:"\oplus ", ⨁:"\bigoplus ", ～:"\sim ", ⌊:"\lfloor ", ⌋:"\rfloor "}

global tex_str_symbols_map := {"...":"\cdots ", "<=":"\leq ", ">=":"\geq ","~":"\sim ", "\cdots \cdots":"\cdots","&lt;=":"\leq ","!=":"\neq "}

global italic_lower_letters_map := {𝑎:"a",𝑏:"b",𝑐:"c",𝑑:"d",𝑒:"e",𝑓:"f",𝑔:"g",ℎ:"h",𝑖:"i",𝑗:"j",𝑘:"k",𝑙:"l",𝑚:"m",𝑛:"n",𝑜:"o",𝑝:"p",𝑞:"q"
,𝑟:"r",𝑠:"s",𝑡:"t",𝑢:"u",𝑣:"v",𝑤:"w",𝑥:"x",𝑦:"y",𝑧:"z"}

global italic_upper_letters_map := {𝐴:"A",𝐵:"B",𝐶:"C",𝐷:"D",𝐸:"E",𝐹:"F",𝐺:"G",𝐻:"H",𝐼:"I",𝐽:"J",𝐾:"K",𝐿:"L",𝑀:"M",𝑁:"N",𝑂:"O",𝑃:"P",𝑄:"Q"
,𝑅:"R",𝑆:"S",𝑇:"T",𝑈:"U",𝑉:"V",𝑊:"W",𝑋:"X",𝑌:"Y",𝑍:"Z"}

global tex_replace_map := [tex_symbols_map, tex_str_symbols_map, italic_lower_letters_map, italic_upper_letters_map]

; chinese chars
global w_char := "\u3002|\uff1f|\uff01|\uff0c|\u3001|\uff1b|\uff1a|\u201c|\u201d|\u2018|\u2019|\uff08|\uff09|\u300a|\u300b|\u3008|\u3009|\u3010|\u3011|\u300e|\u300f|\u300c|\u300d|\ufe43|\ufe44|\u3014|\u3015|\u2026|\u2014|\uff5e|\ufe4f|\uffe5|\u4e00-\u9fa5"

; $text$ (use TeX)
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

; delete first and last char, then #### (h4)
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

; x% -> $x\%$
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


; symbol to TeX
!0::
For index, value in tex_replace_map
	For what, with in value
    	StringReplace, clipboard, clipboard, %what%, %with%, All

regex_from := "[" w_char + "]{1}^["+w_char+"]+["+w_char+"]"
regex_to := 
return

!-::
Clipboard := StrReplace(Clipboard, "`r`n", "`r`n`r`n")    
return

!F2::
Send {F2}
Sleep, 10
Send {Right}{Left}
Sleep, 10
Send {BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{Home}ex_{Enter}
return

!4::
Send ^a^4
return
