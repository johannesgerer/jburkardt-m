function value = p04_exact ( dim_num )

%*****************************************************************************80
%
%% P04_EXACT returns the exact integral for problem 04.
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
  value = ( dim_num * ( 7 * ( dim_num - 1 ) * ( 5 * dim_num - 1 ) + 9 ) ) ...
    / 63.0;

  return
end
