function x = p14_root ( i )

%*****************************************************************************80
%
%% P14_ROOT returns a root for problem 14.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the index of the requested root.
%
%    Output, real X, the value of the root.
%
  if ( i == 1 )
    x = - 0.1534804948126991;
  elseif ( i == 2 )
    x = 1.8190323925159182;
  elseif ( i == 3 )
    x = 2.1274329318603367;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P14_ROOT - Fatal error!\n' );
    fprintf ( 1, '  Illegal root index = %d\n', i );
    error ( 'P14_ROOT - Fatal error!' );
  end

  return
end
