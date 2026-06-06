# 🔧 Verilator Counter + FSM Simulation Project

This is a small educational SystemVerilog + Verilator project demonstrating a complete basic digital design and simulation workflow, including RTL design, testbench in C++, waveform generation, and Makefile-based automation.

---

# 📌 Project Overview

This project implements a simple finite state machine (FSM)-controlled counter with enable logic and overflow detection. It is intended as an introduction to hardware design and verification flow using open-source tools.

The simulation is performed using Verilator, and results are visualized using GTKWave.

---

# ⚙️ Dependencies

This project requires the **OSS CAD Suite** (includes Verilator, GTKWave, etc.):

https://github.com/YosysHQ/oss-cad-suite-build

It is recommended to use the prebuilt release.

---

## Installation

1. Download OSS CAD Suite:
   https://github.com/YosysHQ/oss-cad-suite-build/releases

2. Extract it, for example:  ~/tools/oss-cad-suite/

3. No system-wide installation is required.

---

## Environment setup

This project uses environment variables instead of hardcoded tool paths.

Copy the example file:

```bash
cp .env.example .env

Then set your local path: OSS_CAD_SUITE=/home/your_user/tools/oss-cad-suite

---

# 🧠 Design Description

The RTL module contains:

- A 2-bit finite state machine (FSM):
  - IDLE  – waiting for enable signal
  - RUN   – counter is active
  - STOP  – paused state

- An 8-bit counter register
- Enable-controlled counting behavior
- Overflow detection at 0xFF

### Behavior summary:
- After reset, the system starts in IDLE state
- When enable = 1, the FSM transitions to RUN
- In RUN state, the counter increments on each clock cycle
- When enable = 0, the FSM transitions to STOP
- Overflow flag is set when counter reaches maximum value

---

# 📁 Project Structure

counter.sv        - RTL design (FSM + counter logic)
sim_main.cpp      - C++ testbench driving simulation
Makefile          - build automation (Verilator + GTKWave)
obj_dir/          - generated Verilator build files (ignored in git)
wave.vcd          - waveform output file (ignored in git)

---

# ⚙️ Build and Execution

## Build the project
make build

## Run simulation
make run

## View waveform
make wave

---

# 📊 Waveform Signals

The generated VCD file can be opened in GTKWave and includes the following signals:

- clk       – system clock
- rst       – reset signal
- enable    – enables counting
- count[7:0] – current counter value
- state[1:0] – FSM state
- overflow  – overflow indicator

---

# 🧪 Requirements

To build and run this project, you need:

- Verilator (OSS CAD Suite recommended)
- GTKWave
- GNU Make
- C++ compiler (g++)

---

# 🚀 Learning Objectives

This project demonstrates:

- Basic RTL design using SystemVerilog
- Finite State Machine (FSM) implementation
- Event-driven hardware simulation
- C++ based testbench interaction with RTL
- Waveform-based debugging workflow
- Build automation using Makefiles

---

# 📚 Notes

- This is an educational project intended for learning digital design and verification basics
- Verilator is used as a fast open-source simulator
- GTKWave is used for waveform visualization
- The structure follows a simplified industry-style workflow

---

# 👨‍💻 Author

Educational project created for learning RTL design, simulation, and verification fundamentals