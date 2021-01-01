# ENEL453_LAB2

## Introduction

### Problem Statement

Increase the functionality of Lab 1 by adding two additional modes of operation for the 7-segment displays. The modes of operation will include:

1. Hexadecimal output (existing Lab 1 functionality)
2. Decimal output (existing Lab 1 functionality)
3. Stored output based on a switch or pushbutton input (new for Lab 2)
4. Hardcoded “5A5A” output (new for Lab 2)

Ensure to account for debounce effects if using a button to store the output for mode 3.

### Project Objective

The project objectives included:

1.	To give the team an opportunity to become familiar with the technologies used.

## Technologies

The technologies used include:

1. VHDL 1997
2. Intel Quartus Prime Lite Edition v20.1
3. ModelSim Intel FPGA Starter Edition
4. DE10-Lite FPGA board from Terasic

## Launch

To launch the project on to the board, you will first have to create a project in Quartus. To do so follow these steps:

1. Select "New Project Wizard".
2. Click "Next" on the intro page.
3. Choose a directory for the project, as well as a name for the project. Set the top level name to "top_level.vhd" and click "Next".
4. Select "Empty Project" and click "Next".
5. Add all the project files (everything with extensions vhd., qsf., and .sdc). Click "Next".
6. Go into the "Board" tab and select "MAX 10 DE10-Lite". Also, make sure to unselect "Create top-level design file" that is located near the bottom of the window. Click "Next".
7. Include no EDA tools. Click "Next".
8. Click "Finish".

Then, to program the hardware, follow these steps:

1. Compile the design. This can be done through a button on the taskbar.
2. Click on "Program Device".
3. Click on "Hardware Setup".
4. Slect "USB-Blaster" and then "Close".
5. Finally, click on "Start" and wait till the progress bar shows 100%. At this point the board has been programmed and you can test the design.

When testing, note that PB2 was selected to store the output for mode 3.

If looking to simulate the design, create a project in ModelSim. You can then use any of the different testbenches provided to test different parts of the design.

## Possible Improvements

Possible improvements for this project include:

N/A
