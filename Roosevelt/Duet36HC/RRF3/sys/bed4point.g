M558 F300 A3                              ; fix probe speed to 1mm/s
G90
G4 P250

G30 P0 X18.0 Y65.0 F9000.0 Z-99999       ; probe front left PEI

G30 P1 X18.0 Y285.0 F9000.0 Z-99999      ; probe back left PEI

G30 P2 X270.0 Y285.0 F9000.0 Z-99999     ; probe back right PEI

G30 P3 X270.0 Y65.0 F9000.0 Z-99999 S3   ; probe near front right leadscrew and calibrate 3 motors PEI