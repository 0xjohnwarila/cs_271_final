@tcounter    // Counter for T tokens
M=0
@rcounter    // Counter for R tokens
M=0
@output       // Mem location for the output
M=0

(MAIN)        // MAIN method. Listens for Keypress and jumps to T or R method
  @KBD        // Read from keyboard
  D=M         
  @keypress   
  M=D         // Save keypress
  @83         
  D=D-A       // Keyboard value - 83 (S) if it = 0 then keypress was S
  @START      
  D;JEQ       // If D = 0 (key was S) jump to START
  @keypress 
  D=M         // Reload keypress into D register
  @84         
  D=D-A
  @T
  D;JEQ       // If D = 0 (key was T) jump to T
  @keypress
  D=M
  @82
  D=D-A
  @R
  D;JEQ       // If D = 0 (key was R) jump to R
  @MAIN
  0;JMP       // Jump to start of MAIN method

(START)       // START method. Checks T/R counters and writes to output
  @tcounter
  D=M         // Load in value for T
  @MAIN
  D;JEQ       // If T = 0 jump to MAIN
  @1
  D=D-A
  @CHECKWD
  D;JEQ       // If T = 1 jump to CHECKWD
  @tcounter
  D=M         // Load in value for T
  @2
  D=D-A
  @WXD
  D;JEQ       // If T is 2, jump to WXD
  @MAIN
  0;JEQ       // If there was a value not expected, jump to main

(CHECKWD)     // CHECKWD method. Called if T = 1. Checks if R =1, if so jumps to WD, else jumps to W
  @rcounter
  D=M         // Load in value for R
  @1
  D=D-A
  @WD
  D;JEQ       // If R is 1 jump to WD
  @W
  0;JEQ       // If R is not 1 jump to W

(W)           // Writes 1 to output and clears T/R counters

(WD)          // Writes 2 to output and clears T/R counters

(WXD)         // Writes 3 to output and clears T/R counters

(T)           // T method. Updates tcounter with new value
  @tcounter
  D=M         // Load in T counter value
  @2
  D=D-2
  @MAIN
  D;JEQ       // If T = 2 keep it at 2 and jump to MAIN
  @TADD
  0;JEQ       // If T != 2 jump to TADD

(TADD)        // Add 1 to T counter
  @tcounter
  D=M
  @1
  D=D+A
  @tcounter
  M=D
  @MAIN
  0;JEQ       // Jump to MAIN

(R)           // R method. Updates rcounter with new value
  @rcounter
  D=M         // Load R counter value
  @1
  D=D-A
  @TWOR
  D;JEQ       // If R = 1, jump to TWOR method
  @ONER
  0;JEQ       // If R != 1, jump to ONER method

(TWOR)        // TWOR method. Called if there is 2 R. Sets R to 0 and jumps to T method
  @rcounter
  M=0         // Set R counter to 0
  @T
  0;JEQ       // Jump to T method

(ONER)        // Add 1 to R counter
  @1
  D=A
  @rcounter
  M=D
  @MAIN
  0;JEQ       // Jump to MAIN