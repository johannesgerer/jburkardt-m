function backtrack_binary_rc_test02 ( )

%*****************************************************************************80
%
%% BACKTRACK_BINARY_RC_TEST02 seeks a subset of numbers which add to a given sum.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2013
%
%  Author:
%
%    John Burkardt
%
  n = 8;
  target = 53;
  w = [ 15, 22, 14, 26, 32, 9, 16, 8 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BACKTRACK_BINARY_RC_TEST02\n' );
  fprintf ( 1, '  Use BACKBIN_RC to seek subsets of a set W\n' );
  fprintf ( 1, '  that sum to a given target value.\n' );
  fprintf ( 1, '  The choices are 0/1 to select each element of W.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TARGET = %d\n', target );
  fprintf ( 1, '\n' );
  call_num = 0;
  reject = 0;
  n2 = -1;
  choice = [];

  while ( 1 )

    [ n2, choice ] = backbin_rc ( n, reject, n2, choice );
    call_num = call_num + 1;

    if ( n2 == -1 )
      break
    end
%
%  Evaluate the partial sum.
%
    result = 0;
    for i = 1 : n2
      result = result + choice(i) * w(i);
    end
%
%  If the sum is too big, then we reject it, and
%  all the related sums formed by making additional choices.
%
    reject = ( target < result );
%
%  If we hit the target, print out the information.
%
    if ( result == target && n2 == n )
      fprintf ( 1, '  ' );
      for i = 1 : n
        fprintf ( 1, '%2d', choice(i) );
      end
      fprintf ( 1, '\n' );
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of calls = %d\n', call_num );
  fprintf ( 1, '  Binary search space = %d\n', 2 ^ n );

  return
end
