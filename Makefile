all:
	swift build -Xswiftc -O
	mv ./.build/debug/Flights .

clean:
	if [ -f ./Flights ]; then rm ./Flights; fi
	if [ -d ./.build/ ]; then rm -rf ./.build/; fi

test: test1 test2 test3

test1:
	echo "\n\n\n\n"
	./Flights rotas.txt fulldebug < Inputs/1.txt
test2:
	echo "\n\n\n\n"
	./Flights rotas.txt fulldebug < Inputs/2.txt
test3:
	echo "\n\n\n\n"
	./Flights rotas.txt fulldebug < Inputs/3.txt
