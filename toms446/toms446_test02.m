function toms446_test02 ( )

%*****************************************************************************80
%
%% TOMS446_TEST02 tests MULTPLY, which multiplies two Chebyshev series.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2011
%
%  Author:
%
%    John Burkardt
%
  nf = 5;
  npl = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS446_TEST02\n' );
  fprintf ( 1, '  Test MLTPLY, which computes the\n' );
  fprintf ( 1, '  product of two Chebyshev series.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Multiply series for SIN(X) and COS(X)\n' );
  fprintf ( 1, '  and compare with series for 1/2*SIN(2X).\n' );

  x = cheby ( nf, npl, @functn );

  for i = 1 : npl
    x1(i) = x(i,1);
    x2(i) = x(i,2);
    x(i,3) = 0.5 * x(i,3);
  end

  x3 = mltply ( x1, x2, npl );

  fprintf ( 1, '\n' );
  fprintf ( 1, '        Sin(x)      Cos(x)   1/2*Sin(2x)     RESULT\n' );
  fprintf ( 1, '\n' );

  for i = 1 : npl
    fprintf ( 1, '  %10.4f  %10.4f  %10.4f  %10.4f\n', x(i,1:3), x3(i) );
  end

  return
end
