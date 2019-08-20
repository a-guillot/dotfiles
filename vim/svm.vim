" Vim syntax file
" Language: svm

if exists("b:current_syntax")
  finish
endif

" Statements
syn keyword svm_statements ASSIGN DEFINE LTLSPEC FAIRNESS case esac IN INIT INVARSPEC JUSTICE MAX MIN TRANS VAR
syn match svm_statements "MODULE.*"

" Constants
syn keyword svm_constants TRUE FALSE
syn match svm_constants "\<[A-Z]+\>"
syn match svm_constants "[0-9]"
syn match svm_constants "[0-9]..[0-9]*"
syn match svm_constants "{.*}"

" Types
syn keyword svm_types array of bool boolean real unsigned signed word

" TODOs
syn keyword svm_todos TODO NOTE

" Comments
syn match svm_comments "--.*$" contains=svm_todos

" Identifiers
syn keyword svm_identifiers next init

" Operators
syn match svm_operators ":"
syn match svm_operators ":="
syn match svm_operators "->"
syn match svm_operators "&"
syn match svm_operators "|"

" Change current language syntax
let b:current_syntax = "svm"

" Assign pre-defined colors to types
hi def link svm_todos Todo
hi def link svm_types Type
hi def link svm_comments Comment
hi def link svm_constants Constant
hi def link svm_statements Statement
hi def link svm_identifiers Identifier
hi def link svm_operators String
