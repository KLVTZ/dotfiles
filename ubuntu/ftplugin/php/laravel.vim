" Prepare a new PHP class
function! s:Class()
	let name = input('Class name: ')
	let namespace = input('Any Namespace: ')

	if strlen(namespace)
		exec 'normal i<?php namespace ' . namespace . ';'
	else
		exec 'normal i<?php'
	endif

	" Open class
	exec 'normal iclass ' . name . ' {}O'
	exec 'normal ipublic function __construct(){}'
endfunction
nnoremap <buffer> <leader>1 :call <SID>Class()<CR>

" add dependecies to constructor while using proper namespacing
function! s:AddDependency()
	let dependency = input('Var Name: ')
	let namespace = input('Class Path: ')

	let segments = split(namespace, '\')
	let typehint = segments[-1]

	exec 'normal gg/construct%i, ' . typehint . ' $' . dependency .
				\ '/}O$this->' . dependency . ' = $' . dependency .
				\ ';==?\{kOprotected $' . dependency .
				\ ';?\{Ouse ' . namespace . ';'

	" Remove opening comma if there is only one dependency
	exec 'normal :%s/(, /(/ge'
endfunction
nnoremap <buffer> <leader>2 :call <SID>AddDependency()<CR>

" Laravel framework commons
nnoremap <buffer> <leader>lr :e app/routes.php<cr>
nnoremap <buffer> <leader>lca :e app/config/app.php<cr>81Gf(%0
nnoremap <buffer> <leader>lcd :e app/config/database.php<cr>
nnoremap <buffer> <leader>lc :e composer.json<cr>
