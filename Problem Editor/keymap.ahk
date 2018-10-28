
range(start, stop:="", step:=1) {
	static range := { _NewEnum: Func("_RangeNewEnum") }
	if !step
		throw "range(): Parameter 'step' must not be 0 or blank"
	if (stop == "")
		stop := start, start := 0
	; Formula: r[i] := start + step*i ; r = range object, i = 0-based index
	; For a postive 'step', the constraints are i >= 0 and r[i] < stop
	; For a negative 'step', the constraints are i >= 0 and r[i] > stop
	; No result is returned if r[0] does not meet the value constraint
	if (step > 0 ? start < stop : start > stop) ;// start == start + step*0
		return { base: range, start: start, stop: stop, step: step }
}

_RangeNewEnum(r) {
	static enum := { "Next": Func("_RangeEnumNext") }
	return { base: enum, r: r, i: 0 }
}

_RangeEnumNext(enum, ByRef k, ByRef v:="") {
	stop := enum.r.stop, step := enum.r.step
	, k := enum.r.start + step*enum.i
	if (ret := step > 0 ? k < stop : k > stop)
		enum.i += 1
	return ret
}

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
replace := {≤:"\leq ",≥:"\geq ",∫:"\int ",∑:"\sum ",（:" (",）:") ",，:", ", ≠:"\neq ",％:"%", ∪:"\cup",……:"\cdots ", …:"\cdots ", ：:":",？:"?",×:"\times "}
For what, with in replace
    StringReplace, clipboard, clipboard, %what%, %with%, All
replace := {"...":"\cdots ", "<=":"\leq ", ">=":"\geq ","~":"\sim ", "\cdots \cdots":"\cdots"}
For what, with in replace
    StringReplace, clipboard, clipboard, %what%, %with%, All
replace := {𝑎:"a",𝑏:"b",𝑐:"c",𝑑:"d",𝑒:"e",𝑓:"f",𝑔:"g",ℎ:"h",𝑖:"i",𝑗:"j",𝑘:"k",𝑙:"l",𝑚:"m",𝑛:"n",𝑜:"o",𝑝:"p",𝑞:"q",𝑟:"r",𝑠:"s",𝑡:"t",𝑢:"u",𝑣:"v",𝑤:"w",𝑥:"x",𝑦:"y",𝑧:"z"}
For what, with in replace
    StringReplace, clipboard, clipboard, %what%, %with%, All
replace := {𝐴:"A",𝐵:"B",𝐶:"C",𝐷:"D",𝐸:"E",𝐹:"F",𝐺:"G",𝐻:"H",𝐼:"I",𝐽:"J",𝐾:"K",𝐿:"L",𝑀:"M",𝑁:"N",𝑂:"O",𝑃:"P",𝑄:"Q",𝑅:"R",𝑆:"S",𝑇:"T",𝑈:"U",𝑉:"V",𝑊:"W",𝑋:"X",𝑌:"Y",𝑍:"Z"}
For what, with in replace
    StringReplace, clipboard, clipboard, %what%, %with%, All
return

!-::
Clipboard := StrReplace(Clipboard, "`r`n", "`r`n`r`n")    
return
