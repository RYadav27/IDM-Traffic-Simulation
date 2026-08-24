function plotFunction(timeStat, gapStat, speedStat, accStat)
    %%------------------------------
    % function: plotFunction
    %description 
    %plots the gap, speed, and acc for selected vehicle
    %
    % inputs    
    % -timeStat - array of time observation
    % -gapStat  - matrix of veh gaps(column represent vehicles)
    % -speedStat
    % -accStat

    %%-------------------------
    % plot1:vehicle gaps
    figure(2);    % open another figure window
    plot(timeStat(:, 1), gapStat(:, 1), 'r', ...  % plot car 1
        timeStat(:, 1), gapStat(:, 2), 'g', ...   % plot car 5
        timeStat(:, 1), gapStat(:, 3), 'b', ...   % plot car 10
        timeStat(:, 1), gapStat(:, 4), 'c', ...   %plot car 15
        timeStat(:, 1), gapStat(:, 5), 'm');     %plot car 20
    xlabel('Time(s)'); %label x-axis
    ylabel('Gap (m)'); %label y-axis
    ylim([0 35]); %set y axis limits
    legend('Car 1','Car 5','Car 10','Car 15','Car 20');  %add legend
    title('Gap of Vehicles Over Time'); %add title

     % plot2:vehicle speeds
    figure(3);  % open another figure window
    plot(timeStat(:, 1), speedStat(:, 1), 'r', ... % plot car 1
        timeStat(:, 1), speedStat(:, 2), 'g', ...  % plot car 5
        timeStat(:, 1), speedStat(:, 3), 'b', ...   % plot car 10
        timeStat(:, 1), speedStat(:, 4), 'c', ...   %plot car 15
        timeStat(:, 1), speedStat(:, 5), 'm');     %plot car 20
    xlabel('Time(s)'); %label x-axis
    ylabel('Speed (m/s)'); %label y-axis
    ylim([0 15]); %set y axis limits
    legend('Car 1','Car 5','Car 10','Car 15','Car 20');  %add legend
    title('Speed of Vehicles Over Time'); %add title

     % plot3:vehicle acceleration
    figure(4);  % open another figure window
    plot(timeStat(:, 1), accStat(:, 1), 'r', ... % plot car 1
        timeStat(:, 1), accStat(:, 2), 'g', ...  % plot car 5
        timeStat(:, 1), accStat(:, 3), 'b', ...   % plot car 10
        timeStat(:, 1), accStat(:, 4), 'c', ...   %plot car 15
        timeStat(:, 1), accStat(:, 5), 'm');     %plot car 20
    xlabel('Time(s)'); %label x-axis
    ylabel('Acceleration (m/s^2)'); %label y-axis
    ylim([-3 3]); %set y axis limits
    legend('Car 1','Car 5','Car 10','Car 15','Car 20');  %add legend
    title('Acceleration of Vehicles Over Time'); %add title

end
