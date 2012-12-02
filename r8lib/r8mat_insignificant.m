function value = r8mat_insignificant ( m, n, r, s )

%*****************************************************************************80
%
%% R8MAT_INSIGNIFICANT determines if an R8MAT is insignificant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the dimension of the matrices.
%
%    Input, real R(M,N), the vector to be compared against.
%
%    Input, real S(M,N), the vector to be compared.
%
%    Output, logical R8MAT_INSIGNIFICANT, is TRUE if S is insignificant
%    compared to R.
%
  value = 1;

  for j = 1 : n
    for i = 1 : m

      t = r(i,j) + s(i,j);
      tol = eps * abs ( r(i,j) );

      if ( tol < abs ( r(i,j) - t ) )
        value = 0;
        break
      end

    end
  end
  
  return
end
