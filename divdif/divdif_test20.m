function divdif_test20 ( )

%*****************************************************************************80
%
%% DIVDIF_TEST20 tests DIF_DERIVK_TABLE;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST20\n' );
  fprintf ( 1, '  For a divided difference polynomial:\n' );
  fprintf ( 1, '  DIF_DERIVK_TABLE computes the K-th derivative;\n' );
%
%  Set the 0 data points.
%
  n0 = 5;
  x0 = linspace ( -2.0, +2.0, 5 );
%
%  Set data for x^4/24+x^3/3+x^2/2+x+1
%
  f0(1:n0) = 1.0;
  for i = 4 : -1 : 1
    f0(1:n0) = f0(1:n0) .* x0(1:n0) / i + 1.0;
  end
%
%  Compute the difference table.
%
  d0 = data_to_dif ( n0, x0, f0 );
  dif_print ( n0, x0, d0, '  The divided difference polynomial P0:' );

  c0 = dif_to_r8poly ( n0, x0, d0 );

  r8poly_print ( n0, c0, '  Using DIF_TO_R8POLY' );
%
%  Compute the difference table for the K=1 derivative.
%
  k = 1;
  n1 = n0 - k;
  [ x1, d1 ] = dif_derivk_table ( n0, x0, d0, k );
%
%  Compute the difference table for the K=2 derivative.
%
  k = 2;
  n2 = n0 - k;
  [ x2, d2 ] = dif_derivk_table ( n0, x0, d0, k );
%
%  Compute the difference table for the K=3 derivative.
%
  k = 3;
  n3 = n0 - k;
  [ x3, d3 ] = dif_derivk_table ( n0, x0, d0, k );
%
%  Compute the difference table for the K=4 derivative.
%
  k = 4;
  n4 = n0 - k;
  [ x4, d4 ] = dif_derivk_table ( n0, x0, d0, k );
%
%  Evaluate all 5 polynomials.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Evaluate difference tables for the function P0\n' );
  fprintf ( 1, '  and its first four derivatives, P1...P4.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X         P0        P1        P2        P3        P4\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 10
    x = i / 5.0;
    y0 = dif_val ( n0, x0, d0, x );
    y1 = dif_val ( n1, x1, d1, x );
    y2 = dif_val ( n2, x2, d2, x );
    y3 = dif_val ( n3, x3, d3, x );
    y4 = dif_val ( n4, x4, d4, x );
    fprintf ( 1, '  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f  %8.4f\n', ...
      x, y0, y1, y2, y3, y4 );
  end

  return
end
