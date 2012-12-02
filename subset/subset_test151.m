function subset_test151 ( )

%*****************************************************************************80
%
%% TEST151 tests TUPLE_NEXT_FAST.
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
  m = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST151\n' );
  fprintf ( 1, '  TUPLE_NEXT_FAST returns the next "tuple", that is,\n' );
  fprintf ( 1, '  a vector of N integers, each between 1 and M.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  M = %d\n', m );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '\n' );
%
%  Initialize.
%
  rank = -1;
  x(1:n) = tuple_next_fast ( m, n, rank );

  for rank = 0 : (m^n)-1

    x(1:n) = tuple_next_fast ( m, n, rank );

    fprintf ( 1, '%4d  ', rank );
    for j = 1 : n
      fprintf ( 1, '%10f  ', x(j) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
