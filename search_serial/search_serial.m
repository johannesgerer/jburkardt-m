function j = search_serial ( a, b, c )

%*****************************************************************************80
%
%% MAIN is the main program for SEARCH_SERIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the lower limit of the search.
%
%    Input, integer B, the upper limit of the search.
%
%    Input, integer C, the desired value.
%
%    Output, integer J, is:
%    -1, if no solution could be found.
%    otherwise, F(J) = C and A <= J <= B.
%
  i4_huge = 2147483647;

  if ( nargin < 2 )
    b = i4_huge;
  end

  if ( nargin < 1 )
    a = 1;
  end

  if ( nargin < 3 )
    if ( 45 < b )
      c = 45;
    else
      c = floor ( a / 2 + b / 2 );
    end
  end

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SEARCH_SERIAL:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Search the integers from A to B\n' );
  fprintf ( 1, '  for a value J such that F(J) = C.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A           = %d\n', a );
  fprintf ( 1, '  B           = %d\n', b );
  fprintf ( 1, '  C           = %d\n', c );

  tic

  j = search ( a, b, c );

  wtime = toc;

  if ( j == -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  No solution was found.\n' );
  else
    fprintf ( 1,  '\n' );
    fprintf ( 1, '  Found     J = %d\n', j );
    fprintf ( 1, '  Verify F(J) = %d\n', f ( j ) );
  end

  fprintf ( 1, '  Elapsed CPU time is %g\n', wtime );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SEARCH_SERIAL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function j = search ( a, b, c )

%*****************************************************************************80
%
%% SEARCH searches integers in [A,B] for a J so that F(J) = C.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, B, the search range.
%
%    Input, integer C, the desired function value.
%
%    Output, integer J, the computed solution, or -1
%    if no solution was found.
%
  j = -1;

  for i = a : b

    fi = f ( i );

    if ( fi == c )
      j = i;
      return
    end

  end

  return
end
function value = f ( i )

%*****************************************************************************80
%
%% F is the function we are analyzing.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the argument.
%
%    Input, integer VALUE, the value.
%
  i4_huge = 2147483647;

  value = i;

  for j = 1 : 5

    k = floor ( value / 127773 );

    value = 16807 * ( value - k * 127773 ) - k * 2836;

    if ( value <= 0 )
      value = value + i4_huge;
    end

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
