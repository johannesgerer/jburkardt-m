function x = p12_start ( i, x )

%*****************************************************************************80
%
%% P12_START returns a starting point for problem 12.
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
    x = 2.0;
  elseif ( i == 2 )
    x = 0.50;
  elseif ( i == 3 )
    x = 4.0;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P12_START - Fatal error!\n' );
    fprintf ( 1, '  Illegal starting point index = %d\n', i );
    error ( 'P12_START - Fatal error!' );
  end

  return
end
