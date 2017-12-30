% EngE 1215 Spring 2015
% This program established the connection between the computer and the
% robot.

%% Run once at start of session and leave 'a' 
% defined in the workspace - DO NOT DELETE 'a'!
% Change COM4 to the com port your arduino installs to.
% Windows will have 'COM1', 'COM2' etc.
% macOS will have '/dev/cu.usbmodem1421' or similar
% This can be checked in the arduino software under Tools > Port
a = arduino_new('COM4'); % connects to robot using arduino.m
