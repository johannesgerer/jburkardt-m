function [ a, b ] = p22_lim ( dim_num )

%*****************************************************************************80
%
%% P22_LIM returns the integration limits for problem 22.
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
  r = 0.0;
  r = p22_r8 ( 'G', 'R', r );

  a(1:dim_num) = -r;
  b(1:dim_num) =  r;

  return
end
