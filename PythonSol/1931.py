#1931번 회의실 배정 list.sort + greedy
N = int(input())
timeList = [list(map(int, input().split())) for _ in range(N)]
timeList.sort(key=lambda k: (k[1], k[0]))

ans = 0
endtime = 0
for s, e in timeList:
    if endtime <= s:
        endtime = e
        ans += 1

print(ans)