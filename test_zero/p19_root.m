function x = p19_root ( i )

%*****************************************************************************80
%
%% P19_ROOT returns a root for problem 19.
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
%    Input, integer I, the index of the requested root.
%
%    Output, real X, the value of the root.
%
  if ( i == 1 )
    x = 0.33186603357456253747;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P19_ROOT - Fatal error!\n' );
    fprintf ( 1, '  Illegal root index = %d\n', i );
    error ( 'P19_ROOT - Fatal error!' );
  end

  return
end
