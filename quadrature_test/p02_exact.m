function value = p02_exact ( dim_num )

%*****************************************************************************80
%
%% P02_EXACT returns the exact integral for problem 02.
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
  value = ( dim_num * ( 5 * dim_num - 2 ) ) / 15.0;

  return
end
