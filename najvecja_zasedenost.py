import csv
import random
import time
from math import log, log10 # lahko probamo menjat spodaj pri analiticnem izracunu

def argmin(seznam):   # na katerem mestu je najmanj zog
    _, i = min((x, i) for i, x in enumerate(seznam)) # bolj učinkovit način
    return i
    #n = len(seznam)
    #najmanjsi_element = min(seznam)
    #for i in range(n):
    #    if seznam[i] == najmanjsi_element:
    #        return i

# N ... št. košev
# n ... št. žog
# d ... med koliko koši izbiramo

def najvecje_stevilo_zog_v_kosu(N,n,d,stevilo_ponovitev):
    max_zasedenosti = []
    kosi = range(N)
    start = time.time() # zacetek merjenja casa
    for ponovitev in range(stevilo_ponovitev):
        zoge = [0] * N       # seznam, ki predstavlja kose
        for i in range(n):
            kateri = random.sample(kosi, d) # izberemo random d kosev
            koliko = [zoge[j] + (random.randint(0, 25) / 100) for j in kateri]  # pogledamo, koliko zog je v vsakem kosu  
            k = argmin(koliko)      # na katerem mestu je najmanj zog
            zoge[kateri[k]] += 1    # v pripadajoci kos vrzemo zogo
        max_zasedenosti.append(max(zoge))   # koliko zog je v najbolj zasedenem kosu
    end = time.time() # konec merjenja casa
    avg = sum(max_zasedenosti)/len(max_zasedenosti) # povprecna najvecja zasedenost
    if d == 1:
        analiticno = log(n)/log(log(n)) # kako izracunamo, ce je d = 1
    else:
        analiticno = log(log(n))/log(d) # kako izracunamo, ce je d >= 2
    return avg, analiticno, end-start

"""
print(najvecje_stevilo_zog_v_kosu(1000,1000,1,100))
print(najvecje_stevilo_zog_v_kosu(1000,1000,2,100))
"""

def izvedi_funkcijo(Poskusi, N, n, d, stevilo_ponovitev):
    # Poskusi je kolikokrat ponovimo funkcijo
    print("izvedi_funkcijo(%d, %d, %d, %d, %d)" % (Poskusi, N, n, d, stevilo_ponovitev))
    ime_datoteke = "najvecja_zasedenost_%d_%d_%d.csv" % (N, n, d)
    with open(ime_datoteke, "w") as f: # w --> Za na novo write, "a" --> za append
        wr = csv.writer(f)
        wr.writerow(["avg", "analiticno", "cas"])
        # Ce je Poskusi == 0 izvajamo do prekinitve, sicer omejeno
        i = 0
        if Poskusi == 0:
            Poskusi = -1
        while i != Poskusi:
            avg, analiticno, cas = najvecje_stevilo_zog_v_kosu(N, n, d, stevilo_ponovitev)
            avg = round(avg, 4)
            analiticno = round(analiticno, 4)
            wr.writerow([avg, analiticno, cas])
            f.flush() # vrstica naj se zapiše takoj
            i += 1

"""
izvedi_funkcijo(1000, 1000, 1000, 1, 1000)
izvedi_funkcijo(1000, 10000, 10000, 1, 1000)
izvedi_funkcijo(1000, 100000, 100000, 1, 1000)
izvedi_funkcijo(1000, 1000000, 1000000, 1, 1000)

izvedi_funkcijo(1000, 10000, 10000, 2, 1000)
izvedi_funkcijo(1000, 10000, 10000, 3, 1000)
izvedi_funkcijo(1000, 10000, 10000, 4, 1000)
izvedi_funkcijo(1000, 10000, 10000, 5, 1000)
izvedi_funkcijo(1000, 10000, 10000, 10, 1000)
"""
izvedi_funkcijo(900, 10000, 10000, 2, 100)       # 5,5 sekund
izvedi_funkcijo(700, 10000, 10000, 3, 100)       # 7 sekund 
izvedi_funkcijo(600, 10000, 10000, 4, 100)       # 8,5 sekund
izvedi_funkcijo(500, 10000, 10000, 5, 100)       # 10 sekund
izvedi_funkcijo(500, 10000, 10000, 10, 50)       # 9 sekund
