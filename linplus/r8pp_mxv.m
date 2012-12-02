function b = r8pp_mxv ( n, a, x )

%*****************************************************************************80
%
%% R8PP_MXV multiplies a R8PP matrix times a vector.
%
%  Discussion:
%
%    The R8PP storage format is appropriate for a symmetric positive
%    definite matrix.  Only the upper triangle of the matrix is stored,
%    by successive partial columns, in an array of length (N*(N+1))/2,
%    which contains (A11,A12,A22,A13,A23,A33,A14,...,ANN)  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A((N*(N+1))/2), the R8PP matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product A * x.
%
  for i = 1 : n
    b(i) = 0.0E+00;
    for j = 1 : i-1
      k = j + ( i * ( i - 1 ) ) / 2;
      b(i) = b(i) + a(k) * x(j);
    end
    for j = i : n
      k = i + ( j * ( j - 1 ) ) / 2;
      b(i) = b(i) + a(k) * x(j);
    end
  end

  return
end
