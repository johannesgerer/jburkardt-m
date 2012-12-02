function [ x, nz, indx ] = i4vec_nonzero_first ( n, x )

%*****************************************************************************80
%
%% I4VEC_NONZERO_FIRST left-shifts all nonzeros in an I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of integer values.
%
%    The routine preserves the ordering of the nonzero entries.  It counts
%    the nonzeros, and returns an index vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer X(N), the vector to be shifted.
%
%    Output, integer X(N), the shifted vector.
%
%    Output, integer NZ, the number of nonzero entries in the vector.
%
%    Output, integer INDX(N), contains the original location of each entry.
%
  nz = 0;

  for j = 1 : n
    indx(j) = j;
  end

  j = 0;

  while ( j < n )

    j = j + 1;

    if ( x(j) ~= 0 )

      nz = nz + 1;

      if ( nz ~= j )

        x(nz) = x(j);
        x(j) = 0;

        k = indx(nz);
        indx(nz) = j;
        indx(j) = k;

      end
    end
  end

  return
end
