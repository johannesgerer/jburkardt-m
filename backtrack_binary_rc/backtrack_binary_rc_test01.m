function backtrack_binary_rc_test01 ( )

%*****************************************************************************80
%
%% BACKTRACK_BINARY_RC_TEST01 seeks binary powers that have a given sum.
%
%  Discussion:
%
%    We consider the binary powers 1, 2, 4, ... 2^(n-1).
%
%    We wish to select some of these powers, so that the sum is equal
%    to a given target value.  We are actually simply seeking the binary
%    representation of an integer.
%
%    A partial solution is acceptable if it is less than the target value.
%
%    We list the powers in descending order, so that the bactracking
%    procedure makes the most significant choices first, thus quickly
%    eliminating many unsuitable choices.
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
  test_num = 3;
  targets = [ 73, 299, -3 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BACKTRACK_BINARY_RC_TEST01\n' );
  fprintf ( 1, '  Use BACKBIN_RC to find the binary expansion of\n' );
  fprintf ( 1, '  an integer between 0 and 255.\n' );
  fprintf ( 1, '  The choices are 0/1 for the 8 digits.\n' );

  for test = 1 : test_num

    target = targets(test);
    fprintf ( 1, '\n' );
    fprintf ( 1, '  TARGET = %d\n', target );
    call_num = 0;
    reject = 0;
    n2 = -1;
    choice = [];

    while ( 1 )

      [ n2, choice ] = backbin_rc ( n, reject, n2, choice );
      call_num = call_num + 1;

      if ( n2 == -1 )
        fprintf ( 1, '  Termination without solution.\n' );
        break
      end
%
%  Evaluate the integer determined by the choices.
%
      factor = 1;
      for i = n : -1 : n2 + 1
        factor = factor * 2;
      end

      result = 0;
      for i = 1 : n2
        result = result * 2 + choice(i);
      end

      result = result * factor;
%
%  If the integer is too big, then we reject it, and
%  all the related integers formed by making additional choices.
%
      reject = ( target < result );
%
%  If we hit the target, then in this case, we can exit because
%  the solution is unique.
%
      if ( result == target )
        break
      end

    end

    fprintf ( 1, '  Number of calls = %d\n', call_num );
    fprintf ( 1, '  Binary search space = %d\n', 2 ^ n );
    fprintf ( 1, '  ' );
    for i = 1 : n
      fprintf ( 1, '%2d', choice(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
