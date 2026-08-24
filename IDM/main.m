clc; %clear command window
clear; % Remove all variables from workspace

%% parameter for road network
roadLength = 878; % Length of the road in meters
roadWidth = 3.5; % Width of the road in meters

% Uncomment the following block if road visualization is needed:
scenario = drivingScenario;     % create a driving scenario
roadCenter = [0 0; roadLength 0];     % define the road center point
road(scenario, roadCenter, roadWidth);    % create the road in the scenario
plot(scenario, 'Centerline', 'on');      % plot the road with centerline 
hold on;    % hold the plot for additional element

%% input parameters 
vehicleLength=5;
vehicleWidth=3;
numberofVehicles=20;     %total number of vehicles on the road
stopLine=138;            %stop line positiom in meter
timeStep=0.1;               %time step for simulation in seconds
totalTime=120;      % time simulation duration in secconds

%(idm parameters)
desiredSpeed=15;
accExponent=4;
maxAcceleration=1.0;
comDeceleration=1.5;
desTimeGap=1.0;
minimumGap = 2; % minimum gap between vehicles in meters 

% statistical data storage
timeStat=[];   % time history for statistical analysis
gapStat=[];
speedStat=[];
accStat=[];

%% initialization of vehicle states
vehicleSpeed = zeros(numberofVehicles,1);
vehicleAcc = zeros(numberofVehicles,1);  %Accelerations of vehicles (initialized to zero)


% initialize vehicle positions on the road
vehicleXcoord = Initialization(vehicleLength, minimumGap, stopLine, numberofVehicles);

%precompute the total number of time steps to avoid recalculating in each
%iteration
%

refTime=0;
%loop through each time step
while refTime<=totalTime
    %step 1update traffic statistics

    [timeStat,gapStat,speedStat,accStat]=trafficStatistics(timeStat,gapStat,speedStat,...
                                               accStat, vehicleXcoord, vehicleLength,...
                                               roadLength, vehicleSpeed, vehicleAcc, refTime);

    %step 2 update veh position and speeds using the IDM model
    %the idm model is applied to calculate new positions and speeds for
    %each veh
    %based on the veh dynamics and the parameters (desiredspeed,
    %acceleration,etc)
    % this function returns the updated veh positions(vehXcoord) and speeds
    % (vehicleSpeed)
    [vehicleXcoord, vehicleSpeed, vehicleAcc] =IDMmodel(vehicleXcoord, vehicleSpeed,...
        desiredSpeed, accExponent, maxAcceleration,...
        comDeceleration, desTimeGap,minimumGap, numberofVehicles,...
        roadLength, vehicleLength, timeStep);

    visualization(vehicleXcoord, vehicleLength, vehicleWidth, numberofVehicles);

    refTime=refTime+timeStep;
end

plotFunction(timeStat, gapStat, speedStat, accStat);
