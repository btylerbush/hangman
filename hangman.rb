#!/usr/bin/ruby

def no_mistake
 puts %q(
 |------|
 |      |
 |      
 |
 |
 |----------
 )
end

mistakes = [
"|------|
|      |
|      O
|
|
|----------",
"|------|
|      |
|      O
|      |
|
|----------","|------|
|      |
|      O
|     /|
|
|----------","|------|
|      |
|      O
|     /|\
|
|
|----------","|------|
|      |
|      O
|     /|\
|      /
|----------","|------|
|      |
|      O
|     /|\
|      /\
|----------"
]
	

# def mistake1
# 	puts %q(
# 	|------|
# 	|      |
# 	|      O
# 	|
# 	|
# 	|----------
# 	)
# end

# def mistake2
# 	puts %q(
# 	|------|
# 	|      |
# 	|      O
# 	|      |
# 	|
# 	|----------
# 	)
# end

# def mistake3
# 	puts %q(
# 	|------|
# 	|      |
# 	|      O
# 	|     /|
# 	|
# 	|----------
# 	)
# end

# def mistake4
# 	puts %q(
# 	|------|
# 	|      |
# 	|      O
# 	|     /|\
# 	|
# 	|----------
# 	)
# end

# def mistake5
# 	puts %q(
# 	|------|
# 	|      |
# 	|      O
# 	|     /|\
# 	|      /
# 	|----------
# 	)
# end

# def mistake6
# 	puts %q(
# 	|------|
# 	|      |
# 	|      O
# 	|     /|\
# 	|      /\
# 	|----------
# 	)
# end

def list
   words = %w{ backpack lamp couch television stairs shoes robot pillow vent remote }
   x = words[rand(words.length)]
   return x
end

def print_word_results(word_results)
	word_results.each do |letter|
		print letter + " "
	end
	print "\n"
end

def print_guessed_letters(guesses)
	print "Already guessed letters: "
	guesses.sort.each do |letter|
		print letter + " "
	end
	print "\n"
end

# Check to see if the letter guessed has already been guessed
def used_letter(letter,guesses)
	guesses.each do |x|
		return true if x == letter
	end
	return false
end

def location_of_letter_in_word(letter,word)
	x = 0
	locations = [ ]
	word.length.times do 
		if word[x] == letter
			locations << x
		end
		x += 1
	end
	return locations
end

tries = 6
guesses = [ ]
lines = [ ]
word = list
x = -1
# Populate lines array with initial blanks
word.length.times do
	lines << "_"
end

puts "Hangman\n"
puts no_mistake
print_word_results(lines)

while tries > 0 
	# Simulate gets of a letter
	puts "\nWhat letter do you want to guess?"

	letter = gets.chomp

	if used_letter(letter,guesses)
		puts "Letter #{letter} already used"
	else 
		guesses << letter
		locations = location_of_letter_in_word(letter,word)
		if locations.empty? 
			tries -= 1
			puts "The letter #{letter} isn't in this word, sorry."
			x += 1
			puts mistakes[x]
		else
			locations.each do |position|
				lines[position] = letter
			end
		end
		print_word_results(lines)
		print_guessed_letters(guesses)
		puts "Tries left: #{tries}"
	end

	if word == print_word_results(lines)
		puts "You survived!"
	end
end	