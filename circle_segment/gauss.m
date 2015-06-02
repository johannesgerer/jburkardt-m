function xw = gauss ( n, ab )

%*****************************************************************************80
%
%% GAUSS computes a Gauss quadrature rule.
%
%  Discussion:
%
%    Given a weight function w encoded by the nx2 array ab of the first n 
%    recurrence coefficients for the associated orthogonal polynomials, the 
%    first column of ab containing the n alpha coefficients and the second 
%    column the n beta coefficients, the call 
%      xw = gauss ( n, ab ) 
%    generates the nodes and weights xw of the n-point Gauss quadrature rule 
%    for the weight function w.
%
%    The nodes, in increasing order, are stored in the first column, the n 
%    corresponding weights in the second column, of the nx2 array xw.
%
%  Modified:
%
%    16 May 2013
%
%  Author:
%
%    Walter Gautschi
%
%  Reference:
%
%    Walter Gautschi,
%    Orthogonal Polynomials: Computation and Approximation,
%    Oxford, 2004,
%    ISBN: 0-19-850672-4,
%    LC: QA404.5 G3555.
%
%  Parameters:
%
%    Input, integer N, the order of the desired quadrature rule.
%
%    Input, real AB(N,2), the alpha and beta recurrence coefficients for the
%    othogonal polynomials associated with the weight function.
%
%    Output, real XW(N,2), the nodes, in column 1, and the weights, in
%    column 2, of the desired quadrature rule.
%
  n0 = size ( ab, 1 ); 

  if ( n0 < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GAUSS - Fatal error!\n' );
    fprintf ( 1, '  Input array AB is too short.\n' );
    error ( 'GAUSS - Fatal error!  Input array AB too short!' )
  end
%
%  Define the tridiagonal matrix J.
%
  J = zeros ( n );
  for i = 1 : n
    J(i,i) = ab(i,1);
  end

  for i = 2 : n
    J(i,i-1) = sqrt ( ab(i,2) );
    J(i-1,i) = J(i,i-1);
  end
%
%  Get the eigenvectors and eigenvalues.
%
  [ V, D ] = eig ( J );
%
%  Reorder the information by the size of the eigenvalues.
%
  [ D, I ] = sort ( diag ( D ) );
  V = V(:,I);
%
%  XW contains the weights in column 1, the nodes in column 2.
%
  xw = [ D ab(1,2) * V(1,:)'.^2 ];

  return
end

