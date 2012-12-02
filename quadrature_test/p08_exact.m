function value = p08_exact ( dim_num )

%*****************************************************************************80
%
%% P08_EXACT returns the exact integral for problem 08.
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
  value = 0.5 - sqrt ( 2.0^( 3 * dim_num ) ) * cos ( 0.25 * pi * dim_num ) ...
    / ( 2.0 * pi^dim_num );

  return
end
