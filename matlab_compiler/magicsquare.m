function m = magicsquare ( n )

%*****************************************************************************80
%
%% MAGICSQUARE is a "main program" for a MATLAB compiler example.
%
%  Discussion:
%
%    This function is intended as the "main" program.  That is,
%    execution will begin with this function; it will receive
%    commandline input from the user and return results to the user.
%
%    In this example, the function serves merely to collect the value
%    of N from the user, and then call MATLAB's "magic()" function
%    to set up a magic square of the indicated order.
%
%  Modified:
%
%    21 April 2013
%
%  Parameters:
%
%    Input, integer/string N, the order of the magic square.
%
  if ( ischar ( n ) )
    n = str2num ( n );
  end

  m = magic ( n );

  return
end

