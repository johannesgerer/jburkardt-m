function value = r8vec_ascends ( n, x )

%*****************************************************************************80
%
%% R8VEC_ASCENDS determines if an R8VEC is (weakly) ascending.
%
%  Example:
%
%    X = ( -8.1, 1.3, 2.2, 3.4, 7.5, 7.5, 9.8 )
%
%    value = TRUE
%
%    The sequence is not required to be strictly ascending.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the array.
%
%    Input, real X(N), the array to be examined.
%
%    Output, logical VALUE, is TRUE if the entries of X ascend.
%
  for i = 1 : n-1
    if ( x(i+1) < x(i) )
      value = 0;
      return
    end
  end

  value = 1;

  return
end
