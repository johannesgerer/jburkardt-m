function circle_segment_test14 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST14 demonstrates R_JACOBI.
%
%  Discussion:
%
%    R_JACOBI returns recursion coefficients ALPHA and BETA for rules
%    using a Jacobi type weight w(x) = (1-x)^A * (1+x)^B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 July 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference
%
%    Walter Gautschi,
%    Orthogonal Polynomials: Computation and Approximation,
%    Oxford, 2004,
%    ISBN: 0-19-850672-4,
%    LC: QA404.5 G3555.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST14\n' );
  fprintf ( 1, '  R_JACOBI computes recursion coefficients ALPHA and BETA\n' );
  fprintf ( 1, '  for a Jacobi weight w(x)=(1-x)^A * (1+x)^B.\n' );
%
%  Legendre rule.
%
  n = 10;
  a = 0.0;
  b = 0.0;
  ab = r_jacobi ( n, a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Legendre\n' );
  fprintf ( 1, '  A = %g, B = %g\n', a, b );
  fprintf ( 1, '  Alpha   Beta\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12g  %12g\n', ab(i,1), ab(i,2) );
  end
%
%  Chebyshev Type 1 rule.
%
  n = 10;
  a = -0.5;
  b = -0.5;
  ab = r_jacobi ( n, a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Chebyshev Type 1\n' );
  fprintf ( 1, '  A = %g, B = %g\n', a, b );
  fprintf ( 1, '  Alpha   Beta\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12g  %12g\n', ab(i,1), ab(i,2) );
  end
%
%  Chebyshev Type 2 rule.
%
  n = 10;
  a = 0.5;
  b = 0.5;
  ab = r_jacobi ( n, a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Chebyshev Type 2\n' );
  fprintf ( 1, '  A = %g, B = %g\n', a, b );
  fprintf ( 1, '  Alpha   Beta\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12g  %12g\n', ab(i,1), ab(i,2) );
  end
%
%  General Jacobi.
%
  n = 10;
  a = 0.5;
  b = 1.5;
  ab = r_jacobi ( n, a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  General Jacobi weight\n' );
  fprintf ( 1, '  A = %g, B = %g\n', a, b );
  fprintf ( 1, '  Alpha   Beta\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12g  %12g\n', ab(i,1), ab(i,2) );
  end

  return
end
