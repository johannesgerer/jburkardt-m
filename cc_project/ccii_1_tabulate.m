function ccii_1_tabulate ( )

%*****************************************************************************80
%
%% CCII_1_TABULATE tabulates CCII_1 quadrature rules for the Hermite integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CCII_1_TABULATE\n' );
  fprintf ( 1, '  Tabulate CCII_1 quadrature rules for the Hermite integral.\n' );
  fprintf ( 1, '  Density function rho(x) = 1.\n' );
  fprintf ( 1, '  Region: -oo < x < +oo.\n' );
  fprintf ( 1, '  Exactness: NONE.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Print the first 5 rules:\n' );
  fprintf ( 1, '   I          X(I)            W(I)\n' );
  fprintf ( 1, '\n' );

  ell = 1.0;

  for n = 1 : 5

    [ x, w ] = ccii_1 ( n, ell );

    fprintf ( 1, '\n' );    
    for i = 1 : n
      fprintf ( 1, '  %2d  %14.6f  %14.6f\n', i, x(i), w(i));
    end
    fprintf ( 1, ' Sum                  %14.6f  %14.6f\n', sum ( w(1:n) ) );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Print the first 5 nested rules:\n' );
  fprintf ( 1, '   I          X(I)            W(I)\n' );
  fprintf ( 1, '\n' );

  ell = 1.0;

  for j = 1 : 5

    n = 2^j - 1;

    [ x, w ] = ccii_1 ( n, ell );

    fprintf ( 1, '\n' );    
    for i = 1 : n
      fprintf ( 1, '  %2d  %14.6f  %14.6f\n', i, x(i), w(i) );
    end
    fprintf ( 1, ' Sum                  %14.6f\n', sum ( w(1:n) ) );

  end

  return
end

