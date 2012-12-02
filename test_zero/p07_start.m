function x = p07_start ( i, x )

%*****************************************************************************80
%
%% P07_START returns a starting point for problem 7.
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
    x = 1.0;
  elseif ( i == 2 )
    x = -1000.0;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P07_START - Fatal error!\n' );
    fprintf ( 1, '  Illegal starting point index = %d\n', i );
    error ( 'P07_START - Fatal error!' );
  end

  return
end
