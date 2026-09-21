# Sean W. Evans

**Research Engineer — HPC, Compilers, GPU/FPGA, Database Internals**

Long Island, NY · [Sean@SeanWEvans.com](mailto:Sean@SeanWEvans.com) · +1 (516) 330-2517 · [SeanWEvans.com](https://SeanWEvans.com) · [github.com/seanwevans](https://github.com/seanwevans) · [linkedin.com/in/sean-evans-49398229b](https://linkedin.com/in/sean-evans-49398229b)

---

## Summary

Systems engineer moving from production machine learning and high-throughput data infrastructure into research engineering: high-performance mathematical computing, compilers, GPU and FPGA acceleration, and database internals. Builds experimental systems end to end — mathematical formulation, low-level implementation, validation, and performance measurement — in C++, C, CUDA, Rust, Python, SQL, LLVM, and RTL.

---

## Independent Research & Engineering

### Independent Research Engineer
*Feb 2025 – Present*

**pynq_butterfly** — Exact FPGA accelerator for OpenFHE BGVRNS ciphertext multiplication and BV relinearization on a PYNQ-Z2: pipelined Barrett modular arithmetic, AXI DMA transport, coefficient-major evaluation-key reuse.
- 245.61 exact relinearized ciphertexts/sec at 98.84% of the calculated transport ceiling; 6,291,456 residue outputs validated against OpenFHE with zero mismatches.

**Lockstep** — Data-oriented systems language and compiler for deterministic, high-throughput compute pipelines: straight-line SIMD execution, static memory topology, Struct-of-Arrays layout, semantic type checking.
- LLVM IR generation with manual vector lowering, generated C host interfaces, compiler diagnostics, benchmark regression testing, and LSP support.

**fluid-sims** — CUDA-accelerated numerical simulation laboratory spanning smoothed-particle hydrodynamics, hypersonic flow, reaction–diffusion systems, viscous Burgers flow, shallow-water equations, and 3-D fluid dynamics.

---

## Experience

### Machine Learning Engineer — Data Conversion Laboratory
*Remote · May 2021 – Feb 2025*
- Designed a Detectron2-based document segmentation pipeline that reduced manual classification by 50%.
- Built a CNN–RNN LaTeX OCR system for high-accuracy equation and document recognition.
- Automated document styling with NLP and the Microsoft Office SDK, reducing a 40-hour workflow to 2 hours.
- Implemented an OpenCV-based checkbox detector achieving greater than 96% accuracy across thousands of formats.
- Developed high-throughput processing pipelines capable of handling millions of pages per week.

### Software Engineer — Data Conversion Laboratory
*Remote · Sep 2020 – May 2021*
- Architected a PDF cleaning and OCR preprocessing system scaling to more than 100,000 pages per week per server.
- Automated LaTeX and JATS XML correction workflows, replacing a full-time manual process.
- Developed DOCX-to-XML conversion tooling using Microsoft Office Interop and C#.

### Lead Technology Analyst — Data Conversion Laboratory
*Queens, NY · Sep 2019 – Sep 2020*
- Led workflow optimization efforts, mentored junior engineers, and coordinated technical requirements with stakeholders.

### Technology Analyst — Data Conversion Laboratory
*Queens, NY · May 2018 – Sep 2019*
- Developed custom data-conversion tools for production support and maintained high-volume enterprise pipelines.

---

## Technical Skills

| Area | Skills |
|---|---|
| **Languages** | Rust, C++, C, CUDA, NASM, Python, SQL, TypeScript |
| **Systems** | Linux, GPU kernels, FPGA/RTL, LLVM, SIMD, compiler tooling, AST analysis, multiprocessing, distributed systems, consensus algorithms |
| **Databases** | PostgreSQL internals, extension development, query execution, vector search, ETL pipelines, XML processing |
| **ML / CV** | PyTorch, Detectron2, OpenCV, OCR pipelines, neural-network training and inference |

---

## Education

**B.S. in Mathematics**, Long Island University — *January 2026*
Summa cum laude · Major GPA 4.0 · Cumulative GPA 3.9
