function x = p19_start ( i, x )

%*****************************************************************************80
%
%% P19_START returns a starting point for problem 19.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2013
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
    x = 0.0;
  elseif ( i == 2 )
    x = 1.0;
  elseif ( i == 3 )
    x = 0.5;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P19_START - Fatal error!\n' );
    fprintf ( 1, '  Illegal starting point index = %d\n', i );
    error ( 'P19_START - Fatal error!' );
  end

  return
end
