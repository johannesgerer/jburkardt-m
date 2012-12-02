function exact = p01_exact ( dim_num )

%*****************************************************************************80
%
%% P01_EXACT returns the exact integral for problem 01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Output, real EXACT, the exact value of the integral.
%
  exact = ( ( dim_num ) * ( 3 * dim_num + 1 ) ) / 12.0;

  return
end
