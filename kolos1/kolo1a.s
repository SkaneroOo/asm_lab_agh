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
		
	mov count,%r15
	mov sum,%rsi
	mov negcnt,%rdx
# nadaj wartosci poczatkowe sumie i licznikom
# dane mozna przechowywac gdziekolwiek (w rejestrach, w pamieci)

petla:

# usun bledy i odczytaj w prawidlowy sposob element tablicy
	cmp $0,%r15
	jz koniec
	dec %r15
	mov	tab(,%r15,4), %r14
	add %r14,%rsi
	cmp $0,%r14
	jge petla
	inc %rdx
	jmp petla

# zaktualizuj sumę
# sprawdz czy wartosc jest ujemna
# zaktualizuj liczniki
# zamknij petle

koniec:

# przekaz argumenty 
# wyswietl wyniki (printf)

	mov $text_a, %rdi
	xor %rax,%rax

	call	printf

# koniec funkcji main

	mov $text_b,%rdi
	mov number,%rsi
	xor %rax,%rax
	call printf

	xor	%eax,%eax
	ret

#################################################################
