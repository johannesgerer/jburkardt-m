function z = spadaptdemo
% SPADAPTDEMO   Simple example of dimension-adaptive interpolation
%    A 2D-example for dimension-adaptive multi-linear sparse grid 
%    interpolation using the Chebyshev grid and vectorized processing
%    of the model function. 
%
%    See also SPINTERP, SPVALS.

% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.1
% Date   : September 29, 2003

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

% The Branin function is used here
f = inline(['(5/pi*x-5.1/(4*pi^2)*x.^2+y-6).^2 + 10*(1-1/(8*pi))*' ...
	    ' cos(x)+10']); 

% Define objective box
range = [-5 10; 0 15];

% Define problem dimension
d = 2;

% Create full grid for plotting
gs = 33;
[X,Y] = meshgrid(linspace(range(1,1),range(1,2),gs),...
								 linspace(range(2,1),range(2,2),gs));

% Set options: Switch vectorized processing on.
options = spset('Vectorized', 'on','RelTol', 1e-2, ...
								'GridType', 'Chebyshev', ...
								'DimensionAdaptive', 'on', ...
								'DimadaptDegree', 1, ...
                'MinPoints', 10);

% Compute sparse grid weights over range
z = spvals(f, d, range, options);

% Compute inpterpolated values at full grid
ip = spinterp(z, X, Y);

% Plot original function, interpolation, and error
subplot(2,2,1);
mesh(X,Y,f(X,Y));
title('original');
axis tight;

subplot(2,2,2);
mesh(X,Y,ip);
title('interpolated');
axis tight;

subplot(2,2,3);
mesh(X,Y,abs(f(X,Y)-ip));
title('absolute error');
axis tight;

subplot(2,2,4);
plotindices(z);
title('resulting index sets');
