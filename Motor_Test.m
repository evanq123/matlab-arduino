% EngE 1215 Spring 2015
% This program is used to test the Line Following Robot motors.  It uses a
% while loop that continues as long as the user wishes allowing the user to
% change the "power-level" for each motor each time through the loop.
% This program assumes that a connection has been established to the
% arduino.  The variable 'a' must be established in the command window.

%% Constants for motor control - do not change statements in this block 
% unless there is a change to the physical robot. 
LEFT_MOTOR = 'D5';      % set pin 5 as the pin to control the left motor 
RIGHT_MOTOR = 'D6';     % set pin 6 as the pin to control the right motor 
OFF = 0;            % motor speed of 0, 0 is off
lmHigh = 1;       % left motor speed, range of acceptable values 0-1
rmHigh = 1;       % right motor speed, range of acceptable values 0-1

%% This loop communicates with the motors, turning them on and off.  
% to keep your program clear and easy to understand

again = 1;  %Begin Loop
while again == 1
    lmHigh = input('Enter desired left motor speed level (0.0000-1.0000): ');
    rmHigh = input('Enter desired right motor speed level (0.0000-1.0000): ');
    a.analogWrite(LEFT_MOTOR,lmHigh) %output to left motor
    a.analogWrite(RIGHT_MOTOR,rmHigh) %output to the right motor

    display('Hit any key to stop motors')
    pause %allow the robot to continue at the above "speeds" until the user types any key
    
    a.analogWrite(LEFT_MOTOR,OFF) %output to left motor to turn it off.
    a.analogWrite(RIGHT_MOTOR,OFF) %output to right motor to turn it off.

    again = input('Run again?  1 for Yes, 0 for No: ');
end
