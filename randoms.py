##random number generator
##import random paackage .randint 
#import random
import random
def guess(x):
    random_number = random.randint(1,x)
    guess = 0
    while guess != random_number:
        guess = int(input(f"guess a number between 1 and {x}: "))
        if guess < random_number:
            print('too cold')
        elif guess > random_number:
            print("too hot")
    print(f"you have guessed the number {random_number}")
guess(10)

##case statement for inputs
##