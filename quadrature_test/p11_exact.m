function value = p11_exact ( dim_num )

%*****************************************************************************80
%
%% P11_EXACT returns the exact integral for problem 11.
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
  value = ( exp ( 1.0 ) - 1.0 )^dim_num;

  return
end
