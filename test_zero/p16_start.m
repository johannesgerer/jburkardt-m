function x = p16_start ( i, x )

%*****************************************************************************80
%
%% P16_START returns a starting point for problem 16.
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
  e = 0.8;
  m = 5.0;

  if ( i == 1 )
    x = 0.0;
  elseif ( i == 2 )
    x = m;
  elseif ( i == 3 )
    x = m + 180.0;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P16_START - Fatal error!\n' );
    fprintf ( 1, '  Illegal starting point index = %d\n', i );
    error ( 'P16_START - Fatal error!' );
  end

  return
end
