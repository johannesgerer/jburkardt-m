function tetrahedron_arbq_rule_test03 ( degree, n, header )

%*****************************************************************************80
%
%% TETRAHEDRON_ARBQ_RULE_TEST03 gets a rule and creates GNUPLOT input files.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    10 July 2014
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
  fprintf ( 1, 'TETRAHEDRON_ARBQ_RULE_TEST03\n' );
  fprintf ( 1, '  Get a quadrature rule for the tetrahedron.\n' );
  fprintf ( 1, '  Set up GNUPLOT graphics input.\n' );
  fprintf ( 1, '  Polynomial exactness degree DEGREE = %d\n', degree );
%
%  Retrieve a symmetric quadrature rule.
%
   [ x, w ] = tetrahedron_arbq ( degree, n );
%
%  Create files for input to GNUPLOT.
%
  tetrahedron_arbq_gnuplot ( n, x, header );

  return
end
