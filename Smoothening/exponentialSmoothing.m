function smoothedPosition=exponentialSmoothing(positionData,timeInterval,smoothingTime,startTime,endTime)

    % exponential smoothing of position data over a specified time range
    
    %Input :
    % positionData:
    
    
    
    %output
    
    %smoothedPosition - smoothed position data
    % compute the smoothing width in number of time steps
    smoothingWidth=smoothingTime/timeInterval;
    numDataPoints=numel(positionData);

    %preallocate output for efficiency
    smoothedPosition = zeros(size(positionData));

    % define the smoothing window size (3*smoothingWidth for full smoothing)
    fullWindowWidth=ceil(3*smoothingWidth);

    % loop through the data range
    for counter =(startTime+1):(endTime-1)
        % determine the actual window size based on data bounderies
        if counter<=fullWindowWidth
            smoothingWindowWidth=counter-1;   % near start boundary
        elseif counter >= (endTime-fullWindowWidth+1)
            smoothingWindowWidth=endTime-counter;   % near end boundary
        else
            smoothingWindowWidth=fullWindowWidth;    % regular case
        end

        % define the range of indices for smoothing
        startIdx=max(1,counter-smoothingWindowWidth);
        endIdx=min(numDataPoints,counter+smoothingWindowWidth);
        indices=startIdx:endIdx;

        %compute the exponential smoothing kernel
        kernelFunction=exp(-abs(indices-counter)/smoothingWidth);

        % compute the weighted sum for smoothing
        smoothedPosition(counter)=sum(kernelFunction.*positionData(indices)')/sum(kernelFunction);

    end

end
