##lets play hangman
import random
from word import words
import string
def get_valid_word(words):
    word = random.choice(words) ##randomly chooses  from list, word is from the list of words
    while '-' in word or ' ' in word:
            word = random.choice(words)

    return word.upper()

def hangman():
        word = get_valid_word(words)
        word_letters = set(word) ##letters in the word
        alphabet = set(string.ascii_uppercase)
        used_letters = set() ##what has been guessed
        
        lives = 6 ##limits the number of guesses

        while len(word_letters) > 0 and lives > 0:  ##iteration loop to keep guessing letters
            print(f'you have {lives} lives left, you have used these letters: ', ''.join(used_letters))  ## .join(['a','b','c','d'])
            ##spell out current word (ie W_RD)
            word_list = [letter if letter in used_letters else '_' for letter in word]
            print('current word:    ', ' '.join(word_list)) 

            user_letter = input('guess a letter:    ').upper() ##getting input
            if user_letter in alphabet - used_letters: ##user letter not in used letters add to used letters list
                    used_letters.add(user_letter)
                    if user_letter in word_letters:  ##if user letter is in word then remove from word letter list
                            word_letters.remove(user_letter)

                    else:
                        lives = lives -1 ##loses a life if wrong
                        print('letter is not in word')

            elif user_letter in used_letters:
                print('you already guessed that, try again: ')
            else:
                print('invaid')
        ##here when len(word_leters) == 0 or lives == 0
        if lives == 0:
            print('you died, the word was:  ' , word)
        else:
            print('you won and guessed: ' , word)

hangman()
##user_input = input('type something: ')
##print(user_input)