function cube_arbq_rule_test02 ( degree, n, header )

%*****************************************************************************80
%
%% CUBE_ARBQ_RULE_TEST02 gets a rule and writes it to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    08 July 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
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
%    of the quadrature rule.  0 <= DEGREE <= 15.
%
%    Input, integer N, the number of nodes to be used by the rule.
%
%    Input, string HEADER, an identifier for the filenames.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CUBE_ARBQ_RULE_TEST02\n' );
  fprintf ( 1, '  Get a quadrature rule for the symmetric cube.\n' );
  fprintf ( 1, '  Then write it to a file.\n' );
  fprintf ( 1, '  Polynomial exactness degree DEGREE = %d\n', degree );
%
%  Retrieve a symmetric quadrature rule.
%
  [ x, w ] = cube_arbq ( degree, n );
%
%  Write the points and weights to a file.
%
  rule_filename = strcat ( header, '.txt' );

  rule_unit = fopen ( rule_filename, 'wt' );
  for i = 1 : n
    fprintf ( rule_unit, '%g  %g  %g  %g\n', x(1,i), x(2,i), x(3,i), w(i) );
  end
  fclose ( rule_unit );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Quadrature rule written to file "%s"\n', rule_filename );

  return
end
