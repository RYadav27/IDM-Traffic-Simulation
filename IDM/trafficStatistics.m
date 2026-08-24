function [timeStat,gapStat,speedStat,accStat]=trafficStatistics(timeStat,gapStat,speedStat,...
                                               accStat, vehicleXcoord, vehicleLength,...
                                               roadLength, vehicleSpeed, vehicleAcc, refTime)
    %description of input and output
    % Append the current time to the time statistics array
    timeStat=[timeStat;refTime];

    %define the indices of veh for which statistics are collected
    % these indices correspond to specific veh in the simulation
    vehicleIndices = [1, 5, 10, 15,20];

    % initialize an array to store the gap between vehicles
    % calculate the gap for the first veh relative to the road end
    gaps=roadLength-vehicleXcoord(1);
    
    % loop through the selected veh indices(starting from second)
    % calculate gaps between the current vehicle and the one ahead
    for i=2:numel(vehicleIndices)
        idx=vehicleIndices(i);   %current veh index
        preIdx=idx-1; %previous veh index
        gap=vehicleXcoord(preIdx)-...
            vehicleLength-...
            vehicleXcoord(idx);
        gaps=[gaps,gap];               % append the calculated gap

    end
    % append the calculated gaps to the gap statistics matrix
    gapStat=[gapStat;gaps];

    % collect the speeds of the selected veh
    % and append them to the speed statistics matrix
    speedStat=[speedStat;vehicleSpeed(vehicleIndices)'];

    % collect the acceleration of the selected veh
    % and append them to the acceleration statistics matrix
    accStat=[accStat;vehicleAcc(vehicleIndices)'];

end
