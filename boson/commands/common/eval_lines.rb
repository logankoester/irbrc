module EvalLines
  # Run a few specific lines from a file
  def eval_lines(filename, lines)
    eval( File.readlines(filename)[lines].join)
  end
end
