function triangle_symq_rule_test02 ( degree, numnodes, vert1, vert2, vert3 )

%*****************************************************************************80
%
%% TRIANGLE_SYMQ_RULE_TEST02 calls TRIASYMQ for a quadrature rule of given order and region.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    27 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, integer DEGREE, the desired total polynomial degree exactness
%    of the quadrature rule.  0 <= DEGREE <= 50.
%
%    Input, integer NUMNODES, the number of nodes to be used by the rule.
%
%    Input, real VERT1(2), VERT2(2), VERT3(2), the
%    vertices of the triangle.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_SYMQ_RULE_TEST02\n' );
  fprintf ( 1, '  Symmetric quadrature rule for a triangle.\n' );
  fprintf ( 1, '  Polynomial exactness degree DEGREE = %d\n', degree );

  area = triangle_area ( vert1, vert2, vert3 );
%
%  Retrieve and print a symmetric quadrature rule.
%
  [ rnodes, weights ] = triasymq ( degree, vert1, vert2, vert3, numnodes );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  NUMNODES = %d', numnodes );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     J      W               X               Y\n' );
  fprintf ( 1, '\n' );
  for j = 1 : numnodes
    fprintf ( 1, '  %4d  %14.6g  %14.6g  %14.6g\n', ...
      j, weights(j), rnodes(1,j), rnodes(2,j) );
  end

  d = sum ( weights(1:numnodes) );

  fprintf ( 1, '   Sum  %14.6g\n', d );
  fprintf ( 1, '  Area  %14.6g\n', area );

  return
end

