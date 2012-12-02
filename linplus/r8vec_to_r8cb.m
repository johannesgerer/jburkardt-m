function a = r8vec_to_r8cb ( m, n, ml, mu, x )

%*****************************************************************************80
%
%% R8VEC_TO_R8CB copies an R8VEC into a R8CB matrix.
%
%  Discussion:
%
%    In C++ and FORTRAN, this routine is not really needed.  In MATLAB,
%    a data item carries its dimensionality implicitly, and so cannot be
%    regarded sometimes as a vector and sometimes as an array.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2004
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
%    Input, real X((ML+MU+1)*N), the vector to be copied into the array.
%
%    Output, real A(ML+MU+1,N), the array.
%
  for j = 1 : n
    for i = 1 : ml + mu + 1

      if ( 1 <= i + j - mu - 1 & i + j - mu - 1 <= m )
        a(i,j) = x(i+(ml+mu+1)*(j-1));
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
