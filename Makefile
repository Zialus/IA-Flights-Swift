all:
	swift build -Xswiftc -O
	mv ./.build/debug/Flights .

clean:
	if [ -f ./Flights ]; then rm ./Flights; fi
	if [ -d ./.build/ ]; then rm -rf ./.build/; fi

test:
	./Flights rotas.txt < Inputs/2.txt