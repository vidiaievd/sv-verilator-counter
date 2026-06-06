#include "verilated.h"
#include "Vcounter.h"
#include "verilated_vcd_c.h"
#include <iostream>

vluint64_t main_time = 0;

int main(int argc, char **argv)
{
    Verilated::commandArgs(argc, argv);

    Vcounter* top = new Vcounter;

    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;

    top->trace(tfp, 99);
    tfp->open("wave.vcd");

    top->clk = 0;
    top->rst = 1;
    top->enable = 0;

    for (int i = 0; i < 100; i++) {

        // clock
        top->clk = !top->clk;

        // reset release
        if (i == 5)
            top->rst = 0;

        // enable pattern
        if (i > 10 && i < 80)
            top->enable = 1;
        else
            top->enable = 0;

        top->eval();

        tfp->dump(main_time);
        main_time++;

        std::cout
            << "t=" << i
            << " state=" << (int)top->state
            << " count=" << (int)top->count
            << " en=" << (int)top->enable
            << " ovf=" << (int)top->overflow
            << std::endl;
    }

    tfp->close();
    delete tfp;
    delete top;

    return 0;
}