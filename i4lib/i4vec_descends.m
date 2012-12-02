function value = i4vec_descends ( n, x )

%*****************************************************************************80
%
%% I4VEC_DESCENDS is TRUE if an I4VEC is decreasing.
%
%  Example:
%
%    X = ( 9, 7, 7, 3, 2, 1, -8 )
%
%    I4VEC_DESCENDS = TRUE
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the array.
%
%    Input, integer X(N), the array to be examined.
%
%    Output, logical VALUE, is TRUE if the entries of X descend.
%
  for i = 1 : n-1
    if ( x(i) < x(i+1) )
      value = 0;
      return
    end
  end

  value = 1;

  return
end
