function nintlib_test06 ( dim_num, func )

%*****************************************************************************80
%
%% NINTLIB_TEST06 tests MONTE_CARLO_ND.
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
  test_num = 3;
  seed = 123456789;
%
%  Set the integration limits.
%
  a(1:dim_num) = 0.0;
  b(1:dim_num) = 1.0;
 
  for test = 1 : test_num

    eval_num = 8^test * 10000;

    [ result, seed ] = monte_carlo_nd ( func, dim_num, a, b, eval_num, seed );
 
    fprintf ( 1, '  MONTE_CARLO_ND: %20.12f  %8d\n', result, eval_num );

  end
 
  return
end
