function hermite_polynomial_test05 ( )

%*****************************************************************************80
%
%% HERMITE_POLYNOMIAL_TEST05 tests HE_POLYNOMIAL_ZEROS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_POLYNOMIAL_TEST05:\n' );
  fprintf ( 1, '  HE_POLYNOMIAL_ZEROS computes the zeros of He(n,x);\n' );
  fprintf ( 1, '  Check by calling HE_POLYNOMIAL there.\n' );

  for degree = 1 : 5

    z = he_polynomial_zeros ( degree );
    my_title = sprintf ( '  Computed zeros for He(%d,z):', degree );
    r8vec_print ( degree, z, my_title );

    hz = he_polynomial ( degree, degree + 1, z );
    my_title = sprintf ( '  Evaluate He(%d,z):', degree );
    r8vec_print ( degree, hz(1:degree,degree+1), my_title );

  end

  return
end
