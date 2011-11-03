require 'rubygems'

require 'ap' # Awesome Print
require 'net-http-spy' # Print information about any HTTP requests being made

require 'boson' # Load libraries from the Boson command framework
Boson.start :verbose => false

# ASCII table views
require 'hirb/import_object'
Hirb.enable
extend Hirb::Console

IRB.conf[:USE_READLINE] = true
IRB.conf[:AUTO_INDENT]  = false

# Save History between irb sessions
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# Enable colored output
require 'wirble'
Wirble.init
Wirble.colorize

# Bash-like tab completion
require 'bond'; Bond.start

module DynamicPrompt
  def self.apply!
    IRB.conf[:PROMPT][:INFORMATIVE] = {
      :PROMPT_I => ">>".tap {|s| def s.dup; gsub('>>', DynamicPrompt.normal); end },
      :PROMPT_S => "\e[0;35m%n\e[0m   ",
      :PROMPT_C => "\e[0;35m%n\e[0m>   ",
      :RETURN => "\e[1;35m=>\e[0m %.2048s\n"
    }
    IRB.conf[:PROMPT_MODE]  = :INFORMATIVE
  end

  def self.normal
    color1 = "\e[0;35m%n \e[35m[\e[1;35m"
    color2 = "\e[0;35m]::\e[1;34m"
    color3 = "\e[0;35m]\e[0m>"
    color1 + current_ruby + color2 + cwd + color3 
  end

private
  def self.current_ruby
    @@current_ruby ||= `rvm current`.strip
  end

  def self.cwd
    if Dir.pwd == '/'
      '/'
    elsif Dir.pwd == ENV['HOME']
      '~'
    else
      Dir.pwd.split('/').last
    end
  end

end

DynamicPrompt.apply!
