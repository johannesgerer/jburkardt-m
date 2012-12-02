function x = p18_start ( i, x )

%*****************************************************************************80
%
%% P18_START returns a starting point for problem 18.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2011
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
    x = 0.990;
  elseif ( i == 2 )
    x = 1.013;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P18_START - Fatal error!\n' );
    fprintf ( 1, '  Illegal starting point index = %d\n', i );
    error ( 'P18_START - Fatal error!' );
  end

  return
end
