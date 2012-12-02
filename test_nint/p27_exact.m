function value = p27_exact ( dim_num )

%*****************************************************************************80
%
%% P27_EXACT returns the exact integral for problem 27.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Output, real VALUE, the exact value of the integral.
%
  r = 0.0;
  r = p27_r8 ( 'G', 'R', r );

  c = [];
  c = p27_r8vec ( 'G', 'C', dim_num, c );

  value = 2.0^dim_num * ...
    cos ( 2.0 * pi * r + 0.5 * sum ( c(1:dim_num) ) ) * ...
    prod ( sin ( 0.5 * c(1:dim_num) ) ./ c(1:dim_num ) );

  return
end
