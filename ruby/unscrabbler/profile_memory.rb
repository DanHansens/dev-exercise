require_relative 'word_finder'
require 'memory_profiler'

def test_memory_usage
  word_finder = WordFinder.new
  report = MemoryProfiler.report(allow_files: './word_finder.rb') do
    word_finder.find('abecedar')
  end

  report.pretty_print
end

test_memory_usage
