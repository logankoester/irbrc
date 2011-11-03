# There are certain commands that my fingers have come to expect of any
# prompt. Let's make IRB a little more Bash-like.

module Bashlike
  # Clear the screen and return the current Rails environment (if present)
  def clear
    system 'clear'
    if ENV['RAILS_ENV']
      return "Rails environment: " + ENV['RAILS_ENV']
    else
      return "No rails environment"
    end
  end

  # Change the current working directory
  def cd(target = ENV['HOME'])
    Dir.chdir(target.strip)
    "Directory changed to #{Dir.pwd}"
  end

  # List directory contents (excluding hidden)
  def ls
    table Dir.entries( Dir.pwd ).reject { |f| f.match /^\..*$/ }
  end

  # Print working directory
  def pwd
    Dir.pwd
  end
end
