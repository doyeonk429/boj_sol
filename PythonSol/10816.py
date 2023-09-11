N = input()
numList = list(map(int, input().split()))
M = input()
checkList = list(map(int, input().split()))

hashmap = {}

for n in numList:
    if n in hashmap:
        hashmap[n] += 1
    else:
        hashmap[n] = 1
        
for m in checkList:
    if(m in hashmap):
        print(hashmap[m], end=" ")
    else:
        print('0', end=" ")