GPRBUILD ?= gprbuild
GPRBUILD_OPTS = -s -p -j0

GCOVR_OPTS = \
	--exclude-unreachable-branches \
	--fail-under-line 100 \
	--sort-uncovered \
	--exclude 'obj/*' \
	--exclude 'contrib/*'

test: build obj/tests/tests
	@obj/tests/tests
	@gcovr . $(GCOVR_OPTS)

z3/z3/build:
	@cd z3/z3 && python scripts/mk_make.py

z3/z3/build/libz3.so: z3/z3/build
	$(MAKE) -C z3/z3/build

build: z3/z3/build/libz3.so
	@$(GPRBUILD) $(GPRBUILD_OPTS) -P tests/tests

clean:
	gnatclean -P tests/tests.gpr
	rm -rf obj

clean_z3:
	rm -rf z3/z3/build z3/z3/src/util/z3_version.h
