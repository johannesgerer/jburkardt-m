function x = quad_rst ( r, s, t, i )

%*****************************************************************************80
%
%% QUAD_RST evaluates a function of (R,S,T) used for some tests.
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
%    Input, real R, S, T, the (local) coordinates of a point.
%
%    Input, integer I, the component of X to be returned.
%
%    Output, real X, the value of the I-th component of X at the point whose
%    local coordinates are (R,S,T).
%
  x = 18.0 * ( r * r + s + t );

  return
end
