function magic3 ( n )

%*****************************************************************************80
%
%% MAGIC3 is a "main program" for a MATLAB compiler example.
%
%  Discussion:
%
%    This example is similar to magicsquare_print, but now it 
%    includes calls to the timestamp() function, which is a separate
%    .M file.
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

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MAGIC3\n' );
  fprintf ( 1, '  MATLAB version.\n' );
%
%  Compute the magic square.
%
  m = magic ( n );
%
%  Print the magic square.
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
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MAGIC3\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

