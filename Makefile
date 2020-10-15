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

build:
	@$(GPRBUILD) $(GPRBUILD_OPTS) -P tests/tests

clean:
	gnatclean -P tests/tests.gpr
	rm -rf obj
