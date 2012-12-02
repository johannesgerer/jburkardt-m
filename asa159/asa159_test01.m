function asa159_test01 ( )

%*****************************************************************************80
%
%% ASA159_TEST01 tests RCONT2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2009
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 5;
  ntest = 10;

  c = [ 2, 2, 2, 2, 1 ];
  r = [ 3, 2, 2, 1, 1 ];

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA159_TEST01\n' );
  fprintf ( 1, '  RCONT2 constructs a random matrix with\n' );
  fprintf ( 1, '  given row and column sums.\n' );

  i4vec_print ( m, r, '  The rowsum vector:' );
  i4vec_print ( n, c, '  The columnsum vector:' );

  key = 0;

  for i = 1 : ntest

    [ key, seed, a, ierror ] = rcont2 ( m, n, r, c, key, seed );

    if ( ierror ~= 0 )
      fprintf ( 1, '\n' );
      fprint f( 1, '  RCONT2 returned error flag IERROR = %d\n', ierror );
      return
    end

    i4mat_print ( m, n, a, '  The rowcolsum matrix:' );

  end

  return
end
