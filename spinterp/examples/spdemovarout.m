function spdemovarout
% SPDEMOVAROUT   Sparse interpolation demo for multiple outputs
%    Sparse grid interpolation demo for a function with multiple 
%    output parameters and non-vectorized processing. In this case, 
%    we use the Maximum-norm-based grid.
	
% Author : Andreas Klimke, Universitaet Stuttgart
% Date   : January 27, 2004
% Version: 1.3
	
% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

% Define problem dimension
d = 2;

% Define number of output parameters of fvarout
nout = 3;

% Get options structure for sparse interpolation
options = spset('NumberOfOutputs', nout, ...
								'GridType', 'Maximum');

% Create full grid for plotting
gs = 33;
[X,Y] = meshgrid(linspace(0,2,gs),linspace(-1,1,gs));

% Compute sparse grid weights over domain [0,2]x[-1,1]
z = spvals(@fvarout, d, [0 2; -1 1], options, nout);

% Compute inpterpolated values at full grid
for k = 1:nout
	z.selectOutput = k;
	ip{k} = spinterp(z, X, Y);
end

% Plot interpolated results
for k = 1:nout
	subplot(1,nout,k);
	mesh(X, Y, ip{k});
	title(['interpolated out',num2str(k)]);
end

%------------------------------------------------------------------
function [varargout] = fvarout(x,y,nout)
% FVARARGOUT    function with multiple output arguments, the number
% of output arguments is determined by the parameter nout. 
	
out = zeros(1,nout);
out(1:nout) = 1./((x-(1:nout)/nout).^2+(y)^2+(1:nout)./nout);
varargout = num2cell(out);
