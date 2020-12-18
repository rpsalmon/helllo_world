##inverse of randoms
##computer guess the number
import random
humnum = input('I will try and guess the number you choose. Enter a number:  ')
def computer_guess(x):
    low = 1
    high = x
    feedback = ''
    while feedback != 'c':
        if low != high:
            guess = random.randint(low, high)
        else:
            guess = low #or high because low=high here
        feedback = input(f'if {guess} is too high enter (H), low enter (L), or correct enter (C):   ').lower()
        if feedback == 'h':
            high = guess - 1
        elif feedback == 'l':
            low = guess + 1
        ##else:
            ##input(f'Your number must be {guess}, {feeback}')
        ##elif guess = humnum:
         ##feedback = input(f'your number must be {guess}, if {guess} is too high enter (H), low enter (L), or correct enter (C): ')
    print(f'the computer guessed {guess} correctly!!')
computer_guess(10)

##can you make this deliver a message when it has narrowed down the choice to a single value??
##humnum is not defined in the function