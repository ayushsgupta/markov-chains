import random

num = int(input("Enter the number of people: "))
bound = int(input("Enter upper bound for the number to be guessed: "))

the_num = random.randint(1, bound)

names = dict(name=(-50))
this_name = ""
this_num = 0

for i in range(1, num + 1):
    this_name = raw_input("Enter a name for person %s: " % (i))
    this_num = int(input("Enter their guess: "))
    names[this_name] = this_num

dist = 500 * abs(bound - the_num)
closest = ["name"]

for a in names:
    if abs(names[a] - the_num) < dist:
        closest[0] = a
        dist = abs(names[a] - the_num)
    elif abs(names[a] - the_num) == dist:
        closest.append(a)

if len(closest) == 1:
    print "%s was the closest. They guessed %s, and the number was %s." % (closest[0], names[closest[0]], the_num)
elif len(closest) == 2:
    print "%s and %s were the closest. They guessed %s and %s respectively, and the number was %s." % (closest[0], closest[1],names[closest[0]], names[closest[1]], the_num)
