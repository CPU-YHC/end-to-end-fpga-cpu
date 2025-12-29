# end-to-end-fpga-cpu — V1.0
End-to-end 8-bit, 5-stage pipelined CPU on Nexys A7 (Artix-7) — handwritten Verilog (RTL), MMIO-integrated embedded platform, verified bitstream.

![FPGA（Nexys A7-100T）◎ Dec  26 2025](https://github.com/user-attachments/assets/a0c054ac-8aef-445e-8ef3-6ce65802ec5b)

*Fig 1: Hardware-in-the-loop demonstration showing the five-stage pipeline executing the boot program and outputting `0x42` on the Nexys A7.*

**Keywords**  
End-to-end FPGA CPU · Five-stage pipeline · Embedded computing platform

---

## Overview

This project implements and verifies an **end-to-end 8-bit FPGA CPU system**.  
The CPU core is implemented in **handwritten Verilog (RTL)** using a classic **IF / ID / EX / MEM / WB** five-stage pipeline and is integrated with board peripherals via **memory-mapped I/O (MMIO)** to form a complete embedded computing platform.

The work covers the full engineering flow: **RTL design → Vivado synthesis & implementation → bitstream generation → board programming & verification** on a **Nexys A7 (Artix-7)** FPGA. Execution on real hardware demonstrates a reproducible execution path from instruction fetch through ALU and memory to external peripherals.

---

## Architecture Overview

![schematic](https://github.com/user-attachments/assets/d8b45b84-a715-44a3-a823-34995e0e616f)

*Fig 2: System-level datapath overview (exported from Vivado). Illustrates pipeline stage partitioning, principal module interconnections, and the MMIO peripheral interface.*

---

## Board-level Verification

### Demo: program execution and display of `0x42`

Upon reset, the CPU executes a preloaded instruction stream and writes the computed result via MMIO to the display register. The Nexys A7 seven-segment display then shows **`0x42`** (decimal 66).

[![Watch the demo video](https://img.youtube.com/vi/FJ3f6ELp7CY/maxresdefault.jpg)](https://www.youtube.com/watch?v=FJ3f6ELp7CY) 
*Click the image above to watch the demo on YouTube.*

*Fig 3: Live capture of board programming and execution, verifying the full instruction → ALU → memory → MMIO execution path.*

---

## Key contributions

- **End-to-end FPGA engineering loop** — Handwritten Verilog (RTL) → synthesis & implementation → bitstream → board verification.  
- **Five-stage pipelined microarchitecture** — IF / ID / EX / MEM / WB partitioning with pipeline registers, control logic and flush support.  
- **Embedded platform integration (MMIO)** — Memory-mapped I/O decouples core and peripherals (7-seg / LEDs / switches).  
- **Reproducible artifacts** — Repository and Release include validated sources, constraints, reports and a bitstream.

---

## Technical summary

| Feature | Specification |
|---|---|
| Data width / Instruction width | 8-bit data / 16-bit instruction |
| Pipeline | 5-stage (IF / ID / EX / MEM / WB) |
| Target device | Xilinx XC7A100T (Digilent Nexys A7-100T) |
| Toolchain | Xilinx Vivado (v2025.2 recommended) |
| Timing | Clock: 100 MHz; WNS = 4.844 ns (post-implementation) |
| Verification | Post-implementation timing closed; bitstream validated on hardware |

---

## Evolutionary roadmap

- **2025-11-24 — Logic modeling**: Hand-constructed 8-bit CPU at gate/logic level to understand ISA decoding and instruction flow.

  GitHub：https://github.com/CPU-YHC/Asymmetric-CallStack-8bit-CPU
- **2025-12-12 — Heterogeneous exploration**: Extended to 16-bit architecture and implemented a simple mini-GPU (bouncing ball demo).

  GitHub：https://github.com/CPU-YHC/turing-16bit-cpu/releases/tag/V2.1
- **2025-12-26 — RTL pipeline reconstruction (current)**: Reimplemented in handwritten Verilog RTL with a five-stage pipeline and completed end-to-end FPGA verification (displaying `0x42`).

---

## Verification & artifacts

Provided for reproducibility and review:

- `hdl/` — handwritten Verilog (RTL) sources  
- `constraints/Nexys-A7-100T.xdc` — board pin & clock constraints  
- `bitstream/top_v1.bit` — verified bitstream (Release asset)  
- `reports/` — post-implementation timing & utilization reports  
- `docs/` — architecture schematics and demo materials

---

## Status & limitations

- **Completed**: RTL implementation, five-stage pipeline, MMIO interface, Vivado implementation, and hardware demo.  
- **Current limitation**: Hardware forwarding and stall units not yet implemented. Current demo uses software-inserted NOPs to manage data hazards. Future work will prioritize forwarding/stall logic and expanded test coverage.

---

## Release

**V1.0** — initial public release containing RTL sources, implementation constraints and reports, a verified bitstream, and board-level demonstration materials.

---

## License

MIT License

---

**Project note:** This project was independently developed by a 12-year-old student. With no formal mentorship, he relied solely on online videos and AI-assisted learning to complete the entire design and implementation. Experts are kindly invited to review the project and provide feedback or suggestions on how to best support his future development.

