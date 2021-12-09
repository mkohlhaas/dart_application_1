.DEFAULT_GOAL := run

.PHONY: run get debug late tw async1 async2 async3 hj

run:
	dart run

debug:
	dart run --enable-asserts

get:
	dart pub get

late:
	dart run bin/late.dart

tw:
	dart run bin/text_widget.dart

async1:
	dart run bin/asynchronous_1.dart

async2:
	dart run bin/asynchronous_2.dart

async3:
	dart run bin/asynchronous_3.dart


hj:
	dart run bin/http_json.dart
