.DEFAULT_GOAL := run

.PHONY: run get debug

run:
	dart run

debug:
	dart run --enable-asserts

get:
	dart pub get
