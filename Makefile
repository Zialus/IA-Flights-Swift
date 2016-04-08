all:
	swift build
	mv ./.build/debug/Flights .

clean:
	if [ -f ./Flights ]; then rm ./Flights; fi
	if [ -d ./.build/ ]; then rm -rf ./.build/; fi
