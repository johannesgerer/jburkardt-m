function w = atx_st ( n, nz_num, ia, ja, a, x )

%*****************************************************************************80
%
%% ATX_ST computes A'*x for a matrix stored in sparse triplet form.
%
%  Discussion:
%
%    The matrix A is assumed to be sparse.  To save on storage, only
%    the nonzero entries of A are stored.  For instance, the K-th nonzero
%    entry in the matrix is stored by:
%
%      A(K) = value of entry,
%      IA(K) = row of entry,
%      JA(K) = column of entry.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%   
%  Modified:
%
%    25 March 2008
%
%  Author:
%
%    Original C version by Lili Ju
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Richard Barrett, Michael Berry, Tony Chan, James Demmel,
%    June Donato, Jack Dongarra, Victor Eijkhout, Roidan Pozo,
%    Charles Romine, Henk van der Vorst,
%    Templates for the Solution of Linear Systems:
%    Building Blocks for Iterative Methods,
%    SIAM, 1994.
%    ISBN: 0898714710,
%    LC: QA297.8.T45.
%
%    Tim Kelley,
%    Iterative Methods for Linear and Nonlinear Equations,
%    SIAM, 2004,
%    ISBN: 0898713528,
%    LC: QA297.8.K45.
%
%    Yousef Saad,
%    Iterative Methods for Sparse Linear Systems,
%    Second Edition,
%    SIAM, 2003,
%    ISBN: 0898715342,
%    LC: QA188.S17.
%
%  Parameters:
%
%    Input, integer N, the order of the system.
%
%    Input, integer NZ_NUM, the number of nonzeros.
%
%    Input, integer IA(NZ_NUM), JA(NZ_NUM), the row and column indices
%    of the matrix values.
%
%    Input, real A(NZ_NUM), the matrix values.
%
%    Input, real X(N), the vector to be multiplied by A'.
%
%    Output, real W(N), the value of A'*X.
%
  w = zeros(1,n);

  for k = 1 : nz_num
    i = ia(k);
    j = ja(k);
    w(j) = w(j) + a(k) * x(i);
  end

  return
end
