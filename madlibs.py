##madlibs 

##create a program that fills in user chosen values into a predetermined structure
##introduction
##print(f"sentenece examlpe {example}")
##print("sample sentecece {}".format(example))

print("hello_wrld")
u_name = input("what is your name?  ")
print("hello " + u_name)
print("would you like to play a game?")
irrel = input()
print("sounds great! lol, you though you had a choice!?")

print("so, you have one job. give me words give me an adj, 2 verbs and a name.")
adj = input("give me an adjective__    ")
verb= input("give me a verb__    ")
verb2 = input("give me another verb__    ")
funame = input("give me a famous name:__    ")

madlib = f"hello, comp programming is {adj}! learning new things is excited and it makes me want to {verb}\
stay hydrated and {verb2} and feel like {funame}"

print(madlib)

## run it by >py madlibs.py
