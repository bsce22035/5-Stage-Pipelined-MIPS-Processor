# 5-Stage Pipelined MIPS Processor

A Verilog implementation of a classic MIPS 5-stage pipeline with instruction-level parallelism.

## Features

###Implements the 5 pipeline stages:

- IF – Instruction Fetch

- ID – Instruction Decode / Register Fetch

- EX – Execute / ALU Operations

- MEM – Data Memory Access

- WB – Write Back

- Supports basic MIPS instructions (R-type, I-type, load/store, branch).

- Handles data hazards using forwarding and stalling.

- Includes control hazard handling for branch instructions.


## Usage

- Simulate using Vivado.

- Load test instructions in the instruction memory.

- Run the simulation to verify pipeline execution.

