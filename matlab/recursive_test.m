function recursive_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for RECURSIVE_FUN_TEST.
%
%  Discussion;
%
%    RECURSIVE_FUN_TEST demonstrates the use of recursive functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'RECURSIVE_FUN_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Demonstrate recursive function definitions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F_HOFSTADTER evaluates Hofstadter''s recursive\n' );
  fprintf ( 1, '  F function, and does so using a MATLAB recursive\n' );
  fprintf ( 1, '  function.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '         N      F(N)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 30 
    value = f_hofstadter ( i );
    fprintf ( 1, '  %8d  %8d\n', i, value );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RECURSIVE_FUN_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = f_hofstadter ( n )

%*****************************************************************************80
%
%% F_HOFSTADTER computes the Hofstadter F sequence.
%
%  Discussion:
%
%    F(N) = 0                if N = 0
%         = N - F ( N - 1 ), otherwise.
%
%    F(N) is defined for all nonnegative integers, and turns out
%    to be equal to int ( ( N + 1 ) / 2 ).
%
%    In nonrecursive FORTRAN functions, the name of the function
%    is used as the value of the function.  For a recursive FORTRAN90
%    function, the value is given a separate name, and that name
%    is specified using the extra
%
%      result ( "NAME" )
%
%    field in the function declaration.  In the body of the function,
%    the assignment is made to the variable defined in the "result"
%    field, and NOT to a variable that shares its name with that
%    of the function.
%
%  Table:
%
%     N  F(N)
%    --  ----
%
%     0     0
%     1     1
%     2     1
%     3     2
%     4     2
%     5     3
%     6     3
%     7     4
%     8     4
%     9     5
%    10     5
%    11     6
%    12     6
%    13     7
%    14     7
%    15     8
%    16     8
%    17     9
%    18     9
%    19    10
%    20    10
%    21    11
%    22    11
%    23    12
%    24    12
%    25    13
%    26    13
%    27    14
%    28    14
%    29    15
%    30    15
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Douglas Hofstadter,
%    Goedel, Escher, Bach,
%    Basic Books, 1979.
%
%  Parameters:
%
%    Input, integer N, the argument of the function.
%
%    Output, integer VALUE, the value of the function.
%
  if ( n <= 0 )
    value = 0;
  else
    value = n - f_hofstadter ( n - 1 );
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
