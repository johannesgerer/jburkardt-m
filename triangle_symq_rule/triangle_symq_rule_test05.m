function triangle_symq_rule_test05 ( degree, numnodes, vert1, vert2, vert3 )

%*****************************************************************************80
%
%% TRIANGLE_SYMQ_RULE_TEST05 calls TRIASYMQ for a quadrature rule of given order and region.
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
%    Input, integer DEGREE, the desired total polynomial degree 
%    exactness of the quadrature rule.  0 <= DEGREE <= 50.
%
%    Input, integer NUMNODES, the number of nodes to be used by the rule.
%
%    Input, real VERT1(2), VERT2(2), VERT3(2), the
%    vertices of the triangle.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_SYMQ_RULE_TEST05\n' );
  fprintf ( 1, '  Compute a quadrature rule for a triangle.\n' );
  fprintf ( 1, '  Check it by integrating orthonormal polynomials.\n' );
  fprintf ( 1, '  Polynomial exactness degree DEGREE = %d\n', degree );

  area = triangle_area ( vert1, vert2, vert3 );
%
%  Retrieve a symmetric quadrature rule.
%
  [ rnodes, weights ] = triasymq ( degree, vert1, vert2, vert3,  numnodes );
%
%  Construct the matrix of values of the orthogonal polynomials
%  at the user-provided nodes
%
  npols = ( ( degree + 1 ) * ( degree + 2 ) ) / 2;

  rints = zeros ( npols, 1 );

  for i = 1 : numnodes
    z(1) = rnodes(1,i);
    z(2) = rnodes(2,i);
    r = triangle_to_ref ( vert1, vert2, vert3, z );
    pols = ortho2eva ( degree, r );
    rints(1:npols) = rints(1:npols) + weights(i) * pols(1:npols);
  end

  scale = sqrt ( sqrt ( 3.0 ) ) / sqrt ( area );
  rints(1:npols) = rints(1:npols) * scale;

  d = ( rints(1) - sqrt ( area ) )^2 + sum ( rints(2:npols).^2 );
  d = sqrt ( d ) / npols;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  RMS integration error = %g\n', d );

  return
end
