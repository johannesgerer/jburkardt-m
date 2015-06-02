function chebyshev_series_test03 ( )

%*****************************************************************************80
%
%% CHEBYSHEV_SERIES_TEST03 considers an odd Chebyshev series for SINH(X).
%
%  Discussion:
%
%    TABLE5ODD contains the odd Chebyshev series coefficients for
%    sinh(x) over -1 <= x <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 April 2014
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
  nc = 9;

  table5odd = [ ...
    1.13031820798497005442, ...
    0.04433684984866380495, ...
    0.00054292631191394375, ...
    0.00000319843646240199, ...
    0.00000001103677172552, ...
    0.00000000002497956617, ...
    0.00000000000003991263, ...
    0.00000000000000004741, ...
    0.00000000000000000004 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_SERIES_TEST03:\n' );
  fprintf ( 1, '  ODDCHEBSER2 computes an odd Chebyshev series approximation.\n' );
  fprintf ( 1, '  and its first two derivatives.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Errors of an odd Chebyshev series y(x) approximating sinh(x):\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    x        err(y)       err(y'')       err(y")\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 10
    x = i / 10.0;
    [ s, s1, s2 ] = oddchebser2 ( x, table5odd, nc );
    y = sinh ( x );
    y1 = cosh ( x );
    s = s - y;
    s1 = s1 - y1;
    s2 = s2 - y;
    fprintf ( 1, '%7.4f  %14.6g  %14.6g  %14.6g\n', x, s, s1, s2 );
  end

  return
end

