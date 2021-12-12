; ***********************************************************
; Euclid Probe Fixed Dock homez.g example
; RRF 2x on Duet 2 hardware
; saveas system/homez.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************
;

M561                                            ; clear any bed transforms
M290 S0 R0                                      ; clear baby steps

; G91

; G1 H2 Z10 F6000                               ; lift Z relative to current position
M400

G90                                             ; absolute positioning

M401                                            ; This runs macro file deployprobe

G1 X150 Y150 F9000                            ; go to first probe point
M400

G30 -2
G1 Z10
M400
G4 P500

M98 P"0:/sys/bed4point.g"                       ; tram bed

G1 X150 Y150 F9000                              ; go back to the first probe point and reprobe 0 in case it moved
G30

M402 P0                                         ; retract probe

G1 Z10 F600                                     ; lift Z relative to current position
G90                                             ; absolute positioning
M564 S1




