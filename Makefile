GPRBUILD ?= gprbuild
GPRBUILD_OPTS = -s -p -j0
Z3_TEST_OPTS = -fsanitize=address -static-libasan -fno-omit-frame-pointer

GCOVR_OPTS = \
	--exclude-unreachable-branches \
	--fail-under-line 100 \
	--sort-uncovered \
	--exclude 'obj/*' \
	--exclude 'contrib/*'

test: build obj/tests/tests
	@obj/tests/tests
	@gcovr . $(GCOVR_OPTS)

z3/z3/build/Makefile:
	CFLAGS="$(Z3_TEST_OPTS)" CXXFLAGS="$(Z3_TEST_OPTS)" cmake -S z3/z3 -B z3/z3/build

z3/z3/build/libz3.so: z3/z3/build/Makefile
	make -C z3/z3/build -j$(shell nproc)

build: z3/z3/build/libz3.so
	@$(GPRBUILD) $(GPRBUILD_OPTS) -P tests/tests

clean:
	gnatclean -P tests/tests.gpr
	rm -rf obj

clean_z3:
	rm -rf z3/z3/build z3/z3/src/util/z3_version.h
