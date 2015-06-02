function triangle_to_i4_test ( )

%*****************************************************************************80
%
%% TRIANGLE_TO_I4_TEST tests TRIANGLE_TO_I4.
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
  fprintf ( 1, 'TRIANGLE_TO_I4_TEST\n' );
  fprintf ( 1, '  TRIANGLE_TO_I4 converts a triangular index to a\n' );
  fprintf ( 1, '  linear one.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     J =>    K\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    for j = 1 : i
      k = triangle_to_i4 ( i, j );
      fprintf ( 1, '  %4d  %4d    %4d\n', i, j, k );
    end
    fprintf ( 1, '\n' );
  end

  return
end
