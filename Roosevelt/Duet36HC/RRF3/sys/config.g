;General Setup - RailCore RRF on a SBC for Duet3
M550 P"roosevelt"
M575 P0 B115200 S1
M575 P1 B57600 S1                                                           ;PanelDue
G21                                                                         ;Work in millimetres
G90                                                                         ;Send absolute coordinates...
M83                                                                         ;...but relative extruder moves
M555 P2

; Stepper configuration
M569 P0 S1 D3                                                               ;Drive 0 X / Rear
M569 P1 S0 D3                                                               ;Drive 1 Y / Front
M569 P2 S1 D3                                                               ;Drive 2 Z Front Left
M569 P3 S1 D3                                                               ;Drive 3 Z Rear Left
M569 P4 S1 D3                                                               ;Drive 4 Z Right
M569 P5 S1 D3                                                               ;Drive 5 Extruder

;Axis configuration
M669 K1                                                                     ;corexy mode
M584 X0 Y1 Z2:3:4 E5                                                        ; Map X to drive 0 Y to drive 1, Z to drives 2, 3, 4, and E to drive 5

;Leadscrew locations
M671 X-10:-10:333  Y22.5:277.5:150 S7.5

M350 X16 Y16 Z16 E16 I1                                                     ;set 16x microstepping for axes with interpolation
M906 X1200 Y1200 Z1200 E800 I80                                             ;Set motor currents (mA)
M201 X2500 Y2500 Z100 E1500                                                 ;Accelerations (mm/s^2)
M203 X24000 Y24000 Z900 E3600                                               ;Maximum speeds (mm/min) 
M566 X800 Y800 Z100 E1500                                                   ;Maximum jerk speeds mm/minute 
M208 X290 Y290 Z280                                                         ;set axis maxima and high homing switch positions (adjust to suit your machine)
M208 X0 Y0 Z0 S1                                                            ;set axis minima and low homing switch positions (adjust to make X=0 and Y=0 the edges of the bed)
M92 X200 Y200 Z1600 E837                                                    ;steps/mm
 
; End Stops
M574 X1 S1 P"io8.in"                                                        ;Map the X endstop to io8.in
M574 Y1 S1 P"io6.in"                                                        ;May the Y endstop to io6.in
 
; Thermistors
M308 S0 P"temp0" Y"thermistor" A"keenovo" T100000 B4240 H0 L0               ;Bed thermistor - connected to temp0
M308 S1 P"temp1" Y"thermistor" A"mosquito" T500000 B4723 C1.196220e-7 H0 L0 ;Duet3 e3d thermistor - connected to e0_heat

;Define Heaters
M950 H0 C"out0" T0                                                          ;Bed heater is on out0
M950 H1 C"out1" T1                                                          ;Hotend heater is on out1

;Define Bed
M140 H0

M307 H0 B0 R0.310 C750.2 D10.72 S1.00 V24.0                                 ;Keenovo duet 3 configuration
M307 H1 B0 R2.570 C140.9 D6.18 S1.00 V23.9                                  ;E3D Hotend  duet 3 configuration
                        
M570 S360                                                                   ;Hot end may be a little slow to heat up so allow it 180 seconds
M143 S285                                                                   ;Set max hotend temperature			

; Fans
M950 F0 C"out7"                                                             ;Hotend fan on "out7" connector
M106 P0 S255 H1 T50                                                         ;enable thermostatic mode for hotend fan
M950 F1 C"out8"                                                             ;Layer fan on "out8" connector
M106 P1 S0                                                                  ;Layer Fan

;Define LEDs
M950 P3 C"out9" Q500
M42 P3 S1

; Tool definitions
M563 P0 D0 H1 F1                                                            ;Define tool 0
G10 P0 S0 R0                                                                ;Set tool 0 operating and standby temperatures

;Euclid Probe
M574 Z1 S2                                                                  ; configure Z-probe endstop for low end on Z
M558 K0 P5 C"io7.in" H8 F300 60 T9000 A3 S0.01      
                                                                            ; K0 for probe 0, P5 for NC switch, C for input pin, 
                                                                            ; ^ for enabling the native pullup resistor on Duet 2 
                                                                            ; hardware running RRF3  
                                                                            ; H dive height of 8mm, F300 probing speed 6mm/sec, 
                                                                            ; T9000 travel speed 150mm/sec,   
                                                                            ; A3 number of probes 1, S0.01 max tolerance of 0.01 

G31 K0 P500 X3 Y36 Z11.41                                                  ; CHECK for LOOSE things first! set Z probe trigger 
                                                                            ; value, offset and trigger height.  Higher numbers
                                                                            ; makes nozzle closer to bed
                                                                            ; switch plunger is 16.4mm to the LEFT and 29.27mm in
                                                                            ; FRONT of the nozzle. Switch triggers 0.9mm BELOW nozzle
                                                                            ; https://duet3d.dozuki.com/Wiki/Test_and_calibrate_the_Z_probe#Section_Fine_tuning_the_trigger_height
                                                                            ; if you have to move the nozzle away from the bed, 
                                                                            ; decrease the G31 Z value by the amount of baby stepping used.

T0                                                                          ;select first hot end