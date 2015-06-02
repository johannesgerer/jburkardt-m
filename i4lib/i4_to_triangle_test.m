function i4_to_triangle_test ( )

%*****************************************************************************80
%
%% I4_TO_TRIANGLE_TEST tests I4_TO_TRIANGLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_TO_TRIANGLE_TEST\n' );
  fprintf ( 1, '  I4_TO_TRIANGLE converts a linear index to a\n' );
  fprintf ( 1, '  triangular one.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     K  =>   I     J\n' );
  fprintf ( 1, '\n' );

  for k = 1 : 20

    [ i, j ] = i4_to_triangle ( k );

    fprintf ( 1, '  %4d    %4d  %4d\n', k, i, j );

  end

  return
end
