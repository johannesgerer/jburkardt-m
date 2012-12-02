function y = testderivatives(varargin)
% TESTDERIVATIVES   Derivatives of test functions of A. Genz
%    Y = TESTDERIVATIVES(X1, X2, ..., XD, DXDIR, TYPE, C, W) 
%    Evaluates the derivatives of the test function TYPE at the 
%    point (X1,...,XN) with respect to X_DXDIR. C and W are arrays 
%    of constants defining the test function (see below). The
%    test functions are defined according to A. Genz: A package
%    for testing multiple integration subroutines, in Numerical
%    Integration, P. Keast and G. Fairweather (Eds.), D. Riedel,
%    pp. 337-340, 1987. The functions are defined on [0 1]^d.
%
% Notes:
%    For the continuous test function (no. 5), the left-sided 
%    derivatives are computed at the points where the function 
%    is not continuously differentiable.
%
%    For the discontinuous test function, the derivatives are 
%    also discontinuous with the same piecewise continuous
%    pattern.
%
% Examples:
%    testderivatives(0.5, 0.5, 1, 2, [2, 5.25], [0.2, 0.7])
%
%    See also TESTFUNCTIONS. 
 
% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.0
% Date   : July 11, 2006

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

dxdir = varargin{end-3};
type = varargin{end-2};
c = varargin{end-1};
w = varargin{end};
	
if isa(type, 'char')
	fnames = {'oscillatory', 'product peak', 'corner peak', 'gaussian', ...
						'continuous', 'discontinuous'};	
	for k = 1:length(fnames)
		if strcmp(fnames{k},type)
			type = k;
			break
		end
	end
end

d = length(c);

switch type
 case 1  % oscillatory
	temp = 2*pi*w(1);
	for i = 1:d
		temp = temp + c(i).*varargin{i};
	end
	y = - c(dxdir) .* sin(temp);
 
 case 2  % product peak
	temp = 1;
	for i = 1:d
		temp = temp .* (c(i)^(-2)+(varargin{i}-w(i)).^2);
	end
	y = 1./temp .* (-2) .* (varargin{dxdir}-w(dxdir)) ./ ...
	    (c(dxdir)^(-2)+(varargin{dxdir}-w(dxdir)).^2);
	
 case 3  % corner peak
	temp = 1;
	for i = 1:d
		temp = temp + c(i).*varargin{i};
	end
	y = - (d+1) .* temp .^ (-(d+2)) .* c(dxdir);
	
 case 4  % gaussian
	temp = 0;
	for i = 1:d
		temp = temp + c(i)^2 .* (varargin{i} - w(i)).^2;
	end
	y = exp(-temp) .* c(dxdir).^2 .* (-2) .* ...
	    (varargin{dxdir} - w(dxdir));
	
 case 5  % continuous
	temp = 0;
	for i = 1:d
		temp = temp + c(i) .* abs(varargin{i} - w(i));
	end
	y = exp(-temp) .* ...
	    (c(dxdir) .* (varargin{dxdir} - w(dxdir) <= 0) - ...
	     c(dxdir) .* (varargin{dxdir} - w(dxdir) > 0));
	
 case 6  % discontinuous
	temp = 0;
	if d >= 2
		mask = varargin{1} > w(1) | varargin{2} > w(2);
	else
		mask = varargin{1} > w(1);
	end
	for i = 1:d
		temp = temp + (c(i) .* varargin{i});
	end
	y = c(dxdir) .* exp(temp) .* (~mask);
end
