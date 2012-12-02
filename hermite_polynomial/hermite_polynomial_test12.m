function hermite_polynomial_test12 ( p, b )

%*****************************************************************************80
%
%% HERMITE_POLYNOMIAL_TEST12 tests HF_EXPONENTIAL_PRODUCT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P, the maximum degree of the polynomial factors.
%
%    Input, real B, the coefficient of X in the exponential factor.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_POLYNOMIAL_TEST12\n' );
  fprintf ( 1, '  Compute a Hermite function exponential product table.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tij = integral ( -oo < X < +oo ) exp(B*X) Hf(I,X) Hf(J,X) dx\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  where Hf(I,X) = Hermite function of "degree" I.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum degree P = %d\n', p );
  fprintf ( 1, '  Exponential argument coefficient B = %f\n', b );

  table = hf_exponential_product ( p, b );

  r8mat_print ( p + 1, p + 1, table, '  Exponential product table:' );

  return
end
