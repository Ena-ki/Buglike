extends Node


func log(message : String):
  var stack = get_stack()
  var top_stack = stack[stack.size()-1]
  print_rich("[color=gray] Log : ", top_stack.source, top_stack.line, " — ", message, "[/color]")


func log_warning(message : String):
  var stack = get_stack()
  var top_stack = stack[stack.size()-1]
  print_rich("[color=orange] Warning : ", top_stack.source, top_stack.line, " — ", message, "[/color]")


func log_error(message : String):
  var stack = get_stack()
  var top_stack = stack[stack.size()-1]
  print_rich("[color=red] Error : ", top_stack.source, top_stack.line, " — ", message, "[/color]")
