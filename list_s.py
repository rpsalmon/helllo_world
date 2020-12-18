##lists begin and end with brackets and are comma delimmited = 
##index  begin and end with brackets and use number to assign value
animal_list=['cat','dog','rat','bat']
print(animal_list) ##we can look at sublists [x][x_sub] index gives one item, index is sepearated with a :
                        ##lists begin at position 0
animal_list[1]='mouse' ##will replace dog with mouse this can also be done with a slice leaving out 0 is the beginning and leaving out end of list defaults to end
##del animal_list[2]
##animal_list[2]=['hat','mat','sat']
print(animal_list)

for i in range(len(animal_list)):
    print('index ' + str(i) + ' in animal list is: ' + animal_list[i])

## variable = list(range(start, stop, step))
## multiple assignments generally used for swaps and database assignments
size, color, disposition = 'skinny','black','quiet'
size,color = color,size
print(size,color,disposition)
##ther eis also augmented assignments


##methods function but attached or called on a value
ani_pos = animal_list.index('bat') ##index is specific str value will return first appearance of dupes
print('this is the '+ str(ani_pos)+'th of '+ animal_list[ani_pos] +' in the list')
animal_list.append('chick') ##only works on lists, remove will remove a specified str from list
##different from the delete in that it is a specific value regardless of position - like index on the first appearance of dupe is removed
animal_list.sort(key=str.lower) ##limited to consistent values, either all strings alphabetically (ascii, all upper before lower case) or all intergers increasing
print(animal_list) 
