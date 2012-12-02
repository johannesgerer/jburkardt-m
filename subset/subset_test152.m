function subset_test152 ( )

%*****************************************************************************80
%
%% TEST152 tests TUPLE_NEXT_GE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 3;
  m = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST152\n' );
  fprintf ( 1, '  TUPLE_NEXT_GE returns the next "tuple", that is,\n' );
  fprintf ( 1, '  a vector of N integers, each between 1 and M,\n' );
  fprintf ( 1, '  with the constraint that the entries be\n' );
  fprintf ( 1, '  nondecreasing.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  M = %d\n', m );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '\n' );

  rank = 0;
  x = [];

  while ( 1 )

    [ rank, x ] = tuple_next_ge ( m, n, rank, x );

    if ( rank == 0 )
      break
    end

    fprintf ( 1, '  %2d', rank );
    for i = 1 : n
      fprintf ( 1, '  %4d', x(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
