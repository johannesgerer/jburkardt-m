function y = naca4_symmetric ( t, c, x )

%*****************************************************************************80
%
%% NACA4_SYMMETRIC evaluates y(x) for a NACA symmetric 4-digit airfoil.
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
%    Input, real T, the maximum relative thickness.
%
%    Input, real C, the chord length.
%
%    Input, real X(*), points along the chord length.  
%    0.0 <= X(*) <= C.
%
%    Output, real Y(*), for each value of X, the corresponding value of Y
%    so that (X,Y) is on the upper wing surface, and (X,-Y) is on the
%    lower wing surface.
%
  y = 5.0 * t * c * ( ...
    0.2969 * sqrt ( x / c ) ...
    + (((( ...
      - 0.1015 ) .* ( x / c ) ...
      + 0.2843 ) .* ( x / c ) ...
      - 0.3516 ) .* ( x / c ) ...
      - 0.1260 ) .* ( x / c ) );

  return
end


