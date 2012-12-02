function x = p18_root ( i )

%*****************************************************************************80
%
%% P18_ROOT returns a root for problem 18.
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
%    Input, integer I, the index of the requested root.
%
%    Output, real X, the value of the root.
%
  if ( i == 1 )
    x = 1.0;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P18_ROOT - Fatal error!\n' );
    fprintf ( 1, '  Illegal root index = %d\n', i );
    error ( 'P18_ROOT - Fatal error!' );
  end

  return
end
