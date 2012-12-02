function [ a, b ] = p20_lim ( dim_num )

%*****************************************************************************80
%
%% P20_LIM returns the integration limits for problem 20.
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
%    Input, integer DIM_NUM, the dimension of the argument.
%
%    Output, real A(DIM_NUM), B(DIM_NUM), the lower and upper
%    limits of integration.
%
  aval = 0.0;
  aval = p20_r8 ( 'G', 'A', aval );

  bval = 0.0;
  bval = p20_r8 ( 'G', 'B', bval );

  a(1:dim_num) = aval;
  b(1:dim_num) = bval;

  return
end
