function timespinterp(options)
% TIMESPINTERP   Measure the performance of SPINTERP
%    TIMESPINTERP(OPTIONS)  Script file to draw a graph showing
%    the time to compute 1000 interpolated points with SPINTERP. By
%    default, the Clenshaw-Curtis-grid is used. Other grid types
%    can be selected using the SPSET method. 
%
%    See also SPSET, SPINTERP, TESTFUNCTIONS.

% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.1
% Date   : March 15, 2005

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

if nargin < 1, options = []; end

% Number of points to interpolate
nsamplepoints = 1000;

sparseIndices = spget(options, 'SparseIndices', 'auto');
gridtype = spget(options, 'GridType', 'Clenshaw-Curtis');

plotasymptotic = 0;

% Set the problem dimensions and the maximum discretization levels
% for each dimension.
switch lower(gridtype)
 case 'clenshaw-curtis'
	d = [1,2,4,8,16];
  n = [17,13,10,6,4];
	plotasymptotic = 1;
 case 'noboundary'
	d = [1,2,4,8,16];
	n = [15,11,8,5,4];
 case 'maximum'
	d = [1,2,4,8];
	n = [16,12,7,2]
 case 'chebyshev'
	d = [1,2,4,8,16];
	n = [13,12,8,5,4];
	plotasymptotic = 1;
 otherwise
	error('MATLAB:timespinterp:badopt','Unknown grid type.');
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
										'GridType', gridtype,	'SparseIndices', ...
										sparseIndices, 'PrevResults', z);
		z = spvals('testfunctions',d(m),[],options,1,c(1:d(m)),w(1: ...
																									d(m)));
		t = z.surplusCompTime;
		disp(['Computing sparse grid points and evaluating function took ' ...
					num2str(z.fevalTime) ' [s].']);
		time(m,l+1) = t;
		disp(['Computing hierarchical surpluses took ' num2str(t) ' [s].']);
		npoints(m,l+1) = z.nPoints;
		tic;
		y = spinterp(z,v{1:d(m)});
		t = toc;
		time(m,l+1) = t;
		disp(['Performing ' num2str(nsamplepoints) ...
					' evaluations took ' num2str(t) ' [s].']);
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

% Plot assymtotic curves
if plotasymptotic 
	if strcmpi(gridtype, 'Chebyshev')
		for nd = [1 ndims]
			assymptotic = npoints(nd,1:n(nd)+1);
			const = 1./assymptotic(end).*time(nd,n(nd)+1);
			plot(npoints(nd,1:n(nd)+1),assymptotic.*const,'k--'); 
		end
	else
		for nd = 1:ndims
			assymptotic = zeros(n(nd),1);
			for k = 0:n(nd)
				if strcmpi(sparseIndices, 'off')
					assymptotic(k+1) = d(nd).*nchoosek(k+d(nd),d(nd));					
				else
					assymptotic(k+1) = min(k,d(nd)).*nchoosek(k+d(nd),d(nd));
				end
			end
			const = 1./assymptotic(end).*time(nd,n(nd)+1);
			plot(npoints(nd,1:n(nd)+1),assymptotic.*const,'k--'); 
		end
	end
end

% Add legend and axis labels
hold off;
title(['Time to compute ' num2str(nsamplepoints) ...
			 ' interpolated values for ' gridtype ' grid.']);
ylabel('time [s]')
xlabel('number of nodes N')
s = {};
for k = 1:ndims
	s{k} = ['d = ' num2str(d(k))];
end

if plotasymptotic
	s{ndims+1} = 'asymptotic';
end
legend(s,2);
