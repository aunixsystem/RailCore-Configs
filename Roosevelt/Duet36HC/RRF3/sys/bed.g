M561                         ; clear any existing bed transform
G1 Z10 S2
G30 P0 X15 Y45 Z-99999
G30 P1 X15 Y275 Z-99999
G30 P2 X275 Y150 Z-99999 S3
G1 X0 Y0 F5000               ; move the head to the corner (optional)

