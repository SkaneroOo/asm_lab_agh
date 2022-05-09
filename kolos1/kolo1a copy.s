#################################################################
# Program ma zliczyc i wydrukowac w oknie terminala (funkcja printf):
#
# na maks. 7 punktow
#
# - sume wszystkich elementow tablicy
#
# kontynuacja - na maks. 10 punktow:
#
# - dodatkowo - liczbe elementow tablicy o wartosciach mniejszych od 0
#
# Zadanie ratunkowe - na maks. 4 punkty: wydrukowanie tekstu "Imie nazwisko nr_albumu",
# przy czym nr_albumu ma stanowic wartosc zmiennej
#
#################################################################

	.data

text_a:	.string "Suma = %d,  elementow <0 = %d\n"

tab:	.long 6, 4, -3, 3, -5, 9, 7, 1, -2, 8, -3, 5, 9, -1, 2
count:	.long 15

sum:	.long 0
negcnt:	.long 0

text_b:	.string "Krzysztof Majerczyk-Marchewka nr %d\n"
number: .long 410066

#################################################################

	.text
	.global	main

main:
	mov count,%r15		# kopiuję count do %r15 (będę tego używał jako indexu i iterował po liście od końca)
	mov sum,%rsi		# kopiuję sum do %rsi, czyli do rejestru odpowiedialnego za drugi argument printf
	mov negcnt,%rdx		# kopiuję negcnt do %rdi, czyli rejestru odpowiedzialnego za trzeci argument printf
		

petla:

# ponieważ iteruję od końca a zaczynam z 15, muszę to najpierw zmniejszyć o 1, więc sprawdzam, czy 
# poprzednia iteracja pętli już nie zmieniła licznika na zero
	cmp $0,%r15			
	jz koniec			# jeśli zmieniła, kończę pętlę
	dec %r15			# zmniejszam wartość licznika, biorę kolejne indexy od 14 do 0
	mov tab(,%r15,4),%r14		# przenoszę odpowiedni element z tablicy do %r14, czyli do "tymczasowej zmiennej"
	add %r14,%rsi		# dodaję wartość %r14 do sumy (którą w main przeniosłem do %rsi)
	cmp $0,%r14			# sprawdzam, czy liczba jest większa lub równa zero
	jge petla			# jeśli tak, wracam na początek pętli
	inc %rdx			# w przeciwnym wypadku zwiększam licznik liczb negatywnych
	jmp petla			# wracam na początek pętli


koniec:
	mov $text_a, %rdi		# przenoszę adres pierwszego stringa do %rdi, czyli pierwszego argumentu prntf
	xor %rax, %rax			# zeruję rejestr %rax (w sumie nie jestem pewny po co, ale bez tego nie działa)

	call printf				# wywołuję printf

#
# zadanie ratunkowe
#

	mov $text_b, %rdi		# przenoszę adres drugiego stringa do %rdi
	mov number,%rsi			# przenoszę numer albumu do %rsi
	xor %rax, %rax			# zeruję %rax

	call printf				# wywołuję printf

# koniec funkcji main

	xor	%eax,%eax			# ustawiam kod wyjścia programu na zero
	ret						# kończę działanie programu zwracając w funkcji main

#################################################################
