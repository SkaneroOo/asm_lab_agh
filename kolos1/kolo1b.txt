#################################################################
# Program ma wyznaczyc i wydrukowac w oknie terminala (funkcja printf):
#
# na maks. 7 punktow
#
# - maksymalna wartosc wszystkich elementow tablicy oraz liczbe wartosci nieparzystych
#
# kontynuacja - na maks. 10 punktow:
#
# - dodatkowo - minimalna wartosc elementow tablicy
#
# Zadanie ratunkowe - na maks. 4 punkty: wydrukowanie tekstu "Imie nazwisko nr_albumu",
# przy czym nr_albumu ma stanowic wartosc zmiennej
#
#################################################################

		.data

text_a:	.string "Max = %d, odd = %d, min = %d\n"

tab:	.long 6, 1, 0, 2, 5, 9, 7, 1, 2, 8, 3, 5, 9, 1, 2
count:	.long 15

maxv:	.long 0
minv:	.long 999
oddcnt: .long 0

text_b:	.string "Imie nazwisko nr %d\n"
number: .long 12345

#################################################################

		.text
		.global	main

main:
	
	mov count,%r15
	mov maxv,%r14
	mov minv,%r13
	mov oddcnt,%r12
# nadaj wartosci poczatkowe licznikom i wartosciom max, min
# dane mozna przechowywac gdziekolwiek (w rejestrach, w pamieci)

petla:

# usun bledy i odczytaj w prawidlowy sposob element tablicy

	cmp $0,%r15
	je koniec
	dec %r15
	mov	tab(,%r15,4), %r11
	cmp %r14,%r11
	jg wieksza
	cmp %r13,%r11
	jl mniejsza
	jmp mod2

wieksza:
	mov %r11,%r14
	jmp mod2

mniejsza:
	mov %r11,%r13
	jmp mod2

mod2:
	mov $0,%rdx
	mov %r11,%rax
	mov $2,%r11
	div %r11
	add %rdx,%r12
	jmp petla


# sprawdz czy wartosc jest wieksza od aktualnego maksimum
# tak - zaktualizuj maksimum
# sprawdz czy wartosc jest nieparzysta
# tak - zaktualizuj licznik nieparzystych
# sprawdz czy wartosc jest mniejsza od aktualnego minimum
# tak - zaktualizuj minimum

# zamknij petle

koniec:

# przekaz argumenty 
# wyswietl wyniki (printf)

	mov $text_a,%rdi
	mov %r14,%rsi
	mov %r12,%rdx
	mov %r13,%r10
	xor %rax,%rax
	call printf

# koniec funkcji main

	mov $text_b,%rdi
	mov number,%rsi
	xor %rax,%rax
	call printf

	xor	%eax,%eax
	ret

#################################################################
