function subset_test150 ( )

%*****************************************************************************80
%
%% TEST150 tests TUPLE_NEXT.
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
  n = 2;
  m1 = 2;
  m2 = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST150\n' );
  fprintf ( 1, '  TUPLE_NEXT returns the next "tuple", that is,\n' );
  fprintf ( 1, '  a vector of N integers, each between M1 and M2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  M1 = %d\n', m1 );
  fprintf ( 1, '  M2 = %d\n', m2 );
  fprintf ( 1, '  N =  %d\n', n );
  fprintf ( 1, '\n' );

  rank = 0;
  x(1:n) = zeros(1:n);

  while ( 1 )

    [ rank, x(1:n) ] = tuple_next ( m1, m2, n, rank, x );

    if ( rank == 0 )
      break
    end

    fprintf ( 1, '%4d  ', rank );
    for j = 1 : n
      fprintf ( 1, '%4d  ', x(j) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
