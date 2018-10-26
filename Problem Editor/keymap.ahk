
; $text$（use TeX）
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
replace :=  {≤:"\leq ",≥:"\geq ",∫:"\int ",∑:"\sum ",（:" (",）:") ",，:", ", ~:"\sim ", ≠:"\neq ",％:"%"}
For what, with in replace
    StringReplace, clipboard, clipboard, %what%, %with%, All
replace := {"...":"\cdots ", "<=":"\leq ", ">=":"\geq "}
For what, with in replace
    StringReplace, clipboard, clipboard, %what%, %with%, All
Clipboard := StrReplace(Clipboard, "`r`n", "`r`n`r`n")    
MsgBox, %clipboard%
Return
