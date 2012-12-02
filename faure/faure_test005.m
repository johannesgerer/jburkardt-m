function faure_test005 ( )

%*****************************************************************************80
%
%% TEST005 tests BINOMIAL_TABLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 December 2009
%
%  Author:
%
%    John Burkardt
%
  m = 10;
  n = 7;
  qs = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST005\n' );
  fprintf ( 1, '  BINOMIAL_TABLE computes a table of binomial.\n' );
  fprintf ( 1, '  coefficients mod QS.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, QS = %d\n', qs );

  coef = binomial_table ( qs, m, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   I/J' );
  for j = 0 : n
    fprintf ( 1, '%8d', j );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );

  for i = 0 : m
    fprintf ( 1, '  %2d  ', i );
    for j = 0: n
      fprintf ( 1, '%8d', coef(i+1,j+1) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
