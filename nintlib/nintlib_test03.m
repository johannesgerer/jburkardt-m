function nintlib_test03 ( dim_num, func )

%*****************************************************************************80
%
%% NINTLIB_TEST03 tests ROMBERG_ND.
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
  it_max = 3;
%
%  Set the integration limits.
%
  a(1:dim_num) = 0.0;
  b(1:dim_num) = 1.0;
 
  tol = 0.001;
 
  sub_num(1:dim_num) = 10;

  [ result, ind, eval_num ] = romberg_nd ( func, a, b, dim_num, ...
    sub_num, it_max, tol );
 
  fprintf ( 1, '  ROMBERG_ND:     %20.12f  %8d\n', result, eval_num );
 
  return
end
