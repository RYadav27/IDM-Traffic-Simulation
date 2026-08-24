function vehicleXcoord = Initialization(vehicleLength, minimumGap, stopLine, numberofVehicles)
    % initialization of vehicle position along the road 
    %
    % INPUTS:
    % ~        - Ignored input (placeholder for vehicleXcoord, since it's overwritten)
    % vehicleLength - length of each vehicle (m)
    % minimumGap - minimum gap between consecutive vehicles (m)
    %stopLine - Position of the stop line (m)
    % numberof Vehicles - Total number of vehicles to initialize
    %
    % OUTPUT :
    % vehicleXcoord - Updated X-coordinates of vehiccles

    % Calculate the spacing between vehicles
    spacing = vehicleLength + minimumGap;

    % Compute X-coordinate for all vehicles
    vehicleXcoord = stopLine - (0:(numberofVehicles-1))' * spacing;

end
