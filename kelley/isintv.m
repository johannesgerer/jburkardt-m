function u = isintv ( z )

% inverse sine transform, assume that size(z)=[nx,ny]=[2^k-1,ny]
% 
% C. T. Kelley, May 1994
%
%  Disclaimer:
%
%    This code comes with no guarantee or warranty of any kind.
%
%  Author:
%
%    Tim Kelley
%
%  Reference:
%
%    Tim Kelley,
%    Iterative Methods for Linear and Nonlinear Equations,
%    SIAM, 2004,
%    ISBN: 0898713528,
%    LC: QA297.8.K45.
%
  [ nx, ny ] = size ( z );

  ww = ifft([zeros(ny,1), z']',2*nx+2);

  u = imag(ww(2:nx+1,:));
