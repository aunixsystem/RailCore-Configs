G90	                       ; absolute positioning

M564 S0                        ; allow movement outside the boundaries

G1 X70 Y307  F18000             ; move to the entry position for the dock

G1 X0  Y307  F6000             ; move into the dock position

G4 P250                        ; pause 250 usecs 

G1 X0  Y260  F6000             ; move to the side adjacent to the dock

M400

G1 X150.0 Y150.0 F18000        ; move to the center of the bed
M400

M564 S1                        ; set movement limit to axis boundaries