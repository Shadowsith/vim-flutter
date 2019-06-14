if exists('g:loaded_flutter')
  finish
else
  let g:loaded_flutter=1
endif

if !exists('g:flutter_command!')
  let g:flutter_command='flutter'
endif

if !exists('g:flutter_hot_reload_on_save')
  let g:flutter_hot_reload_on_save=1
endif

command! FlutterDevices call flutter#devices()
command! FlutterEmulators call flutter#emulators()
command! -nargs=1 FlutterEmulatorsLaunch call flutter#emulators_launch(<f-args>)
command! -nargs=* FlutterRun call flutter#run(<f-args>)
command! FlutterHotReload call flutter#hot_reload()
command! FlutterHotRestart call flutter#hot_restart()
command! FlutterQuit call flutter#quit()
command! FlutterVisualDebug call flutter#visual_debug()
command! FlutterAnalyze call flutter#analyze()
command! FlutterClean call flutter#clean()
command! FlutterDoctor call flutter#doctor()
command! FlutterDrive call flutter#drive()
command! FlutterScreenshot call flutter#screenshot()
command! FlutterLogs call flutter#logs()
command! FlutterInstall call flutter#install()
command! FlutterFormat call flutter#format()

if g:flutter_hot_reload_on_save
  autocmd FileType dart autocmd BufWritePost <buffer> call flutter#hot_reload_quiet()
endif

command! FlutterSplit :split __Flutter_Output__
command! FlutterVSplit :vsplit __Flutter_Output__
command! FlutterTab :tabnew __Flutter_Output__

function! FlutterMenu() abort  
  menu Flutter.Run :FlutterRun<CR>
  menu Flutter.Hot\ Reload :FlutterHotReload<CR>
  menu Flutter.Hot\ Restart :FlutterHotRestart<CR>
  menu Flutter.Open\ Output.In\ &Split :FlutterSplit<CR>
  menu Flutter.Open\ Output.In\ &VSplit :FlutterVSplit<CR>
  menu Flutter.Open\ Output.In\ &Tab :FlutterTab<CR>
  menu Flutter.Quit :FlutterQuit<CR>
  menu Flutter.View\ Devices :FlutterDevices<CR>
endfunction
