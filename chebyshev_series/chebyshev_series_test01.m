function chebyshev_series_test01 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_SERIES_TEST01 considers an even Chebyshev series for EXP(X).
%
%  Discussion:
%
%    Table 5 is from Clenshaw, and contains 18 terms of the Chebyshev
%    series for exp(x) over [-1,+1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 April 2014
%
%  Author:
%
%    Manfred Zimmer
%
%  Reference:
%
%    Charles Clenshaw,
%    Mathematical Tables, Volume 5,
%    Chebyshev series for mathematical functions,
%    London, 1962.
%
  nc = 18;

  table5 = [ ...
    2.53213175550401667120, ...
    1.13031820798497005442, ...
    0.27149533953407656237, ...
    0.04433684984866380495, ...
    0.00547424044209373265, ...
    0.00054292631191394375, ...
    0.00004497732295429515, ...
    0.00000319843646240199, ...
    0.00000019921248066728, ...
    0.00000001103677172552, ...
    0.00000000055058960797, ...
    0.00000000002497956617, ...
    0.00000000000103915223, ...
    0.00000000000003991263, ...
    0.00000000000000142376, ...
    0.00000000000000004741, ...
    0.00000000000000000148, ...
    0.00000000000000000004 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_SERIES_TEST01:\n' );
  fprintf ( 1, '  ECHEBSER3 computes a Chebyshev series approximation\n' );
  fprintf ( 1, '  and the first three derivatives.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Errors of a Chebyshev series for exp(x)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    x        err(y)       err(y'')       err(y")      err(y"'')\n' );
  fprintf ( 1, '\n' );

  for i = -10 : 10
    x = i / 10.0;
    [ s, s1, s2, s3 ] = echebser3 ( x, table5, nc );
    y = exp ( x );
    s = s - y;
    s1 = s1 - y;
    s2 = s2 - y;
    s3 = s3 - y;
    fprintf ( 1, '%7.4f  %14.6g  %14.6g  %14.6g  %14.6g\n', x, s, s1, s2, s3 );
  end

  return
end
