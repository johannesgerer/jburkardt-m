function timespderiv(options, flags)
% TIMESPDERIV   Measure the performance of SPINTERP with derivatives
%    TIMESPDERIV(OPTIONS)  Script file to plot a graph showing the 
%    ratio of computing BOTH interpolated values AND gradients to 
%    computing interpolated values ONLY (at 100 points simultaneously). 
%    By default, the Clenshaw-Curtis-grid with sparse indices data is 
%    used. Alternatively, the Chebyshev grid and other options
%    may be selected using an OPTIONS structure created with SPSET.
%
%    TIMESPDERIV(OPTIONS, FLAGS)  FLAGS is an optional struct that 
%    customizes the plots.
%    The following FLAGS are available:
%       continuousDerivatives [ 'on' | 'off' ]  turns on the augmented
%         continuous derivatives available for the Clenshaw-Curtis 
%         sparse grid.
%       absoluteTime [ 'on' | 'off' ]  plots the absolute measured
%         time in seconds instead of the ratio.
%       nPoints [ integer {100} ]  can be used to change the default
%         number of interpolated points.
%
%  Examples:
%    Plot ratios for CC-Grid, discontinuous derivatives:
%       timespderiv;
%
%    Plot ratios for CC-Grid, augmented continuous derivatives:
%       flags = struct('continuousDerivatives', 'on');
%       timespderiv([], flags);
%
%    Plot ratios for CGL-Grid:
%       timespderiv(spset('GridType','Chebyshev')); 
%
%    Plot absolute time measurements for CGL-Grid:
%       flags = struct('absoluteTime', 'on');
%       timespderiv(spset('GridType','Chebyshev'), flags); 
% 
%    See also SPSET, SPINTERP, TESTFUNCTIONS.  

% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.0
% Date   : July 8, 2006

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

if nargin < 1, options = []; end
if nargin < 2, flags = []; end

continuousDerivatives = 0;
if isfield(flags, 'continuousDerivatives')
	if strcmpi(flags.continuousDerivatives, 'on')
		continuousDerivatives = 1;
	end
end

absoluteTime = 0;
if isfield(flags, 'absoluteTime')
	if strcmpi(flags.absoluteTime, 'on')
		absoluteTime = 1;
	end
end

% Number of points to interpolate
nsamplepoints = 100;
if isfield(flags, 'nPoints')
	nsamplepoints = flags.nPoints;
end

sparseIndices = spget(options, 'SparseIndices', 'auto');
gridtype = spget(options, 'GridType', 'Clenshaw-Curtis');

% Set the problem dimensions and the maximum discretization levels
% for each dimension.
switch lower(gridtype)
 case 'clenshaw-curtis'
	d = [1,2,4,8,16];
  n = [17,13,10,6,4];
 case 'noboundary'
	error('MATLAB:timespderiv:badopt',['Computing derivatives not ' ...
	      'supported for grid type ''' gridtype '''.']);
 case 'maximum'
	error('MATLAB:timespderiv:badopt',['Computing derivatives not ' ...
	      'supported for grid type ''' gridtype '''.']);
 case 'chebyshev'
	d = [1,2,4,8,16];
  n = [17,13,10,6,4];
 otherwise
	error('MATLAB:timespderiv:badopt','Unknown grid type.');
end

ndims = length(n);
markers = ['s', '.', 'd', '+', 'o', 'x', '*', 'v', '^'];

%  Compute random constants w and c for Gerz' test functions.
w = rand(d(end),1);
c = rand(d(end),1);
sumc = sum(c,1);
sumw = sum(w,1);
c = 1.5.*c/sumc;
w = w/sumw;

time = zeros(ndims,n(1)+1);
npoints = zeros(ndims,n(1)+1);

for k = 1:d(end)
	v{k} = rand(nsamplepoints,1);
end
	
for m = 1:ndims
	disp(['Current dim: ' num2str(d(m))]);
	z = [];
	for l = 0:n(m)
		disp(['Current level n = ' num2str(l) '...']);
		options = spset('MinDepth',l,'MaxDepth',l,'Vectorized','on',...
										'GridType', gridtype, 'SparseIndices', ...
										sparseIndices, 'PrevResults', z);
		z = spvals('testfunctions',d(m),[],options,1,c(1:d(m)),w(1: ...
																									d(m)));
		t = z.surplusCompTime;
		disp(['Computing sparse grid points and evaluating function took ' ...
					num2str(z.fevalTime) ' [s].']);
		disp(['Computing hierarchical surpluses took ' num2str(t) ' [s].']);
		npoints(m,l+1) = z.nPoints;
		if continuousDerivatives
			z.continuousDerivatives = 'on';
		end
		t = 0; k = 0;
		tic;
		while t < 0.5
			y = spinterp(z,v{1:d(m)});
			t = toc;
			k = k + 1;
		end
		t = t / k;
		t2 = 0; k = 0;
		tic;
		while t2 < 0.5
			[y,dy] = spinterp(z,v{1:d(m)});
			t2 = toc;
			k = k + 1;
		end
		t2 = t2 / k;
		if absoluteTime
			time(m,l+1) = t2;
		else
			time(m,l+1) = t2/t;
		end
		disp([num2str(nsamplepoints) ...
					' evals took ' num2str(t) ' [s], with gradients ' ...
					num2str(t2) ' [s]. Ratio: ' num2str(t2/t)]);
		disp(' ');
	end
	disp('Done!');
	disp(' ');
end

% Plot results
clf;
h = loglog(npoints',time','LineWidth',1);
for k = 1:ndims
	set(h(k), 'Marker', markers(k));
	hold on;
end
axis tight;
hold on;

% Add legend and axis labels
hold off;
if absoluteTime
	if ~continuousDerivatives
		title(['Time to compute ' num2str(nsamplepoints) ...
					' values with gradients [' gridtype ' grid].']);
	else
		title(['Time to compute ' num2str(nsamplepoints) ...
					' vals with CONTINUOUS grads [' gridtype ' grid].']);
	end
	ylabel('Time [s]')
else
	if ~continuousDerivatives
		title(['Ratio of interpolating ' num2str(nsamplepoints) ...
					' values with/without gradients [' gridtype ' grid].']);
	else
		title(['Ratio of interpol. ' num2str(nsamplepoints) ...
					' vals with/without CONTINUOUS grads [' gridtype ' grid].']);
	end
	ylabel('Ratio [-]')
	set(gca,'YTick',[1,2,5,10,20,50]);
	set(gca,'YLim',[0.8,50]);
end
xlabel('number of nodes N')
s = {};
for k = 1:ndims
	s{k} = ['d = ' num2str(d(k))];
end

if strcmpi(gridtype, 'chebyshev')
	legend(s,2);
else
	legend(s,1);
end
