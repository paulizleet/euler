
def main():
    primes = get_primes()
    print("got primes")
    for i, each in enumerate(primes):
        if each == False:
            continue

        try_families(i, primes)




def get_primes(starting=2):

    sieve = [True] * 10000000
    for i, each in enumerate(sieve):
        if each == False or i < 2:
            continue
        j=i+i
        while j < len(sieve):
            sieve[j] = False
            j = j + i


    return sieve

def try_families(num, primes):
    numstr = str(num)
    nums = list(numstr)
    for i in range(1, len(numstr) - 1):
        

main()
