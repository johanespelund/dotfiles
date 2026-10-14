;; extends

; nvim-treesitter highlights "endif", "endsubroutine" etc., and the second word of
; "end if", "end subroutine", but not the separate "end" token. Colour it like the
; keyword it closes.
"end" @keyword

(end_if_statement
  "end" @keyword.conditional)

(end_where_statement
  "end" @keyword.conditional)

(end_select_statement
  "end" @keyword.conditional)

(end_do_loop_statement
  "end" @keyword.repeat)

(end_forall_statement
  "end" @keyword.repeat)

(end_function_statement
  "end" @keyword.function)

(end_subroutine_statement
  "end" @keyword.function)

(end_module_procedure_statement
  "end" @keyword.function)
