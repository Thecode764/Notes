#!/usr/bin/ruby -w

puts "Welcome to notes app"
puts "1. View my notes\n2. Write a note\n3. Create original file for notes"
puts "> "

command = gets.strip.downcase

case command
when "1"
  filename = 'notes.txt'
  
  if File.zero?(filename)
    puts "Notes are empty"
  else
    File.open(filename) do |file|
      file.each_line do |line|
        puts line.chomp
      end
    end
  end
when "2"
  puts "Enter your note name:"
  note_name = gets.strip
  puts "Enter your note text:"
  note_text = gets.strip
  File.open("notes.txt", "a") do |file|
    file.puts "\nNote name: #{note_name}\nNote content: #{note_text}\n"
  end
  puts "Note saved successfully."
when "3"
  File.write('notes.txt', '')
  puts "Original file created for notes."
else
  puts "Invalid command. Please try again."
end
