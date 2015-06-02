function [ nf, xf, wf, vf ] = line_fekete_chebyshev ( m, a, b, n, x )

%*****************************************************************************80
%
%% LINE_FEKETE_CHEBYSHEV computes approximate Fekete points in an interval [A,B].
%
%  Discussion:
%
%    We use the Chebyshev basis.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Len Bos, Norm Levenberg,
%    On the calculation of approximate Fekete points: the univariate case,
%    Electronic Transactions on Numerical Analysis, 
%    Volume 30, pages 377-397, 2008.
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
%    Output, real VF(NF,N), the nonsingular Vandermonde submatrix.
%
  if ( n < m )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINE_FEKETE_CHEBYSHEV - Fatal error!\n' );
    fprintf ( 1, '  N < M.\n' );
    error ( 'LINE_FEKETE_CHEBYSHEV - Fatal error!' );
  end
%
%  Compute the Chebyshev-Vandermonde matrix.
%
  v = cheby_van1 ( m, a, b, n, x );
%
%  MOM(I) = Integral ( A <= x <= B ) Tab(A,B,I;x) dx
%
  mom = zeros ( m, 1 );
  mom(1) = pi * ( b - a ) / 2.0;
%
%  Get the weights.
%
  w = v \ mom;

  ind = find ( w ~= 0.0 );

  nf = length ( ind );
  xf = x(ind);
  wf = w(ind);
  vf = ( v(:,ind) )';

  return
end

