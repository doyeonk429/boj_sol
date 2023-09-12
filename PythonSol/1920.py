#1920 수 찾기 - 기본 구현 : 시간초과
# N = input()
# numList = list(map(int, input().split()))
# M = input()
# checkList = list(map(int, input().split()))

# for n in checkList:
#     if(n in numList):
#         print(1)
#     else:
#         print(0)
        
#1920 수 찾기 - 이분탐색 이용 + sort를 전체에서 한번만 실행
N = input()
numList = list(map(int, input().split()))
numList.sort()
M = input()
checkList = list(map(int, input().split()))

def binSearch(target, dataList):
    startIdx = 0 
    endIdx = len(dataList) - 1

    while startIdx <= endIdx:
        midIdx = (startIdx + endIdx) // 2 # 중간값

        if dataList[midIdx] == target:
            return 1 		# target 위치 반환

        elif dataList[midIdx] > target: # target이 작으면 왼쪽을 더 탐색
            endIdx = midIdx - 1
        else:                    # target이 크면 오른쪽을 더 탐색
            startIdx = midIdx + 1
    return 0

for n in checkList:
    print(binSearch(n, numList))