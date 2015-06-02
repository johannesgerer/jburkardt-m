function legendre_polynomial_test03 ( )

%*****************************************************************************80
%
%% LEGENDRE_POLYNOMIAL_TEST03 tests P_POLYNOMIAL_ZEROS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_POLYNOMIAL_TEST03:\n' );
  fprintf ( 1, '  P_POLYNOMIAL_ZEROS computes the zeros of P(n,x)\n' );
  fprintf ( 1, '  Check by calling P_POLYNOMIAL_VALUE there.\n' );

  for degree = 1 : 5

    z = p_polynomial_zeros ( degree );
    title = sprintf ( '  Computed zeros for P(%d,x)', degree );
    r8vec_print ( degree, z, title );

    lz = p_polynomial_value ( degree, degree, z );
    title = sprintf ( '  Evaluate P(%d,z)', degree );
    r8vec_print ( degree, lz(1:degree,degree+1), title );

  end

  return
end
