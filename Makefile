include .env
export

TOP = counter
SV = counter.sv
CPP = sim_main.cpp
OSS ?= $(OSS_CAD_SUITE)

build:
	$(OSS)/bin/verilator -Wall --cc $(SV) --exe $(CPP) --build --timing --trace

run: build
	./obj_dir/V$(TOP)

wave:
	$(OSS)/bin/gtkwave wave.vcd

clean:
	rm -rf obj_dir wave.vcd