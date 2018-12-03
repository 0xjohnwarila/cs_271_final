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

(T)           // T method. Updates tcounter with new value

(R)           // R method. Updates rcounter with new value