#1018번 체스판 다시 칠하기
# 혼자서 다시 풀기,,
# import sys
n, m = map(int, input().split())
graph = [list(input().strip()) for _ in range(n)]
cnt = 1e9 # 최댓값으로 설정

for i in range(n - 7):
  for j in range(m - 7):
    board = [row[j: j + 8] for row in graph[i: i + 8]]
    cntB, cntW = 0, 0
    for r in range(8):
      for c in range(8):
        if ((r + c) % 2 == 0):
          if board[r][c] == 'W':
              cntB += 1
          else:
              cntW += 1
        else:
          if board[r][c] == 'B':
              cntB += 1
          else:
              cntW += 1
    cnt = min(cnt, cntB, cntW)
print(cnt)