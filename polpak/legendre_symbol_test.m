function legendre_symbol_test ( )

%*****************************************************************************80
%
%% LEGENDRE_SYMBOL_TEST tests LEGENDRE_SYMBOL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  ntest = 4;
  ptest = [ 7, 11, 13, 17 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_SYMBOL_TEST\n' );
  fprintf ( 1, '  LEGENDRE_SYMBOL computes the Legendre\n' );
  fprintf ( 1, '  symbol (Q/P) which records whether Q is \n' );
  fprintf ( 1, '  a quadratic residue modulo the prime P.\n' );

  for i = 1 : ntest
    p = ptest(i);
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Legendre Symbols for P = %d\n', p );
    fprintf ( 1, '\n' );
    for q = 0 : p
      l = legendre_symbol ( q, p );
      fprintf ( 1, '  %6d  %6d  %6d\n', p, q, l );
    end
  end

  return
end
