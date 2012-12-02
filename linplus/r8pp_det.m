function det = r8pp_det ( n, a_lu )

%*****************************************************************************80
%
%% R8PP_DET computes the determinant of a R8PP matrix factored by R8PP_FA.
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
%    25 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A_LU((N*(N+1))/2), the LU factors from R8PP_FA.
%
%    Output, real DET, the determinant of A.
%
  det = 1.0;

  k = 0;
  for i = 1 : n
    k = k + i;
    det = det * a_lu(k);
  end

  return
end
