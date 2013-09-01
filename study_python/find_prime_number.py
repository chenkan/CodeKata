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
    # range starts with 3 and only needs to go up the squareroot of
    # n
    # for all odd numbers
    for x in range(3, int(n**0.5)+1, 2):
        if n % x == 0:
            return False
    return True

def search_prime(num):
    start_num = 1
    while True:
        start_num = start_num + 1
        print start_num
        if is_prime(start_num):
            print is_prime(start_num)
            num = num - 1
        if num == 0:
            return start_num

if __name__ == '__main__':
    print search_prime(int(raw_input()))
