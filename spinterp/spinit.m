function spinit
% SPINIT   Add the sparse grid routines directories to Matlab path

% Author : Andreas Klimke, Universitaet Stuttgart
% Date   : October 8, 2007
% Version: 1.6

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

try
	disp('------------------------------------------------------------------------------');
	disp('Sparse Grid Interpolation Toolbox');
	disp('------------------------------------------------------------------------------');
	disp('Version 5.1.1');
	disp('(c) 2006 W. Andreas Klimke, Universitaet Stuttgart.');
	disp('(c) 2007-2008 W. A. Klimke. All Rights Reserved.');
	disp('Please see LICENSE.txt for license information.');
	disp('------------------------------------------------------------------------------');
	fullpath = mfilename('fullpath');
	pathstr = fileparts(fullpath);
	disp('Adding sparse grid routines directory to Matlab search path.');
	addpath(pathstr);
	disp('Adding examples directory to Matlab search path.');
	demopath = [pathstr filesep 'examples'];
	addpath(demopath);
	disp('------------------------------------------------------------------------------');
	disp(['Type >>help spinterp<< or >>help spvals<< for brief usage' ...
				' information.']);
  disp(['Type >>doc spinterptool<< to open the documentation in the' ...
        ' help browser.']);
	disp(['Type >>demo toolbox ''Sparse Grid Interpolation''<< to' ...
	      ' select demo files.']);
	disp(' ');
catch
	disp('Initialization failed. The following error occurred:');
	rethrow(lasterror);
end
