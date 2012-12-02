function output = systolicLyricsFilter(filename)

% SYSTOLICLYRICSFILTER Implements systolic version of lyrics filter
%
%   This function is to be used as the task for a parallel job.  Input the
%   filename containing the music file.  The output will be the filtered
%   music.

%
%  Chose a frame size and calculate number of frames
%
  framesize = 16384;
  totalsize = wavread(filename, 'size');
  numframes = fix(totalsize(1)/framesize);
  leftover  = rem(totalsize(1), framesize);
%
% Increment the number of frames if there is a leftover piece
%
  if leftover > 0
    numframes = numframes + 1;
  end
%
%  Divide up the work among the labs
%
switch labindex
    
    case 1

        % Initialize the end value
        endvalue = 0;
        
        % Iterate through the frames
        for index = 1:numframes
        
            % Increment the start and end values
            startvalue = endvalue + 1;
            if index == numframes            
                endvalue = endvalue + leftover;
            else
                endvalue = endvalue + framesize;
            end
            
            % Read in just the current frame from the audio file
            y = wavread(filename, [startvalue endvalue]);
            
            % Find the difference and average of the two channels
            frame_chandiff = diff(y, 1, 2);
            frame_chansum = mean(y, 2);

            % Send the processed frame on to lab 2
            labSend(frame_chandiff, 3);
            labSend(frame_chansum, 2);
            
        end        

        % No output from first lab
        output = [];
        
    case 2
        
        % Load the parameters for the bass filter
        load bass_filter;
        
        % Iterate over the frames
        for index = 1:numframes

            % Get the frame from lab 1
            frame_chansum  = labReceive(1);

            % Filter out the bass
            frame_bass = filterSimple(frame_chansum, sosMatrix, scaleValues);

            % Send signals to lab 3
            labSend(frame_bass, 3);
        
        end
            
        % No output from second lab
        output = [];
        
    case 3
        
        % Preallocate enough space for entire vector
        output = zeros(totalsize(1), 1);
        
        % Initialize the end value
        endvalue = 0;
        
        for index = 1:numframes
            
            % Receive frames from lab 2
            frame_bass = labReceive(2);
            frame_chandiff = labReceive(1);

            % Increment the start and end values
            startvalue = endvalue + 1;
            endvalue = endvalue + numel(frame_chandiff);
            
            % Put the signal together again
            output(startvalue:endvalue) = frame_bass + frame_chandiff;
            
        end
        
end
