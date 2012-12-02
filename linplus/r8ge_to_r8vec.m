function x = r8ge_to_r8vec ( m, n, a )

%*****************************************************************************80
%
%% R8GE_TO_R8VEC copies an R8GE matrix to an R8VEC.
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
%    16 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, real A(M,N), the array to be copied.
%
%    Output, real X(M*N), the vector.
%
  k = 0;
  for j = 1 : n
    for i = 1 : m
      k = k + 1;
      x(k) = a(i,j);
    end
  end

  return
end
