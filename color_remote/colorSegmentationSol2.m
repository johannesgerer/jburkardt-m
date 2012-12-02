function filteredImage=colorSegmentationSol2(config_name)

% Create a replicated array of colors 
colors = {'red', 'yellow', 'green', 'magenta'};

% Read the image into a replicated array
image = imread('fabric.png');

% Set up the matlabpool
if matlabpool('size') > 0; matlabpool('close'); end

% There are four colors, each lab filters one 
if nargin < 1 || ~strcmp(config_name, 'ithaca');
    matlabpool('open', 'local', 4);
else
    matlabpool('open', 'ithaca_2009b', 4, ...
         'FileDependencies', {'colorSegmentationSol2.m', 'colorFilter.m'});
end
spmd
    
    % Each lab will filter a different color
    filteredImage = colorFilter(image, colors{labindex});

    
end

