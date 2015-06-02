function tetrahedron_arbq_rule_test04 ( degree, n )

%*****************************************************************************80
%
%% TETRAHEDRON_ARBQ_RULE_TEST04 gets a rule and tests its accuracy.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_ARBQ_RULE_TEST04\n' );
  fprintf ( 1, '  Get a quadrature rule for the tetrahedron.\n' );
  fprintf ( 1, '  Test its accuracy.\n' );
  fprintf ( 1, '  Polynomial exactness degree DEGREE = %d\n', degree );
%
%  Retrieve a symmetric quadrature rule.
%
  [ x, w ] = tetrahedron_arbq ( degree, n );

  npols = ( ( degree + 1 ) * ( degree + 2 ) * ( degree + 3 ) ) / 6;

  rints(1:npols) = 0.0;

  for i = 1 : n

    z(1) = x(1,i);
    z(2) = x(2,i);
    z(3) = x(3,i);

    pols = ortho3eva ( degree, z );

    for j = 1 : npols
      rints(j) = rints(j) + w(i) * pols(j);
    end

  end

  volume = sqrt ( 8.0D+00 ) / 3.0D+00;
  d = 0.0;
  d = ( rints(1) - sqrt ( volume ) )^2;
  for i = 2 : npols
    d = d + rints(i)^2;
  end
  d = sqrt ( d ) / ( npols );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  RMS error = %g\n', d );

  return
end

