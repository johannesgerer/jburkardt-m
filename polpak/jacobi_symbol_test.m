function jacobi_symbol_test ( )

%*****************************************************************************80
%
%% JACOBI_SYMBOL_TEST tests JACOBI_SYMBOL.
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

  ptest = [ 3, 9, 10, 12 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_SYMBOL_TEST\n' );
  fprintf ( 1, '  JACOBI_SYMBOL computes the Jacobi symbol\n' );
  fprintf ( 1, '  (Q/P), which records if Q is a quadratic \n' );
  fprintf ( 1, '  residue modulo the number P.\n' );

  for i = 1 : ntest
    p = ptest(i);
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Jacobi Symbols for P = %d\n', p );
    fprintf ( 1, '\n' );
    for q = 0 : p
      l = jacobi_symbol ( q, p );
      fprintf ( 1, '  %6d  %6d  %6d\n', p, q, l );
    end
  end

  return
end
