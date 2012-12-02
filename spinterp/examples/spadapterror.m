function spadapterror
% SPADAPTERROR  Compare regular and dimension-adaptive interpolation
%    Compares the dimension-adaptive interpolation scheme to the 
%    non-adaptive one some simple test functions, for the Clenshaw-
%    Curtis and the Chebyshev-Gauss-Lobatto grid.

% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.0
% Date   : March 16, 2005

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

% Objective function f
f = {inline('exp(-x.^2-0.01*y.^2)','x','y'), ...
		 inline('exp(-x.^2-0.0001*y.^2)','x','y'), ...
		 inline('exp(-x.^2)+exp(-y.^2)', 'x', 'y')};

f_str = {'exp(-x^2-0.01y^2)', ... 
				 'exp(-x^2-0.0001y^2)', ...
				 'exp(-x^2)+exp(-y^2)'};

% Define objective range
range = [0 1; 0 1];

% Problem dimension
d = 2;

gridtypes = { 'Clenshaw-Curtis', 'Chebyshev' };

maxpoints = [1000, 100];

r = [1e-1, 1e-2, 1e-4];
circle = [3 5 8;
					3 4 5];

% Turn anticipated warnings off
warning('off', 'MATLAB:spinterp:insufficientDepth');
warning('off', 'MATLAB:spinterp:maxPointsReached');

for typeid = 1:2
	gridtype = gridtypes{typeid};
	
	for rid = 1:3
		subplot(2,3,rid+(typeid-1)*3);

		% Set options: Switch vectorized processing on.
		options = spset('Vectorized', 'on','RelTol', 1e-8, ...
										'GridType', gridtype, ...
										'DimensionAdaptive', 'off');
		
		% Perform regular sparse grid computation
		np = 1;
		nsteps = 0;
		while np < maxpoints(typeid)
			nsteps = nsteps + 1;
			np = spdim(nsteps, d, options);
		end
		
		N(1:2) = {rand(100,1)};
	
		e = zeros(nsteps,1);
		w = zeros(nsteps,1);
		np = zeros(nsteps,1);
		
		z = [];
		for n = 1:nsteps
			options = spset(options, 'MinDepth', n, 'MaxDepth', n, ...
											'PrevResults', z);
			z = spvals(f{rid}, d, range, options);
			e(n) = max(abs(spinterp(z, N{:}) - f{rid}(N{:})));
			w(n) = z.estAbsError;
			np(n) = z.nPoints;
		end
		loglog(np, e, 'k+--', 'LineWidth', 1);
		
		% Perform dimension-adaptive sparse grid computation
		
		% Set options: Switch vectorized processing on.
		options = spset('Vectorized', 'on','RelTol', 1e-8, ...
										'GridType', gridtype, ...
										'DimensionAdaptive', 'on', ...
										'DimadaptDegree', 1);
		
		nsteps = 22;
		npoints = 2*d;
		
		e = zeros(nsteps,1);
		w = zeros(nsteps,1);
		np = zeros(nsteps,1);
	
		z = [];
		
		k = 1;
		while (npoints < maxpoints(typeid))
			options = spset(options, 'MinPoints', npoints+1, 'Maxpoints', ...
											npoints, 'PrevResults', z);
			
			z = spvals(f{rid}, d, range, options);
			npoints = z.nPoints + 1;
			e(k) = max(abs(spinterp(z, N{:}) - f{rid}(N{:})));
			w(k) = z.estAbsError;
			np(k) = z.nPoints;
			k = k + 1;
		end
		
		hold on;
		loglog(np, w, 'k-.');
		if (typeid == 1)
			loglog(np, e, 'rs-', 'LineWidth', 1);
		else
			loglog(np, e, 'bs-', 'LineWidth', 1);
			set(gca,'YTick',...
							fliplr([1e0,1e-4,1e-8,1e-12,1e-16]));
			set(gca,'YLim',[1e-16,1e0]);
		end
		set(gca,'XLim',[1 maxpoints(typeid)]);
		title(f_str{rid});
		xlabel('N');
		if rid == 1
			ylabel([gridtypes{typeid} ' grid']);
			legend('e_{reg}', '\eta', 'e_{adapt}', 3);
			legend boxoff;
		end
		hold off;
	end
end

warning('on', 'MATLAB:spinterp:insufficientDepth');
warning('on', 'MATLAB:spinterp:maxPointsReached');
