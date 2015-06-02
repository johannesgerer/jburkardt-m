function [ nf, xf, wf, vf ] = line_fekete_monomial ( m, a, b, n, x )

%*****************************************************************************80
%
%% LINE_FEKETE_MONOMIAL computes approximate Fekete points in an interval [A,B].
%
%  Discussion:
%
%    We use the uniform weight and the monomial basis:
%
%      P(j) = x^(j-1)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alvise Sommariva, Marco Vianello,
%    Computing approximate Fekete points by QR factorizations of Vandermonde 
%    matrices,
%    Computers and Mathematics with Applications,
%    Volume 57, 2009, pages 1324-1336.
%    
%  Parameters:
%
%    Input, integer M, the number of basis polynomials.
%
%    Input, real A, B, the endpoints of the interval.
%
%    Input, integer N, the number of sample points.
%    M <= N.
%
%    Input, real X(N), the coordinates of the sample points.
%
%    Output, integer NF, the number of Fekete points.
%    If the computation is successful, NF = M.
%
%    Output, real XF(NF), the coordinates of the Fekete points.
%
%    Output, real WF(NF), the weights of the Fekete points.
%
%    Output, real VF(NF,M), the nonsingular Vandermonde submatrix.
%
  if ( n < m )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINE_FEKETE_MONOMIAL - Fatal error!\n' );
    fprintf ( 1, '  N < M.\n' );
    error ( 'LINE_FEKETE_MONOMIAL - Fatal error!' );
  end
%
%  Destroy all row vectors!
%
  x = x(:);
%
%  Moments of monomials:
%
  mom = line_monomial_moments ( a, b, m );
%
%  Form the rectangular Vandermonde matrix V for the polynomial basis.
%
  v = zeros ( m, n );

  v(1,1:n) = 1.0;
  for i = 2 : m
    v(i,1:n) = v(i-1,1:n) .* x(1:n)';
  end
%
%  Solve the system for the weights W.
%
  w = v \ mom;
%
%  Locate nonzero W's.
%
  ind = find ( w ~= 0.0 );
%
%  Retain data associated with nonzero W's.
%
  nf = length ( ind );
  xf = x ( ind );
  wf = w ( ind );
  vf = v ( :, ind );

  return
end

