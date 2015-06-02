function magicsquare_print ( n )

%*****************************************************************************80
%
%% MAGICSQUARE_PRINT is a "main program" for a MATLAB compiler example.
%
%  Discussion:
%
%    The "magicsquare" example simply returns the magic square as an
%    output argument.  I don't know how to run this as an executable
%    program and retrieve the result.  When I run the magicsquare
%    program, it is as though nothing has happened.
%
%    This example actually prints the matrix out, twice:
%
%    The first printout is because of MATLAB's default behavior,
%    which prints the result of any assignment that is not terminated
%    by a semicolon.
%
%    The second printout uses the fprintf() function explicitly.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer/string N, the order of the magic square.
%
  if ( ischar ( n ) )
    n = str2num ( n );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MAGICSQUARE_PRINT\n' );
  fprintf ( 1, '  MATLAB version.\n' );
%
%  We assume MATLAB will print M automatically.
%
  m = magic ( n )
%
%  Now we print it again.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Magic square of order %d:\n', n );
  fprintf ( 1, '\n' );
  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %2d', m(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end

