def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        # 标记是否发生了交换
        swapped = False
        for j in range(0, n-i-1):
            # 如果当前元素大于下一个元素，则交换它们
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]
                swapped = True
        # 如果没有发生交换，说明列表已经有序，提前退出
        if not swapped:
            break
    return arr

# 示例用法
if __name__ == "__main__":
    arr = [64, 34, 25, 12, 22, 11, 90]
    print("排序前的数组:", arr)
    sorted_arr = bubble_sort(arr)
    print("排序后的数组:", sorted_arr)

