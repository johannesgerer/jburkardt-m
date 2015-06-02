function ccff_tabulate ( )

%*****************************************************************************80
%
%% CCFF_TABULATE tabulates CCFF quadrature rules for the Legendre integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CCFF_TABULATE\n' );
  fprintf ( 1, '  Tabulate CCF quadrature rules for the Legendre integral.\n' );
  fprintf ( 1, '  Density function rho(x) = 1.\n' );
  fprintf ( 1, '  Region: -1 <= x <= -1.\n' );
  fprintf ( 1, '  Exactness: N-1.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Print the first 5 rules:\n' );
  fprintf ( 1, '   I          X(I)            W(I)\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 5

    [ x, w ] = ccff ( n );

    fprintf ( 1, '\n' );    
    for i = 1 : n
      fprintf ( 1, '  %2d  %14.6f  %14.6f\n', i, x(i), w(i) );
    end
    fprintf ( 1, ' Sum                  %14.6f\n', sum ( w(1:n) ) );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Print the first 5 nested rules:\n' );
  fprintf ( 1, '   I          X(I)            W(I)\n' );
  fprintf ( 1, '\n' );

  for j = 1 : 5

    n = 2^j - 1;

    [ x, w ] = ccff ( n );

    fprintf ( 1, '\n' );    
    for i = 1 : n
      fprintf ( 1, '  %2d  %14.6f  %14.6f\n', i, x(i), w(i) );
    end
    fprintf ( 1, ' Sum                  %14.6f\n', sum ( w(1:n) ) );

  end

  return
end

