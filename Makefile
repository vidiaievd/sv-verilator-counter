include .env
export

OSS ?= $(OSS_CAD_SUITE)

build:
	$(OSS)/bin/verilator -Wall -f verilator.f --cc --build --timing --trace

run:
	./obj_dir/Vcounter

wave:
	$(OSS)/bin/gtkwave wave.vcd

clean:
	rm -rf obj_dir wave.vcd