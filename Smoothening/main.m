clear;
clc;

%-----------------load traffic data ----------------------
trafficData = 'leader_follower.xlsx';     % input file
rawData = xlsread(trafficData);        % read data as table

deltat = 0.1;                 % time step for numerical differentiation
smoothTime = 0.7;              %smoothing parameter

% Define leader and follower indices
startLeader = 1;
endLeader = size(rawData,1);                 % last row index for leader data
startFollower = 1;
endFollower = find(isnan(rawData(:,3)),1) -1;       % last valid row index for follower data
if isempty(endFollower)
    endFollower = endLeader;
end



leaderPosition = rawData(:,2);
speedLeader =  (leaderPosition(3:end) - leaderPosition(1:end-2))/(2*deltat);
accLeader = (leaderPosition(3:end) - 2*leaderPosition(2:end-1) + leaderPosition(1:end-2) )/(deltat^2);
timeLeader = rawData(2:end-1,1);
trajectoryLeader = [timeLeader(1:end),leaderPosition(2:end-1),speedLeader,accLeader];




%calculate smoothed leader position
leaderPosition = exponentialSmoothing(rawData(startLeader:endLeader,2),deltat,smoothTime,startLeader,endLeader);
leaderPosition = leaderPosition(2:end-1);
smoothedSpeedLeader =  (leaderPosition(3:end) - leaderPosition(1:end-2))/(2*deltat);
smoothedAccLeader = (leaderPosition(3:end) - 2*leaderPosition(2:end-1) + leaderPosition(1:end-2) )/(deltat^2);
smoothedTrajectoryLeader = [timeLeader(2:end-1),leaderPosition(2:end-1),smoothedSpeedLeader(1:end),smoothedAccLeader(1:end)];



followerPosition = rawData(startFollower:endFollower,4);
speedFollower =  (followerPosition(3:end) - followerPosition(1:end-2))/(2*deltat);
accFollower = (followerPosition(3:end) - 2*followerPosition(2:end-1) + followerPosition(1:end-2) )/(deltat^2);
timeFollower = rawData(2:endFollower-1,3);
trajectoryFollower = [timeFollower(1:end), followerPosition(2:endFollower-1), speedFollower, accFollower];



followerPosition = exponentialSmoothing(rawData(startFollower:endFollower,4),deltat,smoothTime,startFollower,endFollower);
followerPosition = followerPosition(2:end-1);
smoothedSpeedFollower =  (followerPosition(3:end) - followerPosition(1:end-2))/(2*deltat);
smoothedAccFollower = (followerPosition(3:end) - 2*followerPosition(2:end-1) + followerPosition(1:end-2) )/(deltat^2);
smoothedTrajectoryFollower = [timeFollower(2:end-1),followerPosition(2:end-1),smoothedSpeedFollower(1:end),smoothedAccFollower(1:end)];



figure(1);
hold on;
plot(trajectoryLeader(:,1),trajectoryLeader(:,2),'DisplayName','Raw data');
plot(smoothedTrajectoryLeader(:,1),smoothedTrajectoryLeader(:,2),'DisplayName','smoothed data');
title("Position");
legend();
xlabel('time(s)');
ylabel('position(m)');
hold off;


figure(2);
hold on;
plot(trajectoryLeader(:,1),trajectoryLeader(:,3),'DisplayName','Raw data');
plot(smoothedTrajectoryLeader(:,1),smoothedTrajectoryLeader(:,3),'DisplayName','smoothed data');
title("Speed");
legend();
xlabel('time(s)');
ylabel('Speed(m/s)');
hold off;

figure(3);
hold on;
plot(trajectoryLeader(:,1),trajectoryLeader(:,4),'DisplayName','Raw data');
plot(smoothedTrajectoryLeader(:,1),smoothedTrajectoryLeader(:,4),'DisplayName','smoothed data');
title("Acceleration");
legend();
xlabel('time(s)');
ylabel('Acc(m/sec^2)');
hold off;







