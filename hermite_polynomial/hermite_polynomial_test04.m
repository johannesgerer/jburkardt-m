function hermite_polynomial_test04 ( )

%*****************************************************************************80
%
%% HERMITE_POLYNOMIAL_TEST04 tests H_POLYNOMIAL_ZEROS.
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
  fprintf ( 1, 'HERMITE_POLYNOMIAL_TEST04:\n' );
  fprintf ( 1, '  H_POLYNOMIAL_ZEROS computes the zeros of H(n,x);\n' );
  fprintf ( 1, '  Check by calling H_POLYNOMIAL there.\n' );

  for degree = 1 : 5

    z = h_polynomial_zeros ( degree );
    my_title = sprintf ( '  Computed zeros for H(%d,z):', degree );
    r8vec_print ( degree, z, my_title );

    hz = h_polynomial ( degree, degree + 1, z );
    my_title = sprintf ( '  Evaluate H(%d,z):', degree );
    r8vec_print ( degree, hz(1:degree,degree+1), my_title );

  end

  return
end
