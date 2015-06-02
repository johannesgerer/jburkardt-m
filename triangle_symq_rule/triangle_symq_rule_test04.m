function triangle_symq_rule_test04 ( degree, numnodes, vert1, vert2, vert3, ...
  header )

%*****************************************************************************80
%
%% TRIANGLE_SYMQ_RULE_TEST04 gets a rule and writes it to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    20 June 2014
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
%    Input, string HEADER, an identifier for the filenames.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_SYMQ_RULE_TEST04\n' );
  fprintf ( 1, '  Get a quadrature rule for a triangle.\n' );
  fprintf ( 1, '  Then write it to a file.\n' );
  fprintf ( 1, '  Polynomial exactness degree DEGREE = %d\n', degree );
%
%  Retrieve a symmetric quadrature rule.
%
  [ rnodes, weights ] = triasymq ( degree, vert1, vert2, vert3, numnodes );
%
%  Write the points and weights to a file.
%
  rule_filename = strcat ( header, '.txt' );

  rule_unit = fopen ( rule_filename, 'wt' );
  for i = 1 : numnodes
    fprintf ( rule_unit, '21.15e  21.15e  21.15e\n', ...
      rnodes(1,i), rnodes(2,i), weights(i) );
  end
  fclose ( rule_unit );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Quadrature rule written to file "%s".\n', rule_filename );

  return
end
