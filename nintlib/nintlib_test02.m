function nintlib_test02 ( dim_num, func )

%*****************************************************************************80
%
%% NINTLIB_TEST02 tests P5_ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, function FUNC ( DIM_NUM, X ), the name of the function
%    to be integrated.
%

%
%  Set the integration limits.
%
  a(1:dim_num) = 0.0;
  b(1:dim_num) = 1.0;
 
  [ result, eval_num ] = p5_nd ( func, dim_num, a, b );
 
  fprintf ( 1, '  P5_ND:          %20.12f  %8d\n', result, eval_num );
 
  return
end
