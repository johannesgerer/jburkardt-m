function combination_lock ( m, n, c )

%*****************************************************************************80
%
%% MAIN is the main program for COMBINATION_LOCK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of dials.
%
%    Input, integer N, the number of symbols on each dial.
%    We assume the symbols are the integers 0 to N-1.
%
%    Input, integer C(M), the combination.
%
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBINATION_LOCK\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A combination lock consists of M dials,\n' );
  fprintf ( 1, '  each having N symbols.\n' );
  fprintf ( 1, '  We seek to determine the combination C.\n' );

  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The program is choosing the value of M.\n' );
    m = 3;
  end

  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The program is choosing the value of N.\n' );
    n = 10;
  end

  if ( nargin < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The program is choosing the combination.\n' );
    rng ( 'shuffle' );
    c = randi ( [ 0, n - 1 ], m, 1 );
  else
    c = c(:);
  end
%
%  Report on the problem data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of dials is M = %d\n', m );
  fprintf ( 1, '  The number of symbols is N = %d\n', n );
  fprintf ( 1, '  The number of possible combinations is M^N = %d\n', n ^ m );
  i4vec_print ( m, c, '  The combination:' );
%
%  Starting with the guess [ 0, 0, ... 0],
%  generate every possible combination, in order, and try it.
%
  more = 0;
  a = zeros ( m, 1 );
  step = 0;

  while ( 1 )
  
    [ a, more ] = combination_next ( m, n, a, more );

    if ( ~more )
      fprintf ( 1, '\n' )
      fprintf ( 1, '  The program did NOT find the combination!\n' );
      break
    end

    step = step + 1;

    if ( a == c )
      label = sprintf ( '  The combination was found on step %d', step );
      i4vec_print ( m, c, label );
      break
    end
  
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBINATION_LOCK\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ a, more ] = combination_next ( dim_num, base, a, more )

%*****************************************************************************80
%
%% COMBINATION_NEXT generates lock combinations in lex order.
%
%  Discussion:
%
%    The vectors are produced in lexical order, starting with
%    (0,0,...,0),
%    (0,0,...,1),
%    ...
%    (BASE-1,BASE-1,...,BASE-1).
%
%  Example:
%
%    DIM_NUM = 2,
%    BASE = 3
%
%    0   0
%    0   1
%    0   2
%    1   0
%    1   1
%    1   2
%    2   0
%    2   1
%    2   2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dennis Stanton, Dennis White,
%    Constructive Combinatorics,
%    Springer, 1986,
%    ISBN: 0387963472,
%    LC: QA164.S79.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the size of the vectors to be used.
%
%    Input, integer BASE, the base to be used.  BASE = 2 will
%    give vectors of 0's and 1's, for instance.
%
%    Input, integer A(DIM_NUM), except on the first call, this should
%    be the output value of A on the last call.
%
%    Input, logical MORE, should be FALSE on the first call, and
%    thereafter should be the output value of MORE from the previous call.  
%
%    Output, integer A(DIM_NUM), the next vector.
%
%    Output, logical MORE, is TRUE if another vector was computed.
%    If MORE is FALSE on return, then ignore the output value A, and
%    stop calling the routine.
%
  if ( ~more )

    a(1:dim_num) = 0;
    more = 1;

  else
      
    for i = dim_num : -1 : 1

      a(i) = a(i) + 1;

      if ( a(i) < base )
        return
      end

      a(i) = 0;

    end

    more = 0;

  end

  return
end
function i4vec_print ( n, a, title )

%*****************************************************************************80
%
%% I4VEC_PRINT prints an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, integer A(N), the vector to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '%6d: %6d\n', i, a(i) );
  end

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
