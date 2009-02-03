# Make gems available
require 'rubygems'

# http://drnicutilities.rubyforge.org/map_by_method/
require 'map_by_method'

# Dr Nic's gem inspired by
# http://redhanded.hobix.com/inspect/stickItInYourIrbrcMethodfinder.html
require 'what_methods'

# Pretty Print method
require 'pp'

# Load the readline module.
IRB.conf[:USE_READLINE] = true

# Remove the annoying irb(main):001:0 and replace with >>
IRB.conf[:PROMPT_MODE]  = :SIMPLE

# Tab Completion
require 'irb/completion'

# Automatic Indentation
IRB.conf[:AUTO_INDENT]=true

# Save History between irb sessions
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# Wirble is a set of enhancements for irb
# http://pablotron.org/software/wirble/README
# Implies require 'pp', 'irb/completion', and 'rubygems'
require 'wirble'
Wirble.init

# Enable colored output
Wirble.colorize

# Clear the screen
def clear
	system 'clear'
	if ENV['RAILS_ENV']
		return "Rails environment: " + ENV['RAILS_ENV']
	else
		return "No rails environment - happy hacking!";
	end
end

# Shortcuts
alias c clear
