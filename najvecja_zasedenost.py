import random 
from math import log, log10 # lahko probamo menjat spodaj pri analiticnem izracunu

def argmin(seznam):   # na katerem mestu je najmanj zog
    n = len(seznam)
    najmanjsi_element = min(seznam)
    for i in range(n):
        if seznam[i] == najmanjsi_element:
            return i

def najvecje_stevilo_zog_v_kosu(N,n,d,stevilo_ponovitev):
    max_zasedenosti = []
    kosi = kosi = [i for i in range(N)]
    for ponovitev in range(stevilo_ponovitev):
        zoge = [0 for i in range(N)]        # seznam, ki predstavlja kose
        for i in range(n):
            kateri = random.sample(kosi, d) # izberemo random d kosev
            koliko = [zoge[j] + (random.randint(0, 25) / 100) for j in kateri]  # pogledamo, koliko zog je v vsakem kosu  
            k = argmin(koliko)      # na katerem mestu je najmanj zog
            zoge[kateri[k]] += 1    # v pripadajoci kos vrzemo zogo
        max_zasedenosti.append(max(zoge))   # koliko zog je v najbolj zasedenem kosu
    avg = sum(max_zasedenosti)/len(max_zasedenosti) # povprecna najvecja zasedenost
    if d == 1:
        analiticno = log(n)/log(log(n)) # kako izracunamo ce je d = 1
    else:
        analiticno = log(log(n))/log(d) # kako izracunamo ce je d >= 2
    return avg, analiticno


print(najvecje_stevilo_zog_v_kosu(1000,1000,1,100))
print(najvecje_stevilo_zog_v_kosu(1000,1000,2,100))
print(najvecje_stevilo_zog_v_kosu(1000,1000,3,100))
print(najvecje_stevilo_zog_v_kosu(1000,1000,4,100))

