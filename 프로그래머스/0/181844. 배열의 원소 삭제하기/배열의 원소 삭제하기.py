def solution(arr, delete_list):
    return list(filter(lambda x: x not in delete_list, arr))