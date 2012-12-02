function x = r8gb_to_r8vec ( m, n, ml, mu, a )

%*****************************************************************************80
%
%% R8GB_TO_R8VEC copies a R8GB matrix to an R8VEC.
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
%    Input, real A(2*ML+MU+1,N), the array to be copied.
%
%    Output, real X((2*ML+MU+1)*N), the vector.
%
  for j = 1 : n

    ihi = min ( ml + mu, ml + mu + 1 - j );
    for i = 1 : ihi
      x(i+(j-1)*(2*ml+mu+1)) = 0.0;
    end

    ilo = max ( ihi + 1, 1 );
    ihi = min ( 2*ml+mu+1, ml+mu+m+1-j );
    for i = ilo : ihi
      x(i+(j-1)*(2*ml+mu+1)) = a(i,j);
    end

    ilo = ihi + 1;
    ihi = 2*ml+mu+1;
    for i = ilo : ihi
      x(i+(j-1)*(2*ml+mu+1)) = 0.0;
    end

  end

  return
end
