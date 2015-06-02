function i4_to_pascal_degree_test ( )

%*****************************************************************************80
%
%% I4_TO_PASCAL_DEGREE_TEST tests I4_TO_PASCAL_DEGREE.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/i4_to_pascal_degree_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_TO_PASCAL_DEGREE_TEST\n' );
  fprintf ( 1, '  I4_TO_PASCAL_DEGREE converts a linear index to\n' );
  fprintf ( 1, '  the degree of the corresponding Pascal triangle indices.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     K  =>   D\n' );
  fprintf ( 1, '\n' );

  for k = 1 : 20

    d = i4_to_pascal_degree ( k );

    fprintf ( 1, '  %4d    %4d\n', k, d );

  end

  return
end
