# SD-E1 Parallel Event Processing

This exercise focuses on parallelising an event loop using OpenMP and diagnosing common performance pitfalls.

## Goals

- Understand OpenMP parallel for loops
- Recognise and fix data races
- Diagnose false sharing and improve scaling

## Where to work

Go to:

- `exercises/SD-E1-parallel-event-processing/starter/`

## Expected workflow

1. Build without OpenMP. Confirm correctness.
2. Enable OpenMP. Observe incorrect results due to race.
3. Fix with reductions / private accumulators.
4. Benchmark and investigate scaling.
5. Fix false sharing by padding or using OpenMP reductions.
