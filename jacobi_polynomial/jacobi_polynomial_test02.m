function jacobi_polynomial_test02 ( )

%*****************************************************************************80
%
%% JACOBI_POLYNOMIAL_TEST02 tests J_POLYNOMIAL_ZEROS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2012
%
%  Author:
%
%    John Burkardt
%
  a_test = [ 0.5, 1.0, 2.0 ];
  b_test = [ 0.5, 1.5, 0.5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_POLYNOMIAL_TEST02:\n' );
  fprintf ( 1, '  J_POLYNOMIAL_ZEROS computes the zeros of J(n,a,b,x);\n' );
  fprintf ( 1, '  Check by calling J_POLYNOMIAL there.\n' );

  for test = 1 : 3

    a = a_test(test);
    b = b_test(test);

    for degree = 1 : 5

      z = j_polynomial_zeros ( degree, a, b );
      my_title = sprintf ( '  Computed zeros for J(%d,%f,%f,z):', degree, a, b );
      r8vec_print ( degree, z, my_title );

      hz = j_polynomial ( degree, degree + 1, a, b, z );
      my_title = sprintf ( '  Evaluate J(%d,%f,%f,z):', degree,a,b );
      r8vec_print ( degree, hz(1:degree,degree+1), my_title );

    end

  end

  return
end
