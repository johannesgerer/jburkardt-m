function f_vec = quad_fun ( n, xy_vec )

%*****************************************************************************80
%
%% QUAD_FUN is a sample integrand function for TRIANGULATION_QUAD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real XY_VEC(2,N), the evaluation points.
%
%    Output, real F_VEC(N), the value of the integrand
%    function at the evaluation points.
%
  f_vec(1:n) = exp ( xy_vec(1,1:n).^2 + xy_vec(2,1:n).^2 );

  return
end
