function y = testfunctions(varargin)
% TESTFUNCTIONS   Integration test functions of A. Genz
%    Y = TESTFUNCTIONS(X1, X2, ..., XD, TYPE, C, W) Evaluates test
%    function TYPE at the point (X1,...,XN). C and W are arrays of
%    constants defining the test function (see below). The test
%    functions are defined according to A. Genz: A package for
%    testing multiple integration subroutines, in Numerical
%    Integration, P. Keast and G. Fairweather (Eds.), D. Riedel,
%    pp. 337-340, 1987. The functions are defined on [0 1]^d.
%
% TYPE = 'oscillatory'   | TYPE = 1:
% f(x) = cos(2*pi*w_1 + sum_{i=1}^d ( c_i * x_i ) )
%
% TYPE = 'product peak'  | TYPE = 2:
% f(x) = prod_{i=1}^d ( c_i^{-2} + (x_i - w_i)^2 )^{-1}
%
% TYPE = 'corner peak'   | TYPE = 3:
% f(x) = ( 1 + sum_{i=1}^d (c_i * x_i) )^(-(d+1))
%
% TYPE = 'gaussian'      | TYPE = 4:
% f(x) = exp( - sum_{i=1}^d c_i^2 * (x_i - w_i)^2 )
%
% TYPE = 'continuous'    | TYPE = 5:
% f(x) = exp( - sum_{i=1}^d c_i * abs(x_i - w_i) )
%
% TYPE = 'discontinuous' | TYPE = 6:
% f(x) = { 0                            , if x_1>w_1 or x_2>w_2,
%        { exp( sum_{i=1}^d c_i * x_i ) , otherwise
%
% With the parameters c = (c_1, ..., c_d) and w = (w_1, ..., w_d).
% d denotes the dimension of the function.
%
% Examples:
%    testfunctions(0.5, 0.5, 'product peak', [2, 5.25], [0.2, 0.7])
%    testfunctions(0.5, 0.5, 2, [2, 5.25], [0.2, 0.7])
%
%    x = linspace(0,1,20);
%    [X,Y] = meshgrid(x,x);
%    surf(X,Y, ...
%      testfunctions(X, Y, 'product peak', [2, 5.25], [0.2 0.7]));
 
% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.0
% Date   : August 2, 2003

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

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
	y = cos(temp);
 
 case 2  % product peak
	temp = 1;
	for i = 1:d
		temp = temp .* (c(i)^(-2)+(varargin{i}-w(i)).^2);
	end
	y = 1./temp;
	
 case 3  % corner peak
	temp = 1;
	for i = 1:d
		temp = temp + c(i).*varargin{i};
	end
	y = temp .^ (-(d+1));
	
 case 4  % gaussian
	temp = 0;
	for i = 1:d
		temp = temp + c(i)^2 .* (varargin{i} - w(i)).^2;
	end
	y = exp(-temp);
	
 case 5  % continuous
	temp = 0;
	for i = 1:d
		temp = temp + c(i) .* abs(varargin{i} - w(i));
	end
	y = exp(-temp);
	
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
	y = exp(temp) .* (~mask);
end
