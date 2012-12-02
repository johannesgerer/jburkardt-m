function satisfy ( )

%*****************************************************************************80
%
%% MAIN is the main program for SATISFY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 May 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Michael Quinn,
%    Parallel Programming in C with MPI and OpenMP,
%    McGraw-Hill, 2004,
%    ISBN13: 978-0071232654,
%    LC: QA76.73.C15.Q55.
%
  fprintf ( 1, '\n' );
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SATISFY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  We have a logical function of N logical arguments.\n' );
  fprintf ( 1, '  We do an exhaustive search of all 2^N possibilities,\n' );
  fprintf ( 1, '  seeking those inputs that make the function TRUE.\n' );
%
%  Compute the number of binary vectors to check.
%
  n = 23;
  ihi = 2^n;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of logical variables is N = %d\n',  n );
  fprintf ( 1, '  The number of input vectors to check is %d\n', ihi );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   #       Index    ---------Input Values------------------------\n' );
  fprintf ( 1, '\n' );
%
%  Check every possible input vector.
%
  solution_num = 0;

  for i = 0 : ihi - 1

    bvec = i4_to_bvec ( i, n );

    value = circuit_value ( n, bvec );

    if ( value == 1 )
      solution_num = solution_num + 1;
      fprintf ( 1, '  %2d  %10d   ', solution_num, i - 1 );
      for j = 1 : n
        fprintf ( 1, ' %1d', bvec(j) );
      end
      fprintf ( 1, '\n' );
    end

  end
%
%  Report.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of solutions found was %d\n', solution_num );
%
%  Shut down.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SATISFY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = circuit_value ( n, bvec )

%*****************************************************************************80
%
%% CIRCUIT_VALUE returns the value of a circuit for a given input set.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Michael Quinn,
%    Parallel Programming in C with MPI and OpenMP,
%    McGraw-Hill, 2004,
%    ISBN13: 978-0071232654,
%    LC: QA76.73.C15.Q55.
%
%  Parameters:
%
%    Input, integer N, the length of the input vector.
%
%    Input, integer BVEC(N), the binary inputs.
%
%    Output, integer CIRCUIT_VALUE, the output of the circuit.
%
  value = ...
      (  bvec(1)  |  bvec(2)  ) ...
    & ( ~bvec(2)  | ~bvec(4)  ) ...
    & (  bvec(3)  |  bvec(4)  ) ...
    & ( ~bvec(4)  | ~bvec(5)  ) ...
    & (  bvec(5)  | ~bvec(6)  ) ...
    & (  bvec(6)  | ~bvec(7)  ) ...
    & (  bvec(6)  |  bvec(7)  ) ...
    & (  bvec(7)  | ~bvec(16) ) ...
    & (  bvec(8)  | ~bvec(9)  ) ...
    & ( ~bvec(8)  | ~bvec(14) ) ...
    & (  bvec(9)  |  bvec(10) ) ...
    & (  bvec(9)  | ~bvec(10) ) ...
    & ( ~bvec(10) | ~bvec(11) ) ...
    & (  bvec(10) |  bvec(12) ) ...
    & (  bvec(11) |  bvec(12) ) ...
    & (  bvec(13) |  bvec(14) ) ...
    & (  bvec(14) | ~bvec(15) ) ...
    & (  bvec(15) |  bvec(16) ) ...
    & (  bvec(15) |  bvec(17) ) ...
    & (  bvec(18) |  bvec(2)  ) ...
    & (  bvec(19) | ~bvec(1)  ) ...
    & (  bvec(20) |  bvec(2)  ) ...
    & (  bvec(20) | ~bvec(19) ) ...
    & ( ~bvec(20) | ~bvec(10) ) ...
    & (  bvec(1)  |  bvec(18) ) ...
    & ( ~bvec(2)  |  bvec(21) ) ...
    & ( ~bvec(22) |  bvec(21) ) ...
    & ( ~bvec(23) |  bvec(21) ) ...
    & ( ~bvec(22) | ~bvec(21) ) ...
    & (  bvec(23) | ~bvec(21) );

  return
end
function bvec = i4_to_bvec ( i4, n )

%*****************************************************************************80
%
%% I4_TO_BVEC converts an integer into a binary vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I4, the integer.
%
%    Input, integer N, the dimension of the vector.
%
%    Output, integer BVEC(N), the vector of binary remainders.
%
  bvec(1:n) = 0;

  for i = n : -1 : 1
    bvec(i) = mod ( i4, 2 );
    i4 = floor ( i4 / 2 );
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
