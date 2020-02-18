class PigLatinController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	VOWELS = %w[a e i o u y A E I O U Y].freeze
	PUNCTATION = %w[. ? !].freeze
	ALPHA = [*'a'..'z',*'A'..'Z'].freeze
	CONSONANTS = (ALPHA - VOWELS).freeze
	PL_VOWEL = "way".freeze
	PL_CONSONANT = "ay".freeze

  def index
  end

  def translate
  	words = translation_params[:words].split(" ")

  	words.map! do |word| 
  		word = pig_latinize(word)
  	end

  	render json: {
      translated: words.join(" ")
    }
  end

  private

  def pig_latinize(word)
  	word_index = 0
  	all_upper_case = false

  	if word.match(/\p{Lower}/).nil?
  		all_upper_case = true
  	end

		word.split("").each do |c|

			if not PUNCTATION.include?(word[c])
				word_index += 1
			end

		end
		if VOWELS.include?(word[0])
			word = word[0..word_index-1] << PL_VOWEL << word[word_index..-1]
  	else
  		uppercase = false

  		if word[0] =~ /[A-Z]/
  			uppercase = true
  			word = word[0].downcase << word[1..-1]
  		end

  		if (word[0] == 'q' || word[0] == 'Q') && (word[1] == 'u' || word[1] == 'U')
  			word = word[2..word_index-1] << word[0..1] << PL_CONSONANT << word[word_index..-1]
  		else
  			index = 1

	  		while CONSONANTS.include?(word[index])
	  			index += 1
	  		end
	  		word = word[index..word_index-1] << word[0..index-1] << PL_CONSONANT << word[word_index..-1]
  		end

  		if all_upper_case
  			word.upcase!
  		elsif uppercase 
  			word = word[0].upcase << word[1..-1]
  		end

  	end

  	return word
  end

  def translation_params
    params.permit(:words)
  end
end
