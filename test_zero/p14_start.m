function x = p14_start ( i, x )

%*****************************************************************************80
%
%% P14_START returns a starting point for problem 14.
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
    x = 3.0;
  elseif ( i == 2 )
    x = - 0.5;
  elseif ( i == 3 )
    x = 0.0;
  elseif ( i == 4 )
    x = 2.12742;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P14_START - Fatal error!\n' );
    fprintf ( 1, '  Illegal starting point index = %d\n', i );
    error ( 'P14_START - Fatal error!' );
  end

  return
end
