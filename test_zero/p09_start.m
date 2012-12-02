function x = p09_start ( i, x )

%*****************************************************************************80
%
%% P09_START returns a starting point for problem 9.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the index of the starting point.
%
%    Output, real X, the starting point.
%
  if ( i == 1 )
    x = 6.25 + 5.0;
  elseif ( i == 2 )
    x = 6.25 - 1.0;
  elseif ( i == 3 )
    x = 6.25 + 0.1;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P09_START - Fatal error!\n' );
    fprintf ( 1, '  Illegal starting point index = %d\n', i );
    error ( 'P09_START - Fatal error!' );
  end

  return
end
