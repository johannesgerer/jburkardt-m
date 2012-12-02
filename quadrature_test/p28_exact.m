function value = p28_exact ( dim_num )

%*****************************************************************************80
%
%% P28_EXACT returns the exact integral for problem 28.
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
  c = p28_r8vec ( 'G', 'C', dim_num, c );

  z = [];
  z = p28_r8vec ( 'G', 'Z', dim_num, z );

  value = prod ( ...
                 (   atan ( ( 1.0 - z(1:dim_num) ) ./ c(1:dim_num) ) ...
                   + atan (         z(1:dim_num)   ./ c(1:dim_num) ) ...
                 ) ...
                 ./ c(1:dim_num) ...
               );

  return
end
