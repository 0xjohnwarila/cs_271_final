# cs_271_final

Final project for Computer Architecture and Assembly

Tips for running final_controller.asm:

1. Press T to insert a T token. If you are using the CPU Emulator inlcuded with Nand2Tetris, try to time your keypresses to just before the 6th line (@24576). You can continue to hold down the key, but this may cause accidental inputs.
2. Press R to insert an R token.
3. Press S to start.
4. The ouput will be displayed in RAM location 18. 1 is for W, 2 is WD, and 3 is WXD. This output is reset to 0 at the start of every MAIN loop, so pay close attention after you hit start!
5. You need 1 T or 2 R to output W.
6. You need 1 T and 1 R or 3 R to output WD.
7. You need 2 T or 4 R to output WXD.
8. After you have pressed start your tokens are cleared, unless you don't have enough to get an output. So don't overpay!
9. The program will never exit by itself, you can get as many ouputs as you want.
10. You can see how many tokens you have in RAM locations 16 and 17. 16 is for T tokens, and 17 is for R tokens. Note: If you have 2 R tokens they will be turned into a T token.
11. For more details look at the notes file.
