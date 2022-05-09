#################################################################
#
# Na 10 punktow:
#
# program ma skopiowac ciag str1 do str2 zamieniajac male litery
# (zakres tablicy ASCII tylko od "a" do "z") na duze
# (zakres od "A" do "Z"). Pozostale znaki nie moga ulec zmianie.
#
# Nalezy wydrukowac ciagi str1 i str2 w oknie terminala.
#
# Na maks. 7 punktow: skopiowac ciag str1 do str2 (1 : 1).
#
# Procedura ma przetwarzac ciagi od pierwszego
# elementu, az do napotkania znaku NULL.
#
# Zadanie ratunkowe - na maks. 4 punkty: wydrukowanie ciagu str1 
# funkcjami printf i syscall nr 1.
#
#################################################################

.globl	main

.data

str1:		.asciz	"{a0b1c2i3j4k5x6y7z8}\n"
str2:		.asciz	"                    \n"

#################################################################

.text

main:

# Przykladowe kroki.

    mov $str2,%rdi
    mov $0,%r15

# Nadaj wartosci poczatkowe zmiennym (np. licznikowi iteracji/elementow).
# Zmienne mozna przechowywac gdziekolwiek (w rejestrach, w pamieci)


petla1:

# Usun bledy i odczytaj w prawidlowy sposob element ciagu.
    mov	str1(,%r15,1),%al
    cmp $0,%eax
    je koniec
# Sprawdz warunek zakonczenia petli - znaku konca ciagu

    cmp $'a',%al
    jl zapisz
    cmp $'z',%al
    jg zapisz
    sub $('a'-'A'), %al
# Sprawdz czy kod odczytanego znak miesci sie w odpowiednim zakresie,
# jesli tak - zmodyfikuj.

# zapisz znak do drugiego ciagu

zapisz:
    movb %al, (%rdi)
    inc %rdi
    inc %r15
    jmp petla1

# Zapisz znak w miejsce docelowe.


# Zaktualizuj licznik iteracji/elementow ciagu, zamknij petle.


koniec:

# Przekaz argumenty i wyswietl wynik

	mov $str2,%rdi
	xor %rax,%rax
	call printf

# Koniec funkcji main.

xor	%eax,%eax
ret

#################################################################

