function [f,g] = spsurfun(y, z)
% SPSURFUN Evaluate the sparse grid interpolant at single point
%    IP = SPSURFUN(Y,Z)  Computes the interpolated value IP at
%    the single point [Y1, ..., YD] for the sparse grid 
%    interpolant Z.
%
%    [IP,IPGRAD] = SPSURFUN(Y,Z)  Computes the interpolated 
%    value IP and the gradient vector IPGRAD.
%
%    Example:
%       f = inline('x.^2 + y.^2 - 2.*z');
%       g1 = inline('2*x + 0*y + 0*z');
%       g2 = inline('2*y + 0*x + 0*z');
%       g3 = inline('-2  + 0*x + 0*y + 0*z');
%       z = spvals(f,3,[],spset('GridType','Chebyshev'));
%       [ip,ipgrad] = spsurfun([0.5, 0.2, 0.2], z)
%       f_exact = f(0.5, 0.2, 0.2)
%       g_exact = [g1(0.5, 0.2, 0.2); ...
%                  g2(0.5, 0.2, 0.2); ...
%                  g3(0.5, 0.2, 0.2)]
%
%    See also SPINTERP, SPVALS. 
%
%    Note:
%       SPSURFUN is provided for conveniece to be used as an
%       alternative to SPINTERP, where the point Y to be
%       evaluated is given as a row or column vector. This
%       functional form is often adopted by multivariate 
%       optimization algorithms (such as fminsearch) in
%       Matlab.
%       Note that this form allows the evaluation of the sparse
%       grid interpolant at a single point only. Therefore, It 
%       is recommended to use SPINTERP instead if multiple 
%       evaluations of the interpolant can be performed
%       simultaneously.
 	
% Author : Andreas Klimke
% Version: 1.0
% Date   : September 8, 2006

% Change log:
% V1.0   : September 8, 2006
%          Initial version

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

if nargout <= 1
  f = spinterp(z, y);
elseif nargout == 2
 [f,g] = spinterp(z, y);
 g = g{1,1};
end
