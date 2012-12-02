function b = r8pp_to_r8ge ( n, a )

%*****************************************************************************80
%
%% R8PP_TO_R8GE copies a R8PP matrix to a R8GE matrix.
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
%    Output, real B(N,N), the R8GE matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( i <= j )
        b(i,j) = a(i+(j*(j-1))/2);
      else
        b(i,j) = a(j+(i*(i-1))/2);
      end
    end
  end

  return
end
