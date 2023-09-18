# 10814번 실버5 나이순 정렬
n = int(input())
personList = []
for i in range(n):
    numList = list(map(str, input().split()))
    numList[0] = int(numList[0])
    personList.append(numList)

personList.sort(key= lambda x:x[0])

for i in range(n):
    print(personList[i][0], personList[i][1])
