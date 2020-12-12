class PigLatinizer

    def piglatinize(text)

        # define an array of vowels to check against
        array_of_vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]

        # split the words on a space char 
        array_of_words = text.split(" ")

        # build an array of final words
        array_of_final_words = [];

        # iterate over each word
        array_of_words.each do |word|

            # split the word so we can look at each char
            array_of_chars = word.split("")

            # create a bool to stop any further operations if needed
            finished_building_word = false

            # create an array of consonants for each word that will capture the first consonants and consonant pairs
            array_consonants_to_append = []

            # loop over each char to see if it is a vowel or a consonant
            array_of_chars.each_with_index do |char, index|

                if !finished_building_word

                    if index == 0
                        if array_of_vowels.include?(char)
                            # add way to it and return the word
                            new_word_with_way = word << "way"
                            array_of_final_words << new_word_with_way
                            finished_building_word = true
                        else
                            # add this to an array of chars to add to the end of the word when we're done iterating.
                            array_consonants_to_append << char
                        end
                    else
                        if !finished_building_word
                            # if this is a different index
                            if array_of_vowels.include?(char)
                               
                                # the first time this is hit, get all the letters from the word combine them, add the consonants and add ay to it.
                                word_with_consonants_removed = word[array_consonants_to_append.count..-1]
                                array_consonants_to_append.each do |consonant|
                                    word_with_consonants_removed << consonant
                                end

                                finaal_adjusted_word = word_with_consonants_removed + "ay"
                                array_of_final_words << finaal_adjusted_word
                                
                                # if we're at a vowel, then get the char from above and add it ot the end of the array and add "ay" to it.
                                finished_building_word = true
                            else
                                # keep adding consonants to the array 
                                array_consonants_to_append << char 
                            end
                        end
                    end
                end
            end
        end

        array_of_final_words.join(" ")
    end
end