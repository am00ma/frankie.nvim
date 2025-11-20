.PHONY: test

test:
	nvim -l tests/minit.lua --minitest tests/frankie_spec.lua

