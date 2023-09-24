#2869번 브론즈 1 :달팽이는 올라가고 싶다 
A, B, V = map(int, input().split())
# Ax - B(x-1) = V ; 도달 성공 -> x = (V - B) / (A - B)
x = (V - B) / (A - B)
if x == int(x):
    print(int(x)) # 올라가서 바로 도착
else:
    print(int(x) + 1) # 떨어졌다가 한 번 더 올라가는 경우
    
    
# 시도 1 ; 단순 식으로 구현
# A, B, V = map(int, input().split())

# curPos = 0
# days = 0
# while(True):
#     days += 1
#     curPos += A
#     if(V == curPos):
#         break
#     curPos -= B
  
# print(days)

# 시도 2 ; 수학적으로 접근했으나 잘못된 접근
# A, B, V = map(int, input().split())

# output = A - B
# print( (V - B) // output)
