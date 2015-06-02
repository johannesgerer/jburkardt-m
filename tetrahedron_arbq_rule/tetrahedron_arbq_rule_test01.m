function tetrahedron_arbq_rule_test01 ( degree, n )

%*****************************************************************************80
%
%% TETRAHEDRON_ARBQ_RULE_TEST01 calls TETRAHEDRON_ARBQ for a quadrature rule of given order.
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
%    of the quadrature rule.
%
%    Input, integer N, the number of nodes.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_ARBQ_RULE_TEST01\n' );
  fprintf ( 1, '  Quadrature rule for the tetrahedron.\n' );
  fprintf ( 1, '  Polynomial exactness degree DEGREE = %d\n', degree );

  volume = sqrt ( 8.0 ) / 3.0;
%
%  Retrieve and print a symmetric quadrature rule.
%
  [ x, w ] = tetrahedron_arbq ( degree, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes N = %d\n', n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     J  W       X       Y      Z\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %4d  %14.6g  %14.6g  %14.6g  %14.6g\n', ...
      j, w(j), x(1,j), x(2,j), x(3,j) );
  end

  d = sum ( w(1:n) );

  fprintf ( 1, '   Sum    %g\n', d );
  fprintf ( 1, '  Volume  %g\n', volume );

  return
end
