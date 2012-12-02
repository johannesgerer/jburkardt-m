function lambda = r8ci_eval ( n, a )

%*****************************************************************************80
%
%% R8CI_EVAL returns the eigenvalues of a R8CI matrix.
%
%  Discussion:
%
%    The R8CI storage format is used for an N by N circulant matrix.
%    An N by N circulant matrix A has the property that the entries on
%    row I appear again on row I+1, shifted one position to the right,
%    with the final entry of row I appearing as the first of row I+1.
%    The format simply records the first row of the matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Davis,
%    Circulant Matrices,
%    Wiley, 1979.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N), the R8CI matrix.
%
%    Output, complex LAMBDA(N), the eigenvalues.
%
  w(1:n) = c8vec_unity ( n );

  lambda(1:n) = a(n);

  for i = n-1 : -1 : 1
    lambda(1:n) = lambda(1:n) .* w(1:n) + a(i);
  end

  lambda = c8vec_sort_a2 ( n, lambda );

  return
end
