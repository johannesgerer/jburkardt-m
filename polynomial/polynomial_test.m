function polynomial_test ( )

%*****************************************************************************80
%
%% POLYNOMIAL_TEST tests the POLYNOMIAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYNOMIAL_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the POLYNOMIAL library.\n' );

  polynomial_add_test ( );
  polynomial_axpy_test ( );
  polynomial_compress_test ( );
  polynomial_dif_test ( );
  polynomial_mul_test ( );
  polynomial_print_test ( );
  polynomial_scale_test ( );
  polynomial_sort_test ( );
  polynomial_value_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYNOMIAL_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

