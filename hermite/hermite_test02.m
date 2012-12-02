function hermite_test02 ( )

%*****************************************************************************80
%
%% TEST02 uses f(x) = 6 + 5x + 4x^2 + 3x^3 + 2x^4 + x^5 at x = 0, 1, 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 June 2011
%
%  Author:
%
%    John Burkardt
%
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  HERMITE computes the Hermite interpolant to data.\n' );
  fprintf ( 1, '  Here, f(x) = 6 + 5x + 4x^2 + 3x^3 + 2x^4 + x^5.\n' );

  x = zeros ( 3, 1 );
  y = zeros ( 3, 1 );
  yp = zeros ( 3, 1 );

  for i = 1 : 3

    x(i) = i - 1;

    y(i) = 6.0 + x(i) * ( ...
           5.0 + x(i) * ( ...
           4.0 + x(i) * ( ...
           3.0 + x(i) * ( ...
           2.0 + x(i) ) ) ) );

    yp(i) = 5.0 + x(i) * ( ...
            8.0 + x(i) * ( ...
            9.0 + x(i) * ( ...
            8.0 + x(i) *   ...
            5.0 ) ) );
  end

  hermite_demo ( n, x, y, yp );

  return
end
