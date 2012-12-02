function [ a, ifact ] = i4vec_red ( n, a, incx )

%*****************************************************************************80
%
%% I4VEC_RED divides out common factors in an I4VEC.
%
%  Discussion:
%
%    If A is a simple vector, then it has dimension N.
%
%    If A is a row of a matrix, then INCX will not be 1, and
%    the actual dimension of A is at least 1+(N-1)*INCX.
%
%    On output, the entries of A have no common factor
%    greater than 1.
%
%    If A is a simple vector, then INCX is 1, and we simply
%    check the first N entries of A.
%
%    If A is a row of a matrix, then INCX will be the number
%    of rows declared in the matrix, in order to allow us to
%    "skip" along the row.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer A(*), the vector to be reduced.
%
%    Input, integer INCX, the distance between successive
%    entries of A that are to be checked.
%
%    Output, integer A(*), the reduced vector.
%
%    Output, integer IFACT, the common factor that was divided out.
%

%
%  Find the smallest nonzero value.
%
  ifact = 0;
  indx = 1;

  for i = 1 : n

    if ( a(indx) ~= 0 )

      if ( ifact == 0 )
        ifact = abs ( a(indx) );
      else
        ifact = min ( ifact, abs ( a(indx) ) );
      end

    end

    indx = indx + incx;

  end

  if ( ifact == 0 )
    return
  end
%
%  Find the greatest common factor of the entire vector.
%
  indx = 1;
  for i = 1 : n
    ifact = i4_gcd ( a(indx), ifact );
    indx = indx + incx;
  end

  if ( ifact == 1 )
    return
  end
%
%  Divide out the common factor.
%
  indx = 1;
  for i = 1 : n
    a(indx) = a(indx) / ifact;
    indx = indx + incx;
  end

  return
end
