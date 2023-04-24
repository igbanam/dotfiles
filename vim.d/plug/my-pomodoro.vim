vim9script

const NOTIFICATION_LENGTH = 20
var pomodoro_timer: number
var pomodoro_popup_options = {
  zindex: 200,
  tabpage: -1,
  pos: 'topright',
  posinvert: v:false,
  line: 2,
  col: winwidth(0) - 1,
  # moved: 'any',
  border: [],
  padding: [0, 1, 0, 1],
  highlight: 'WarningMsg',
  maxwidth: NOTIFICATION_LENGTH,
  minwidth: NOTIFICATION_LENGTH,
  title: ' Pomodoro ',
  borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰']
}
var Tell = (message) => popup_notification(message, pomodoro_popup_options)

def PrepareForTelling(message: string): list<string>
  var result: list<string> = []
  var current_length: number = 0
  var current_line: list<string> = []

  for word in split(message)
    if current_length + len(word) >= NOTIFICATION_LENGTH
      add(result, join(current_line))
      current_line = []
      current_length = 0
    endif

    add(current_line, word)
    current_length = current_length + len(word) + 1  # for <space>
  endfor

  add(result, join(current_line))

  return result
enddef

def TimeLeft(timer_id: number = 0): number
  var timer_info_data = []
  if timer_id == 0
    timer_info_data = timer_info(pomodoro_timer)
  else
    timer_info_data = timer_info(timer_id)
  endif

  if len(timer_info_data) < 1
    return -1
  endif
  var time_left = timer_info_data[0]['remaining']
  return time_left / 1000
enddef

def PomodoroStatus(timer_id = pomodoro_timer)
  var time_left = TimeLeft(timer_id)
  if time_left == -1
    Tell(PrepareForTelling('No active Pomodoro'))
    return
  endif
  var time_left__message = "You have " .. time_left / 60 .. "m " .. time_left % 60 .. "s left"
  Tell(time_left__message)
enddef
command -nargs=0 PomodoroStatus call PomodoroStatus()

def PomodoroUpdateHUD(timer: number): void
  PomodoroStatus(timer)
enddef

def PomodoroFinish(timer: number): void
  popup_create("Done with Pomodoro", extend(pomodoro_popup_options, { move: 'any' }))
enddef

def Pomodoro(minutes_arg: string = '1')
  var minutes: number = str2nr(minutes_arg)
  pomodoro_timer = timer_start(minutes * 60000, 'PomodoroFinish')
  timer_start(3000, 'PomodoroUpdateHUD', { 'repeat': 60 * minutes })
  # PomodoroStatus()
enddef
command -nargs=? Pomodoro call Pomodoro(<f-args>)

defcompile
