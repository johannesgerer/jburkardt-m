function tno_persistence_test ( )

%*****************************************************************************80
%
%% TNO_PERSISTENCE_TEST tests the persistence of TNO data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TNO_PERSISTENCE_TEST:\n' );
  fprintf ( 1, '  TNO is given a level L, and returns points and weights\n' );
  fprintf ( 1, '  of a Truncated Normal Odd (TNO) quadrature rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first time TNO is called for a particular order N\n' );
  fprintf ( 1, '  it must compute the corresponding rule.  It prints a\n' );
  fprintf ( 1, '  message, and saves the data in persistent arrays.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  To verify this, compute a sequence of levels L\n' );
  fprintf ( 1, '  for which the values of N repeat.  The message should\n' );
  fprintf ( 1, '  only show up once for each value of N.\n' );

  fprintf ( 1, '\n' );
  for l = 1 : 6
    n = tno_order ( l );
    fprintf ( 1, '  L = %d, N = %d\n', l, n );
    [ x, w ] = tno ( l );
  end
 
  return
end
