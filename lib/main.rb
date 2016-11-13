require_relative './converter.rb'

def readArgv(argv_text_file)
  text = []
  File.read(argv_text_file).each_line do |line|
    text << line.chop
  end
  return text
end

def giveInputToConverter(input, converter = Converter)
  converter.new(input)
end

if $0 == __FILE__
  input = readArgv(ARGV[0])
  p giveInputToConverter(input)
end
