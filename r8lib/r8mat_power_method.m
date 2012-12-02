function [ r, v ] = r8mat_power_method ( n, a, v )

%*****************************************************************************80
%
%% R8MAT_POWER_METHOD applies the power method to a matrix.
%
%  Discussion:
%
%    If the power method has not converged, then calling the routine
%    again immediately with the output from the previous call will
%    continue the iteration.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real A(N,N), the matrix.
%
%    Input, real V(N), an estimate for the eigenvector.
%
%    Output, real R, V(N), the improved estimated eigenvalue
%    and eigenvector.
%
  it_eps = 0.0001;
  it_max = 100;
  it_min = 10;
  eps = sqrt ( r8_epsilon ( ) );

  r = sqrt ( sum ( v(1:n).^2 ) );

  if ( r == 0.0 )
    v(1:n) = 1.0;
    r = sqrt ( n );
  end

  v(1:n) = v(1:n) / r;

  for i = 1 : it_max

    av(1:n) = a(1:n,1:n) * v(1:n)';

    r_old = r;
    r = sqrt ( sum ( av(1:n).^2 ) );

    if ( it_min < i )
      if ( abs ( r - r_old ) <= it_eps * ( 1.0 + abs ( r ) ) )
        break
      end
    end

    v(1:n) = av(1:n);

    if ( r ~= 0.0 )
      v(1:n) = v(1:n) / r;
    end
%
%  Perturb V a bit, to avoid cases where the initial guess is exactly
%  the eigenvector of a smaller eigenvalue.
%
    if ( i < round ( it_max / 2 ) )
      j = 1 + mod ( i-1, n );
      v(j) = v(j) + eps * ( 1.0 + abs ( v(j) ) );
      r2 = sqrt ( sum ( v(1:n).^2 ) );
      v(1:n) = v(1:n) / r2;
    end

  end

  return
end
