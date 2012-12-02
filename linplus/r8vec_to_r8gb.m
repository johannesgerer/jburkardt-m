function a = r8vec_to_r8gb ( m, n, ml, mu, x )

%*****************************************************************************80
%
%% R8VEC_TO_R8GB copies an R8VEC into a R8GB matrix.
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
%    17 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%
%    Input, real X((2*ML+MU+1)*N), the vector to be copied into the array.
%
%    Output, real A(2*ML+MU+1,N), the array.
%
  for j = 1 : n
    for i = 1 : 2 * ml + mu + 1

      if ( 1 <= i + j - ml - mu - 1 & i + j - ml - mu - 1 <= m )
        a(i,j) = x(i+(2*ml+mu+1)*(j-1));
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
