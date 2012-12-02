function x = cubic_rs ( r, s, i )

%*****************************************************************************80
%
%% CUBIC_RS evaluates a function of R and S used for some tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, S, the (local) coordinates of a point.
%
%    Input, integer I, the component of X to be returned.
%
%    Output, real X, the value of the I-th component of X at the point whose
%    local coordinates are (R,S).
%
  x = 20.0 * ( r * r * s * s * s );

  return
end
