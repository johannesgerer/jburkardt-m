function value = p09_exact ( dim_num )

%*****************************************************************************80
%
%% P09_EXACT returns the exact integral for problem 09.
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
  c = [];
  c = p09_r8vec ( 'G', 'C', dim_num, c );

  value = prod ( ( exp ( c(1:dim_num) ) - 1.0 ) ./ c(1:dim_num) );

  return
end
