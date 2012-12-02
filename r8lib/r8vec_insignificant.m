function value = r8vec_insignificant ( n, r, s )

%*****************************************************************************80
%
%% R8VEC_INSIGNIFICANT determines if an R8VEC is insignificant.
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
%    Input, integer N, the dimension of the vectors.
%
%    Input, real R(N), the vector to be compared against.
%
%    Input, real S(N), the vector to be compared.
%
%    Output, logical R8VEC_INSIGNIFICANT, is TRUE if S is insignificant
%    compared to R.
%
  value = 1;

  for i = 1 : n

    t = r(i) + s(i);
    tol = eps * abs ( r(i) );

    if ( tol < abs ( r(i) - t ) )
      value = 0;
      exit;
    end

  end

  return
end
