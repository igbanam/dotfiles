vim9script

# Little Bible Plugin to play with vim9script
#
# I originally chose to play with a Stocks API, but it seemed that the size of
# the API returned broke Vim's `json_decode`. This API returned something small
# enough.

const API_URL = "https://bible-api.com/john+3:17"

def GetVerse()
  const the_command = ["curl", "--silent", API_URL]
  const its_options = {
    "out_cb": OnResponse,
    "err_cb": OnError,
    "exit_cb": OnDone
  }
  const job = job_start(the_command, its_options)
  echom "Getting verse..."
enddef

def OnError(channel: channel, message: string)
  echoe "ERROR: " .. message
enddef

def OnDone(job: job, status: number)
  echom partialResult
  const response = json_decode(partialResult)
enddef

def OnResponse(channel: channel, msg: string)
  const response = json_decode(msg)

  # Here we add everything we want to display to the user
  final entries: list<string> = [
    response["reference"] .. " (" .. response["translation_name"] .. ")",
    response["text"]
  ]

  if setqflist([], 'r', { 'lines': entries }) == -1
    echoe "Could not set quickfix list"
  else
    copen
  endif
enddef

command GetVerse :exec "call GetVerse()"
