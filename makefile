CC65 = /home/mpizzzle/.local/bin/cc65 #../bin/cc65
CA65 = /home/mpizzzle/.local/bin/ca65 #../bin/ca65
LD65 = /home/mpizzzle/.local/bin/ld65 #../bin/ld65
NAME = hello

$(NAME).nes: $(NAME).o reset.o nes.cfg
	$(LD65) -C nes.cfg -o $(NAME).nes reset.o $(NAME).o nes.lib
	rm *.o
	@echo $(NAME).nes created

reset.o: reset.s
	$(CA65) reset.s

$(NAME).o: $(NAME).s
	$(CA65) $(NAME).s

$(NAME).s: $(NAME).c
	$(CC65) -Oi $(NAME).c --add-source

clean:
	rm $(NAME).nes
