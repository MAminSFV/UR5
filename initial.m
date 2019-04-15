clear,clc
tf = 4.9; %total simulation time % Warning: tf and T in Timing law must be changed together
ts = 0.001;                     %sampling Time
qi = [0;pi/4;0;-pi/3;0;0];      % initial configuration
sim Project_UR5;
