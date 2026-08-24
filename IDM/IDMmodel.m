function [vehicleXcoord, vehicleSpeed, vehicleAcc] =IDMmodel(vehicleXcoord, vehicleSpeed, desiredSpeed, accExponent, maxAcceleration, comDeceleration, desTimeGap,minimumGap, numberofVehicles, roadLength, vehicleLength, timeStep)
    %% -------------------------------------------------
    % IDMmodel(vehicleXCoord, vehicleSpeed, ...
    %                                   
    %
    %
    % idm
    % this function simulates the behavior of veh in a traffic flow
    % based on the idm. it updates veh positions, speed, and 
    % accelerations for a given time step
    %------------------------------------------------

    % Preallocate array for accelerations
    ACC = zeros(numberofVehicles,1);

    %% --------------------------------------
    % Compute the relative speed:
    % - First veh has no leading veh , so relative spped is its own speed
    % - For other other vehicles, it is the difference  between their speed
    % and the speed of the vehicle ahead
    relativeSpeed = [vehicleSpeed(1); diff(vehicleSpeed)];

    % compute the distance gap:
    % - For the first veh, the gap is the dist to the road end
    % - For other vehicles, the gap is the distance to the leading veh minus its length
    distanceGap = [roadLength - vehicleXcoord(1); ...
        vehicleXcoord(1:end-1)-vehicleLength - vehicleXcoord(2:end)];

    %%------------------------------
    % step 2 - calculate dynamic term , safe distance , and desired distance
    %-------------------------------------------------

    % dynamic term accounts for the influence of relative speed
    dynamicTerm = (vehicleSpeed.*relativeSpeed)./(2*sqrt(maxAcceleration*comDeceleration));

    % safe distance is based on the veh speed and desired time gap
    safeDistance = vehicleSpeed.*desTimeGap;

    % desired dist combines the min gap , safe distance and dynamic term
    desiredDistance = minimumGap + max(0, safeDistance + dynamicTerm);

    %%------------------------------
    %step 3 - calculate acc for each veh
    %-----------------------
    % idm acc formula:
    % - first term ensures acc towards the desired spped
    % - second term ensures deceleration to maintain safe gap to the
    % leading vehicle
    ACC = maxAcceleration*(1-(vehicleSpeed/desiredSpeed).^accExponent - (desiredDistance./distanceGap).^2);


    %%-----------------
    % step 4 - update veh speeds and acc
    %------------------------

    % compute new speeds based on current speed , acc, and time step
    newSpeed = vehicleSpeed + ACC*timeStep;

    % ensures speeds are non-negative (vehicles cannot reverse) 
    newSpeed(newSpeed < 0)=0; 

    % update acceleration based on the change in speed 
    vehicleAcc = (newSpeed - vehicleSpeed) / timeStep;

    %%---------------------
    % step 5 - update veh positions 
    %---------------------------------

    % update positions using the average speed during the time step
    vehicleXcoord = vehicleXcoord + ((newSpeed + vehicleSpeed) / 2) * timeStep;

    % update vehicle speeds to the newly computed values
    vehicleSpeed = newSpeed;
end
