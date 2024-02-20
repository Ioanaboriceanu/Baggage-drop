Module sensors_input:
In this module, I utilized two 17-bit reg variables to compute the sum of values obtained from four sensors and subsequently calculate their average, denoted as "height." 
The decision to employ 17 bits instead of 16 was to accommodate the carry bit. Notably, during the summation process, I encountered a necessity to adjust the result by adding 
either 1 or 2 to ensure proper rounding up. Verilog lacks inherent rounding capabilities in such instances. For example, a sum of 91 would yield an average of 45.5 after division by 2, 
necessitating rounding up to 46. Since Verilog doesn't automatically handle this, I augmented the sum by 1 to ensure accuracy. Similar adjustments were applied to cases requiring rounding down, 
where the addition typically resulted in a value ending in .5, disregarded by Verilog, thus deemed acceptable.

Module display_and_drop:
Here, I implemented an "always@" block to evaluate various scenarios outlined in the task requirements. Subsequently, corresponding messages were displayed on the four designated screens. 
Ensuring proper representation, the variables were defined with [6:0], aligning with the requisite seven-bit character representation.

Module baggage_drop:
This module facilitated interconnection among the other three modules. Additionally, it incorporated an operation to compute "t_act" using the formula "t_act=sqrt(height)/2." 
To maintain consistency, the right shift operator was employed instead of the division operator.

Module square_root:
Exploring different calculation methodologies, I eventually opted for the CORDIC approach. The primary challenge pertained to representing results in fixed-point notation, as specified in the task requirements.
Initially, I meticulously implemented the algorithm as prescribed in the provided resources to comprehend its implications on our dataset. It was observed that the algorithm accepts an input value ('in') 
and a base value, calculated as 2^(n-1), where 'n' represents the number of bits used for the 'in' variable. The output, denoted as 'out', was initialized to 0 within the 'always@' block.
Subsequently, within a repetitive loop featuring a fixed number of iterations, the value of 'out' was iteratively computed. At each step, the base value was added to 'out', followed by a check to 
ascertain whether the square of the resultant value exceeded the initial input. If affirmative, the base value was subtracted from 'out' to rectify the deviation. The base value was then subjected 
to right-shifting, akin to division by 2.
The selection of base=128 was grounded on the realization that in an eight-bit representation, the leftmost bit equates to 2^7. Consequently, through bit manipulation, the algorithm progressively 
converges towards the desired value. Notably, adjustments were made iteratively, modifying one bit from 0 to 1 (or vice versa) at each step.
In my implementation, the initial loop computed the first eight bits, while the subsequent loop addressed the remaining eight bits. For the latter loop, auxiliary variables such as 'aux' of
24 bits and 'in2,' holding the left-shifted 'in' variable by eight bits, were employed. Despite the square of 'out' spanning 24 bits, a necessary trick facilitated comparison with 'in2' on 16 bits. 
Following calculations transpired within 'out,' with 'base' being reinitialized to 128 at each iteration. The number of iterations aligned with the number of bits requiring modification at each stage, set to 8.
