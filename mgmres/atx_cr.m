function w = atx_cr ( n, nz_num, ia, ja, a, x )

%*****************************************************************************80
%
%% ATX_CR computes A'*x for a matrix stored in sparse compressed row form.
%
%  Discussion:
%
%    The Sparse Compressed Row storage format is used.
%
%    The matrix A is assumed to be sparse.  To save on storage, only
%    the nonzero entries of A are stored.  The vector JA stores the
%    column index of the nonzero value.  The nonzero values are sorted
%    by row, and the compressed row vector IA then has the property that
%    the entries in A and JA that correspond to row I occur in indices
%    IA[I] through IA[I+1]-1.
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
%    Input, integer IA(N+1), JA(NZ_NUM), the row and column indices
%    of the matrix values.  The row vector has been compressed.
%
%    Input, real A(NZ_NUM), the matrix values.
%
%    Input, real X(N), the vector to be multiplied by A'.
%
%    Output, real W(N), the value of A'*X.
%
  w = zeros(1,n);

  for i = 1 : n
    k1 = ia(i);
    k2 = ia(i+1) - 1;
    w(ja(k1:k2)) = w(ja(k1:k2)) + a(k1:k2) * x(i);
  end

  return
end
