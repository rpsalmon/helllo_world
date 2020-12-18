##rock paper scissors // how does is_win relationship work?
import random

def play():
        user = input("'r' for rock, 'p' for paper, 's' for scissors:\n")
        computer = random.choice(['r','p','s']) ##random.choice chooses from a list

        if user == computer:
            return 'tie'
        if is_win(user, computer):
            'you won!'
        return 'you lost!'
## r>s, s>p, p>r
def is_win(player, opponent):##true if player wins
    if(player == 'r' and opponent == 's') or (player == 's' and opponent == 'p') or (player == 'p' and opponent == 'r'):
        return True
    print(opponent) ##no cheating
print(play())
