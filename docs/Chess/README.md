# Chess

All Settings are available through OSD:
- Choose color
- Choose view
- Overlay for field description 1-8,A-H
- Play against human or AI
- Select AI strength and randomness

Design is done without the use of any CPU/Processor, just pure logic in VHDL.
Ressource usage is very high, as a lot of things are done in parallel:
- Finding all possible moves for a given board is done in a few clock cycles
- Executing a move(including castling and en passant) in a single cycle
- Evaluating the score of a given board for the AI costs 2 clock cycles

The design isn't super optimized and can probably be speed up quiet a bit.
However, if you experience the AI as to weak, there are better ways to improve it, than bare speed, e.g. opening tables.