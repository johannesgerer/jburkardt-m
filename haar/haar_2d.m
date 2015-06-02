function v = haar_2d ( u )

%*****************************************************************************80
%
%% HAAR_2D computes the Haar transform of an array.
%
%  Discussion:
%
%    Thanks to Stephen Becker for pointing out that a previous version of
%    the haar_2d code was not inverted by haar_2d_inverse in cases where
%    M and N were not powers of 2, 05 March 2014.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real U(M,N), the vector to be transformed.
%
%    Output, real V(M,N), the transformed vector.
%
  [ m, n ] = size ( u );

  v = u;

  s = sqrt ( 2.0 );

  w = zeros ( m, n );
%
%  Determine K, the largest power of 2 such that K <= M.
%
  k = 1;
  while ( k * 2 <= m )
    k = k * 2;
  end
%
%  Transform all columns.
%
  while ( 1 < k )
  
    k = floor ( k / 2 );

    w(  1:  k,:) = ( v(1:2:2*k-1,:) + v(2:2:2*k,:) ) / s;
    w(k+1:k+k,:) = ( v(1:2:2*k-1,:) - v(2:2:2*k,:) ) / s;

    v(1:2*k,:) = w(1:2*k,:);

  end
%
%  Determine K, the largest power of 2 such that K <= N.
%
  k = 1;
  while ( k * 2 <= n )
    k = k * 2;
  end
%
%  Transform all rows.
%
  while ( 1 < k )
  
    k = floor ( k / 2 );

    w(:,  1:  k) = ( v(:,1:2:2*k-1) + v(:,2:2:2*k) ) / s;
    w(:,k+1:k+k) = ( v(:,1:2:2*k-1) - v(:,2:2:2*k) ) / s;

    v(:,1:2*k) = w(:,1:2*k);

  end

  return
end

