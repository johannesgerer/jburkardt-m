function hermite_test03 ( )

%*****************************************************************************80
%
%% TEST03 uses f(x) = r1 + r2x + r3x^2 + r4x^3 + r5x^4 + r6x^5 at x = r7 r8 r9
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2011
%
%  Author:
%
%    John Burkardt
%
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  HERMITE computes the Hermite interpolant to data.\n' );
  fprintf ( 1, '  Here, f(x) is a fifth order polynomial with random\n' );
  fprintf ( 1, '  coefficients, and the abscissas are random.\n' );

  seed = 123456789;

  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  r8vec_print ( n, x, '  Random abscissas' );

  [ c, seed ] = r8vec_uniform_01 ( 2 * n, seed );
  r8vec_print ( 2 * n, c, '  Random polynomial coefficients.' );

  y = zeros ( n, 1 );
  yp = zeros ( n, 1 );

  for i = 1 : 3

    y(i) = c(0+1) + x(i) * ( ...
           c(1+1) + x(i) * ( ...
           c(2+1) + x(i) * ( ...
           c(3+1) + x(i) * ( ...
           c(4+1) + x(i) * ( ...
           c(5+1) ) ) ) ) );

    yp(i) = c(1+1)       + x(i) * ( ...
            c(2+1) * 2.0 + x(i) * ( ...
            c(3+1) * 3.0 + x(i) * ( ...
            c(4+1) * 4.0 + x(i) *   ...
            c(5+1) * 5.0 ) ) );
  end

  hermite_demo ( n, x, y, yp );

  return
end
