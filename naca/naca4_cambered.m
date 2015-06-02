function [ xu, yu, xl, yl ] = naca4_cambered ( m, p, t, c, xc )

%*****************************************************************************80
%
%% NACA4_CAMBERED: (xu,yu), (xl,yl) for a NACA cambered 4-digit airfoil.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Eastman Jacobs, Kenneth Ward, Robert Pinkerton,
%    "The characteristics of 78 related airfoil sections from tests in
%    the variable-density wind tunnel",
%    NACA Report 460, 1933.
%
%  Parameters:
%
%    Input, real M, the maximum camber.
%    0 < M.
%
%    Input, real P, the location of maximum camber.
%    0.0 < P < 1.0
%
%    Input, real T, the maximum relative thickness.
%    0.0 < T <= 1.0
%
%    Input, real C, the chord length.
%    0.0 < C.
%
%    Input, real XC(*), points along the chord length.  
%    0.0 <= XC(*) <= C.
%
%    Output, real XU(*), YU(*), XL(*), YL(*), for each value of XC, measured
%    along the camber line, the corresponding values (XU,YU) on the upper
%    airfoil surface and (XL,YL) on the lower airfoil surface.
%
  i = find ( 0.0 <= xc / c & xc / c <= p   );
  j = find ( p   <= xc / c & xc / c <= 1.0 );
  k = find ( xc / c < 0.0 | 1.0 < xc / c );

  divisor(i) =         p  ^2;
  divisor(j) = ( 1.0 - p )^2;
  divisor(k) = 1.0;

  dycdx = 2.0 * m * ( p - xc / c ) / divisor;

  theta = atan ( dycdx );
   
  yt = 5.0 * t * c * ( ...
     0.2969 * sqrt ( xc / c ) ...
     + (((( ...
       - 0.1015 ) .* ( xc / c ) ...
       + 0.2843 ) .* ( xc / c ) ...
       - 0.3516 ) .* ( xc / c ) ...
       - 0.1260 ) .* ( xc / c ) );

  yc(i) = m * ( xc(i)     ) .* ( 2.0 * p - xc(i) / c       ) /         p  ^2;
  yc(j) = m * ( xc(j) - c ) .* ( 2.0 * p - xc(j) / c - 1.0 ) / ( 1.0 - p )^2;
  yc(k) = 0.0;

  xu = xc - yt * sin ( theta );
  yu = yc + yt * cos ( theta );
  xl = xc + yt * sin ( theta );
  yl = yc - yt * cos ( theta );

  return
end


