function colorSegmentationSol ( config_name )

%
%  Create a replicated array of colors 
%
  colors = {'red', 'yellow', 'green', 'magenta'};
%
%  Read the image into a replicated array
%
  image = imread('fabric.png');
%
%  Set up the matlabpool
%
if matlabpool('size') > 0; matlabpool('close'); end
%
% there are four colors, each lab filters one 
%
if nargin < 1 || ~strcmp(config_name, 'ithaca');
    matlabpool('open', 'local', 4);
else
    matlabpool('open', 'ithaca_2009b', 4, ...
          'FileDependencies', {'colorSegmentationSol.m', 'colorFilter.m'});
end

%
%  Each lab filters a different color,
%  and writes the filtered result to a JPEG file.
%
  spmd
    
    filteredImage = colorFilter(image, colors{labindex});

    imwrite(filteredImage, ['fab' num2str(labindex) '.jpg']);
    
  end

  return
end

