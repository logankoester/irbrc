# http://www.themomorohoax.com/2009/03/27/irb-tip-load-files-faster
module FastReload

  # Load a file and remember (for fast_reload)
  def fast_load(file_name = nil)
    # No file_name specified, display menu
    while file_name == nil
      if list_rb_files(Dir.pwd).size > 0
        file_name = display_menu
      else
        puts 'No file specified'
        exit
      end
    end

    file_name += '.rb' unless file_name =~ /\.rb/
    @@recent = file_name 
    load "#{file_name}"
  end
  
  # Reload the most recent file from fast_load 
  def fast_reload
    fl(@@recent)
  end

  # Reload the most recent file from fast_load and then repeat the last command
  def fast_retry
    rl
    eval(choose_last_command)
  end

private
  # prevent 'rt' itself from recursing. 
  def choose_last_command
    real_last = Readline::HISTORY.to_a[-2]
    real_last == 'rt' ? @@saved_last :  (@@saved_last = real_last)
  end

  def list_rb_files(dir)
    Dir.entries(Dir.pwd).select { |f| f.match /.*\.rb$/ }
  end

  def display_menu
    menu(list_rb_files(Dir.pwd), :prompt => 'Choose a file (or ^C): ', :directions => false).first
  end

end
