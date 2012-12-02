function timespvals(options, n, d)
% TIMESPVALS   Measure the performance of SPVALS
%    TIMESPVALS(OPTIONS)  Script file to test the performance of the
%    sparse grid interpolation routine SPVALS by measuring the
%    required time to compute the hierarchical surpluses. By default,
%    the Clenshaw-Curtis grid is used. Other grid types can be
%    selected using the SPSET method. 
%    
%    TIMESPVALS(OPTIONS, D)  argument D contains the dimension that
%    the performance should be measured and graphed for, N
%
% Note: This demo takes a couple of minutes to run.
%
%    See also SPSET, SPVALS, TESTFUNCTIONS.

% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.6
% Date   : May 31, 2006

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

if nargin < 1, options = []; end
if nargin < 2, n = []; d = []; end

sparseIndices = spget(options, 'SparseIndices', 'auto');
gridtype = spget(options, 'GridType', 'Clenshaw-Curtis');
enableDCT = spget(options, 'EnableDCT', 'on');

plotasymptotic = 0;

% Set the problem dimensions and the maximum discretization levels
% for each dimension.
switch lower(gridtype)
 case 'clenshaw-curtis'
  if isempty(d)
    d = [1,2,4,8,16];
    n = [17,13,10,6,4];
  end
  if strcmpi(sparseIndices, 'off')
    plotasymptotic = 1;
  end
 case 'noboundary'
  if isempty(d)
    d = [1,2,4,8,16];
    n = [15,11,8,5,4];
  end
 case 'maximum'
	if isempty(d)
    d = [1,2,4,8];
    n = [16,12,7,2];
  end
 case 'chebyshev'
  if isempty(d)
    d = [1,2,4,8,16];
    if strcmpi(enableFFT, 'on')
      n = [17,13,10,6,4];
    else
      n = [15,13,10,6,4];
    end
  end
 otherwise
	error('Unknown grid type.');
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

time = NaN*ones(ndims,n(1)+1);
npoints = zeros(ndims,n(1)+1);

for m = 1:ndims
	disp(['Current dim: ' num2str(d(m))]);
	z = [];
	for l = 0:n(m)
		disp(['Current level n = ' num2str(l) '...']);
		options = spset('MinDepth',l,'MaxDepth',l,'Vectorized','on', ...
										'GridType', gridtype, 'EnableDCT', enableDCT, ...
										'SparseIndices', sparseIndices, 'PrevResults', z);
		z = spvals('testfunctions',d(m),[],options,1,c(1:d(m)),w(1: ...
																									d(m)));
		t = z.surplusCompTime;
		disp(['Computing sparse grid points and evaluating function took ' ...
					num2str(z.fevalTime) ' [s].']);
		time(m,l+1) = t;
		disp(['Computing hierarchical surpluses took ' num2str(t) ' [s].']);
		disp(' ');
		npoints(m,l+1) = z.nPoints;
	end
end

% Plot results
h = loglog(npoints(:,2:end)', time(:,2:end)', 'LineWidth', 1);
axis tight;
for k = 1:ndims
	set(h(k), 'Marker', markers(k));
	hold on;
end
axis manual;

% Plot assymtotic curves for two cases
if plotasymptotic
	for nd = [1 ndims]
		asymptotic = zeros(n(nd),1);
		for k = 0:n(nd)
			levelseq = double(spgetseq(k,d(nd))');
			seqpoints = prod((levelseq <= 1) .* 2.^levelseq + ...
											 (levelseq > 1) .* 2.^(levelseq-1));
			
			asymptotic(k+1) = sum((prod(levelseq+1)-1).*seqpoints)*min(n(nd),d(nd));
			if k > 0
				asymptotic(k+1) = asymptotic(k+1) + asymptotic(k);
			end
		end
		const = 1./asymptotic(end).*time(nd,n(nd)+1);
		plot(npoints(nd,1:n(nd)+1),asymptotic.*const,'k--'); 
	end
end

% Add legend and axis labels
hold off;
title(['Time to compute hierarchical surpluses for ' gridtype ' grid']);
ylabel('time [s]');
xlabel('number of nodes N');
s = {};
for k = 1:ndims
  s{k} = ['d = ' num2str(d(k))];
end

if plotasymptotic
	s{ndims+1} = 'asymptotic';
end
legend(s,2);
