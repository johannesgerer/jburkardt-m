function toms446_test01 ( )

%*****************************************************************************80
%
%% TOMS446_TEST01 tests CHEBY, which computes Chebyshev series.
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
  fprintf ( 1, 'TOMS446_TEST01\n' );
  fprintf ( 1, '  Test CHEBY, which computes the\n' );
  fprintf ( 1, '  Chebyshev series for several functions.\n' );

  x = cheby ( nf, npl, @functn );

  fprintf ( 1, '\n' );
  fprintf ( 1, '        Sin(x)      Cos(x)    Sin(2x)     Cos(2x)       X^5\n' );
  fprintf ( 1, '\n' );

  for i = 1 : npl
    fprintf ( 1, '  %10.4f  %10.f  %10.4f  %10.4f  %10.4f\n', x(i,1:nf) );
  end

  return
end
