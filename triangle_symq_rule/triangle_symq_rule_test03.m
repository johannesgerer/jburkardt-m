function triangle_symq_rule_test03 ( degree, numnodes, vert1, vert2, vert3, ...
  header )

%*****************************************************************************80
%
%% TRIANGLE_SYMQ_RULE_TEST03 calls TRIASYMQ_GNUPLOT to generate graphics files.
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
%    Input, string HEADER, an identifier for the graphics filenames.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_SYMQ_RULE_TEST03\n' );
  fprintf ( 1, '  TRIASYMQ_GNUPLOT creates gnuplot graphics files.\n' );
  fprintf ( 1, '  Polynomial exactness degree DEGREE = %d\n', degree );

  [ rnodes, weights ] = triasymq ( degree, vert1, vert2, vert3, numnodes );

  fprintf ( 1, '  Number of nodes = %d\n', numnodes );

  triasymq_gnuplot ( vert1, vert2, vert3, numnodes, rnodes, header );

  return
end
