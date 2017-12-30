% EngE 1215 Spring 2015
% This program is used to help a Line-Following Robot follow the line.  
% The first several sections set up the constants used in the communcation
% between this program and the arduino.  
% Each student will add his/her own code to the User Code section with the
% logic to follow the line.  

% This program assumes that a connection has been established to the
% arduino using the program Robot_Connect. 
% The variable 'a' must be established in the command window.

%% Constants for reading sensors - do not change statements in this block 
% unless there is a change to the physical robot
SENSOR_PIN = 'D13';     % sensor control pin (all sensors)
LEFT_SENSOR_PIN = 'A0';  % pin to read left sensor values from
CENTER_SENSOR_PIN = 'A2';% pin to read center sensor values from
RIGHT_SENSOR_PIN = 'A4'; % pint to read right sensor values from

%% Changes and Additions
% pins have digital and analog designations, ex 13 => 'D13', 2 => 'A2'
% pinMode setup
a.pinMode(SENSOR_PIN,'DigitalOutput');
a.pinMode(LEFT_SENSOR_PIN,'AnalogInput');
a.pinMode(CENTER_SENSOR_PIN,'AnalogInput');
a.pinMode(RIGHT_SENSOR_PIN,'AnalogInput');

%% Constants for motor control - Change lmHigh and rmHigh based on testing
%your robot.  Do not change other statements in this block 
% unless there is a change to the physical robot
LEFT_MOTOR = 'D5';      % set pin 5 as the pin to control the left motor 
RIGHT_MOTOR = 'D6';     % set pin 6 as the pin to control the right motor 
OFF = 0;            % motor speed of 0, 0 is off
lmHigh = 1;       % left motor speed, range of acceptable values 0-1
rmHigh = 1;       % right motor speed, range of acceptable values 0-1

%% USER CODE SECTION - Your code begins down here - Use the constants above
% to keep your program clear and easy to understand.  Use: 
%   a.digitalWrite(SENSOR_PIN,1) %to turn sensors on
%   left = a.analogRead(LEFT_SENSOR_PIN); %input value from the left sensor
%   - use similar command for the right and center sensors.
%   a.digitalWrite(SENSOR_PIN,0) %output to turn off sensors make sure you
%   turn the sensor off after set of readings. 
%   a.analogWrite(LEFT_MOTOR,lmHigh) %to turn left motor on
%   a.analogWrite(LEFT_MOTOR,OFF) %to turn left motor off - use similar
%   command for the right motor.
THRESHOLD = 2;
allWhite = 0;
ALL_WHITE_LIMIT = 15;

while allWhite < ALL_WHITE_LIMIT
    a.digitalWrite(SENSOR_PIN, 1)
    left = a.analogRead(LEFT_SENSOR_PIN);
    right = a.analogRead(RIGHT_SENSOR_PIN);
    center = a.analogRead(CENTER_SENSOR_PIN);
    if left > THRESHOLD
        a.analogWrite(RIGHT_MOTOR, lmHigh)
        a.analogWrite(LEFT_MOTOR, OFF)
        allWhite = 0;
    end
    if right > THRESHOLD
        a.analogWrite(LEFT_MOTOR, lmHigh)
        a.analogWrite(RIGHT_MOTOR, OFF)
        allWhite = 0;
    end
    if center > THRESHOLD
        a.analogWrite(LEFT_MOTOR, lmHigh)
        a.analogWrite(RIGHT_MOTOR, lmHigh)
        allWhite = 0;
    end
    allWhite = allWhite + 1;
end

a.analogWrite(LEFT_MOTOR, OFF)
a.analogWrite(RIGHT_MOTOR, OFF)

%% The section makes sure the motor and sensors are off when the program stops.
a.analogWrite(LEFT_MOTOR,OFF) %to turn left motor off 
a.analogWrite(RIGHT_MOTOR,OFF) %to turn left motor off 
a.digitalWrite(SENSOR_PIN,0) %output to turn off sensors