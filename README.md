# fsm-portcullis-manager
A VHDL and Verilog implementation of an FSM that manages a portcullis.</br>
</br>
Input A: starts an action or stops a current action and starts the opposite.</br>
Input UP_LMT: indicates that maximum upward travel of the portcullis has been reached. </br>
Input DW_LMT: indicates that maximum downward travel of the portcullis has been reached.</br>
Output MOT_DW: causes the motor to run in direction to lower the door.</br>
Output MOT_UP: causes the motor to run in direction to raise the door.</br>
Fully open AND A=1 -> closes</br>
(Fully closed AND A=1) OR (Middle open AND A=1) -> raises</br>

