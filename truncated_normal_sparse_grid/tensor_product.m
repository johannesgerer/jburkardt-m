function [ nodes, weights ] = tensor_product ( n1D, w1D )

%*****************************************************************************80
%
%% TENSOR_PRODUCT generates a tensor product quadrature rule.
%
%  Discussion:
%
%    The Kronecker product of an K by L matrix A and an M by N matrix B
%    is the K*M by L*N matrix formed by
%
%      a(1,1) * B,  a(1,2) * B,  ..., a(1,l) * B
%      a(2,1) * B,  a(2,2) * B,  ..., a(2,l) * B
%      ..........   ..........   .... ..........
%      a(k,1) * B,  a(k,2) * B,  ..., a(k,l) * B
%
%    Thanks to Ivan Ukhov for pointing out a tiny but deadly typographical
%    error, 17 July 2012.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2012
%
%  Author:
%
%    Original MATLAB version by Florian Heiss, Viktor Winschel.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Florian Heiss, Viktor Winschel,
%    Likelihood approximation by numerical integration on sparse grids,
%    Journal of Econometrics,
%    Volume 144, 2008, pages 62-80.
%
%  Parameters:
%
%    Input, cell array n1D{}, contains K sets of 1D nodes.
%    The I-th set has dimension N(I).
%    Each entry of the cell array should be a column vector.
%
%    Input, cell array w1D{}, contains K sets of 1D weights.
%
%    Output, real nodes(NPROD,K), the tensor product nodes.
%    NPROD = product ( N(1) * ... * N(K) ).
%
%    Output, real weights(NPROD), the tensor product weights.
%
  dimension = length ( n1D );

  nodes = n1D{1};
  nodes = nodes ( : );
  weights = w1D{1};
  weights = weights ( : );

  for j = 2 : dimension

    newnodes = n1D{j};
    newnodes = newnodes ( : );

    a = ones ( size ( newnodes, 1 ), 1 );
    b = ones ( size ( nodes, 1 ), 1 );
    c = kron ( nodes, a );
    d = kron ( b, newnodes );

    nodes = [ c, d ];

    newweights = w1D{j};
    newweights = newweights ( : );
    weights = kron ( weights, newweights );

  end

  return
end
