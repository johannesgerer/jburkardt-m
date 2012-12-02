function init
% INIT   Add the sparse grid directories to the Matlab path. 

% Author : Andreas Klimke, Universität Stuttgart
% Date   : December 22, 2005
% Version: 1.4

try
	disp('-----------------------------------------------');
	disp('Multilinear sparse grid interpolation routines');
	disp('-----------------------------------------------');
	disp('Version 2.1.2');
	disp('(c) 2005 Andreas Klimke, Universität Stuttgart');
	disp('Please see LICENSE.txt for license information.');
	disp('-----------------------------------------------');
	disp(' ');
	fullpath = mfilename('fullpath');
	[pathstr, name, ext, ver] = fileparts(fullpath);
	disp(['Adding sparse grid routines directory to Matlab search path.']);
	addpath(pathstr);
	disp(['Adding examples directory to Matlab search path.']);
	demopath = [pathstr filesep 'examples'];
	addpath(demopath);
	disp('Done!');
	disp(' ');
	disp(['Type ''help spinterp'' and ''help spvals'' for usage' ...
				' information.']);
	disp(' ');
	disp('The following DEMOS are available:');
	disp('     cmpgrids: Plots the three available sparse grid types.');
	disp(['       spdemo: Simple demonstration of interpolating a' ...
				' two-variate function.']);
	disp([' spdemovarout: Interpolates a function with multiple' ...
				' outputs.']);
	disp(['    spcompare: Compares error plots for the test functions' ...
				' of Gerz.']);
	disp(['   timespvals: Plots computing times for the hierarchical' ...
				' surpluses (CC-grid).']);
	disp([' timespinterp: Plots computing times for 1000 interpolated' ...
				' values.']);
	disp(' ');
catch
	disp('Initialization failed. The following error occurred:');
	rethrow(lasterror);
end
