function sum_million ( )

%*****************************************************************************80
%
%% MAIN is the main program for SUM_MILLION.
%
%  Discussion:
%
%    This code estimates the power of a computer by summing the integers
%    from 1 to 1,000,000.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 July 2008
%
%  Author:
%
%    John Burkardt
%
  n = 1000000;
  exact = 500000500000.0;

  fprintf ( 1, '\n' );
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUM_MILLION\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Sum the integers from 1 to 1,000,000.\n' );
  fprintf ( 1, '  Correct answer is 500000500000.\n' );

  x = set_up ( n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '         N      CPU time        MFLOPS        ERROR\n' );
  fprintf ( 1, '                (seconds)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ total, ctime ] = sum_up ( n, x );

    mflops = n / 1000000.0 / ctime;

    err = total - exact;

    fprintf ( 1, '  %8d  %14.6e  %14.6f  %14.6e\n', n, ctime, mflops, err );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUM_MILLION:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( )

  return
end
function x = set_up ( n )

%*****************************************************************************80
%
%% SET_UP sets up the data for the SUM_MILLION program.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 July 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of values to define.
%
%    Output, real X(N), a vector which contains the values 1 through N.
%
  x(1:n) = 1 : n;

  return
end
function [ total, ctime ] = sum_up ( n, x )

%*****************************************************************************80
%
%% SUM_UP carries out the sum for the SUM_MILLION program.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 July 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of values to define.
%
%    Input, real X(N), the data to be summed.
%
%    Output, real TOTAL, the sum of the data.
%
%    Output, real CTIME, the cpu time required to sum the data.
%
  ctime1 = cputime;

  total = sum ( x(1:n) );

  ctime2 = cputime;

  ctime = ctime2 - ctime1;

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
