function laguerre_polynomial_test03 ( )

%*****************************************************************************80
%
%% LAGUERRE_POLYNOMIAL_TEST03 tests L_POLYNOMIAL_ZEROS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGUERRE_POLYNOMIAL_TEST03:\n' );
  fprintf ( 1, '  L_POLYNOMIAL_ZEROS computes the zeros of L(n,x)\n' );
  fprintf ( 1, '  Check by calling L_POLYNOMIAL there.\n' );

  for degree = 1 : 5

    z = l_polynomial_zeros ( degree );
    title = sprintf ( '  Computed zeros for L(%d,z):', degree );
    r8vec_print ( degree, z, title );

    lz = l_polynomial ( degree, degree, z );
    title = sprintf ( '  Evaluate L(%d,z):', degree );
    r8vec_print ( degree, lz(1:degree,degree+1), title );

  end

  return
end
