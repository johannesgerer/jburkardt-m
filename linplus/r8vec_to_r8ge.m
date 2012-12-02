function a = r8vec_to_r8ge ( m, n, x )

%*****************************************************************************80
%
%% R8VEC_TO_R8GE copies an R8VEC into a R8GE matrix.
%
%  Discussion:
%
%    In C++  and FORTRAN, this routine is not really needed.  In MATLAB,
%    a data item carries its dimensionality implicitly, and so cannot be
%    regarded sometimes as a vector and sometimes as an array.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, real X(M*N), the vector to be copied into the array.
%
%    Output, real A(M,N), the array.
%
  a = zeros ( m, n );
  
  k = 0;
  for j = 1 : n
    for i = 1 : m
      k = k + 1;
      a(i,j) = x(k);
    end
  end

  return
end
