function visualization(vehicleXcoord, vehicleLength, vehicleWidth, numberofVehicles)
    % Visualize the vehicles on the road as rectangles efficiently.
    %
    % INPUTS :
    % vehicleXcoord - vector containing the x-coordinates of vehicles
    % vehicleLength
    % vehicleWidth 
    % numberofVehicles
    %
    % OUTPUT :
    % None. The funtion directly creates and deletes a batch of rectangles
    % for visualisation.
    % Precompute rectangle positions for all vehicles 
    xPositions = vehicleXcoord - vehicleLength; % bottom left corner X
    yPositions = -vehicleWidth/2;  %bottom left corner y ( all are centered)

    % create rectangles for all vehicles in one batch
    for i =1:numberofVehicles
        rectangle('Position',[xPositions(i), yPositions, vehicleLength, vehicleWidth], ...
            'FaceColor', [1, 1,0],'EdgeColor','none'); % yellow rectangles
    end

    % ensure proper plot scaling
    axis equal; % maintain equal aspect ratio for x and y axes
    xlim([min(xPositions) - vehicleLength, max(vehicleXcoord) + vehicleLength]); % add padding to the
    ylim([-vehicleWidth, vehicleWidth]); % set limits for the y-axis to fit vehicle width

    %enhance visualization
    grid on; %add a grid for better visual reference
    xlabel('Road Length (m)'); % label for x-axis
    ylabel('Road Width (m)'); % label for y-axis
    title('Vehicle Visualization'); % add title to the plot

    pause(0.005);

    % remove any existing rectangle from the plot
    rectangles=findobj(gca, 'Type','rectangle'); %find existing rectangle objects
    delete(rectangles); %delete all rectangle efficiently

    hold on; % keep the current plot for future updates
end

