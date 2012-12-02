function x = p01_start ( i, x )

%*****************************************************************************80
%
%% P01_START returns a starting point for problem 1.
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
    x = 0.5 * pi;
  elseif ( i == 2 )
    x = pi;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P01_START - Fatal error!\n' );
    fprintf ( 1, '  Illegal starting point index = %d\n', i );
    error ( 'P01_START - Fatal error!' );
  end

  return
end
