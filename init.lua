--- default initializer
-- @author Alejandro Baez <alejan.baez@gmail.com>
-- @copyright 2015
-- @license GPL-2.0 (see LICENSE)
-- @module init


local patch = _USERHOME .. "/modules/linux/checkpatch.pl --no-tree -f "
textadept.run.compile_commands.linux = patch .. '%f'

events.connect(events.LEXER_LOADED, function (lang)
  if lang ~= 'linux' then return end
  buffer.tab_width = 8
  buffer.use_tabs = true
  buffer.edge_column = 79
  buffer.edge_mode = buffer.EDGE_BACKGROUND
  buffer.edge_colour = 0x0000ff
  buffer.indentation_guides = buffer.IV_LOOKBOTH
end)

function path()
  return (buffer.filename or ''):match('^.+[//]') .. "Makefile"
end

events.connect(events.FILE_BEFORE_SAVE, function()
  if buffer:get_lexer() ~= 'linux' then return end
  buffer:annotation_clear_all()

  if not io.open(path()) then
    io.open(path(), "w"):write(" \
KERNEL=/lib/modules/$(shell uname -r)/build\n \
obj-m += " .. ((buffer.filename or ''):match('[^//]+$')):match('[%w_]+') ..
".o\n \
all:\n\tmake -C $(KERNEL) M=$(PWD) modules\n \
clean:\n\tmake -C $(KERNEL) M=$(PWD) clean\n \
")
  end
end)

if type(snippets) == 'table' then
  snippets.linux = require("modules.linux.snippets")
end

return {}
