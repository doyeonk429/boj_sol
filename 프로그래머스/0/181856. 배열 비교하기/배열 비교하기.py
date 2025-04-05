def solution(arr1, arr2):
    n1 = len(arr1)
    n2 = len(arr2)
    sum1 = sum(arr1)
    sum2 = sum(arr2)
    
    if n1 > n2 :
        return 1
    elif n1 < n2 :
        return -1
    else :
        if sum1 > sum2 :
            return 1
        elif sum1 < sum2 :
            return -1
        else :
            return 0