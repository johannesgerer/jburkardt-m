function ccfi_0_tabulate ( )

%*****************************************************************************80
%
%% CCFI_0_TABULATE tabulates CCFI_0 quadrature rules for the Laguerre integral.
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
  fprintf ( 1, 'CCFI_0_TABULATE\n' );
  fprintf ( 1, '  Tabulate CCFI_0 quadrature rules for the Laguerre integral.\n' );
  fprintf ( 1, '  Density function rho(x) = exp(-x).\n' );
  fprintf ( 1, '  Region: 0 <= x < +oo.\n' );
  fprintf ( 1, '  Exactness: NONE.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Print the first 5 rules:\n' );
  fprintf ( 1, '   I          X(I)            W(I)\n' );
  fprintf ( 1, '\n' );

  ell = 1.0;

  for n = 1 : 5

    [ x, w ] = ccfi_0 ( n, ell );

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

  ell = 1.0;

  for j = 1 : 5

    n = 2^j - 1;

    [ x, w ] = ccfi_0 ( n, ell );

    fprintf ( 1, '\n' );    
    for i = 1 : n
      fprintf ( 1, '  %2d  %14.6f  %14.6f  %14.6f\n', i, x(i), w(i) );
    end
    fprintf ( 1, ' Sum                  %14.6f\n', sum ( w(1:n) ) );

  end

  return
end

