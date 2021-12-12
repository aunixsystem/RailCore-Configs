M564 H1 S0                   ; Allow movement BEYOND axes boundaries (for Y to reach probe dock)

G91                          ; relative positioning
 
G1 H2 Z15 F3000              ; move Z 15 for clearance above dock.
G90                          ; absolute positioning


G1 X0 Y290 F18000             ; move adjacent to probe dock location
M400                         ; wait for moves to finish

G1 X0 Y307 F6000             ;  move over dock 
G4 P250                      ; pause for pickup

G1 X70 Y307 F6000            ;  slide probe out of dock - slowly
M400

G90                          ; absolute positioning

G1 X150 Y150 Z10 F18000       ; move bed to clear probe from build surface 
M400                         ; wait for moves to finish

M564 S1                      ; Restrict movement to within axes boundaries (for normal Y movement)