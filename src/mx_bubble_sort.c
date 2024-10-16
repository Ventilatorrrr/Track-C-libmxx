#include "../inc/libmx.h"

int mx_bubble_sort(char **arr, int size) 
{
    if (arr == NULL || size <= 0) 
    {
        return -1; 
    }

    int count = 0;
    for (int i = 0; i < size - 1; i++) 
    {
        for (int j = 0; j < size - i - 1; j++) 
        {
            if (mx_strcmp(arr[j], arr[j + 1]) > 0) 
            {
                count++;
                char *temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
    return count;
}
