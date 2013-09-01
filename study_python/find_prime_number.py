# coding=utf-8
__author__ = 'ChenKan'

import datetime

def is_prime(n):
    # 0 and 1 are not primes
    if n < 2:
        return False
    # 2 is the only even prime number
    if n == 2:
        return True
    # all other even numbers are not primes
    if not n & 1:
        return False
    # range starts with 3 and only needs to go up the SQUAREROOT of n
    # for all ODD numbers
    for x in range(3, int(n**0.5) + 1, 2):
        if n % x == 0:
            return False
    return True

# search the nth prime number
def search_prime(nth):
    begin_time = datetime.datetime.now()
    checked_num = 1
    while True:
        checked_num = checked_num + 1
        check_result = is_prime(checked_num)
        print str(checked_num) + " : " + str(check_result)
        if check_result:
            nth = nth - 1
        if nth == 0:
            break
    print datetime.datetime.now() - begin_time
    return checked_num

if __name__ == '__main__':
    print search_prime(int(raw_input("搜索第N个质数\n")))
