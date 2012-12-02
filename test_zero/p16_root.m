function x = p16_root ( i )

%*****************************************************************************80
%
%% P16_ROOT returns a root for problem 16.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'P16_ROOT - Fatal error!\n' );
  fprintf ( 1, '  Illegal root index = %d\n', i );
  error ( 'P16_ROOT - Fatal error!' );

  return
end
