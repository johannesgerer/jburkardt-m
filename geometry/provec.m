function [ vecn, vecnm ] = provec ( m, n, base, vecm )

%*****************************************************************************80
%
%% PROVEC projects a vector from M space into N space.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the dimension of the higher order space.
%
%    Input, integer N, the dimension of the lower order space.
%
%    Input, real BASE(M,N).  The columns of BASE contain
%    N vectors, each of length M, which form the basis for
%    a space of dimension N.
%
%    Input, real VECM(M), is an M dimensional vector.
%
%    Output, real VECN(N), the projection of VECM into the
%    lower dimensional space.  These values represent
%    coordinates in the lower order space.
%
%    Output, real VECNM(M), the projection of VECM into the
%    lower dimensional space, but using coordinates in
%    the higher dimensional space.
%

%
%  For each vector, remove all projections onto previous vectors,
%  and then normalize.  This should result in a matrix BASE
%  whose columns are orthonormal.
%
  for j = 1 : n

    for i = 1 : j-1

      temp = base(1:m,i)' * base(1:m,j);

      base(1:m,j) = base(1:m,j) - temp * base(1:m,i);

    end

    temp = sqrt ( sum ( base(1:m,j).^2 ) );

    if ( 0.0 < temp )
      base(1:m,j) = base(1:m,j) / temp;
    end

  end
%
%  Compute the coordinates of the projection of the vector
%  simply by taking dot products.
%
  for j = 1 : n
    vecn(j) = vecm(1:m) * base(1:m,j);
  end
%
%  Compute the coordinates of the projection in terms of
%  the original space.
%
  for i = 1 : m
    vecnm(i) = base(i,1:n) * vecn(1:n)';
  end

  return
end
