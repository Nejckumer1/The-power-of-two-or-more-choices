import random 
from math import log, log10 # lahko probamo menjat spodaj pri analiticnem izracunu

def argmin(seznam):   # na katerem mestu je najmanj zog
    n = len(seznam)
    najmanjsi_element = min(seznam)
    for i in range(n):
        if seznam[i] == najmanjsi_element:
            return i

# N ... št. košev
# n ... št. žog
# d ... med koliko koši izbiramo

def najvecje_stevilo_zog_v_kosu(N,n,d,stevilo_ponovitev):
    max_zasedenosti = []
    kosi = kosi = [i for i in range(N)]
    for ponovitev in range(stevilo_ponovitev):
        zoge = [0 for i in range(n)]        # seznam, ki predstavlja kose
        for i in range(n):
            kateri = random.sample(kosi, d) # izberemo random d kosev
            koliko = [zoge[j] + (random.randint(0, 25) / 100) for j in kateri]  # pogledamo, koliko zog je v vsakem kosu  
            k = argmin(koliko)      # na katerem mestu je najmanj zog
            zoge[kateri[k]] += 1    # v pripadajoci kos vrzemo zogo
        max_zasedenosti.append(max(zoge))   # koliko zog je v najbolj zasedenem kosu
    avg = sum(max_zasedenosti)/len(max_zasedenosti) # povprecna najvecja zasedenost
    if d == 1:
        analiticno = log(n)/log(log(n)) # kako izracunamo, ce je d = 1
    else:
        analiticno = log(log(n))/log(d) # kako izracunamo, ce je d >= 2
    return avg, analiticno

"""
print(najvecje_stevilo_zog_v_kosu(1000,1000,1,100))
print(najvecje_stevilo_zog_v_kosu(1000,1000,2,100))
"""

def izvedi_funkcijo(Poskusi, N, n, d, stevilo_ponovitev):
    # Poskusi je kolikokrat ponovimo funkcijo
    ime_datoteke = "najvecja_zasedenost_" + str(N) + "_" + str(n) + "_" + str(d) + ".csv"
    f = open(ime_datoteke, "w") # w --> Za na novo write, "a" --> za append
    f.write("avg,analiticno  \n")
    # Ce je Poskusi == 0 izvajamo do prekinitve, sicer omejeno
    if Poskusi == 0:
        while True:
            avg, analiticno = najvecje_stevilo_zog_v_kosu(N, n, d, stevilo_ponovitev)
            avg = round(avg, 4)
            analiticno = round(analiticno, 4)
            f.write(str(avg) + ","+ str(analiticno) + "\n")
    else:
        for poskus in range(Poskusi):
            avg, analiticno = najvecje_stevilo_zog_v_kosu(N, n, d, stevilo_ponovitev)
            avg = round(avg, 4)
            analiticno = round(analiticno, 4)
            f.write(str(avg) + "," + str(analiticno) + "\n")
    f.close()


izvedi_funkcijo(1000, 1000, 1000, 1, 1000)
izvedi_funkcijo(1000, 10000, 10000, 1, 1000)
izvedi_funkcijo(1000, 100000, 100000, 1, 1000)
izvedi_funkcijo(1000, 1000000, 1000000, 1, 1000)

izvedi_funkcijo(1000, 10000, 10000, 2, 1000)
izvedi_funkcijo(1000, 10000, 10000, 3, 1000)
izvedi_funkcijo(1000, 10000, 10000, 4, 1000)
izvedi_funkcijo(1000, 10000, 10000, 5, 1000)
izvedi_funkcijo(1000, 10000, 10000, 10, 1000)
