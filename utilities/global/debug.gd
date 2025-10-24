extends Node


func log(...args):
  var message = ""
  for i in args:
    message += str(i)
  var stack = get_stack()
  var top_stack = stack[stack.size()-1]
  print_rich("[color=gray] Log : ", top_stack.source, top_stack.line, " — ", message, "[/color]")


func warning(...args):
  var message = ""
  for i in args:
    message += str(i)
  var stack = get_stack()
  var top_stack = stack[stack.size()-1]
  print_rich("[color=orange] Warning : ", top_stack.source, top_stack.line, " — ", message, "[/color]")


func error(...args):
  var message = ""
  for i in args:
    message += str(i)
  var stack = get_stack()
  var top_stack = stack[stack.size()-1]
  print_rich("[color=red] Error : ", top_stack.source, top_stack.line, " — ", message, "[/color]")
