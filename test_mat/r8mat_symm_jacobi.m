function lambda = r8mat_symm_jacobi ( n, a )

%*****************************************************************************80
%
%% R8MAT_SYMM_JACOBI applies Jacobi eigenvalue iteration to a symmetric matrix.
%
%  Discussion:
%
%    This code was modified so that it treats as zero the off-diagonal
%    elements that are sufficiently close to, but not exactly, zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real A(N,N), a symmetric N by N matrix.
%
%    Output, real LAMBDA(N), the approximate eigenvalues.
%
  eps = 0.00001;
  it_max = 100;

  norm_fro = r8mat_norm_fro ( n, n, a );

  it = 0;

  while ( 1 )

    it = it + 1;

    for i = 1 : n
      for j = 1 : i - 1

        if ( eps * norm_fro < abs ( a(i,j) ) + abs ( a(j,i) ) )

          u = ( a(j,j) - a(i,i) ) / ( a(i,j) + a(j,i) );

          t = r8_sign ( u ) / ( abs ( u ) + sqrt ( u * u + 1.0 ) );
          c = 1.0 / sqrt ( t * t + 1.0 );
          s = t * c;
%
%  A -> A * Q.
%
          for k = 1 : n
            t1 = a(i,k);
            t2 = a(j,k);
            a(i,k) = t1 * c - t2 * s;
            a(j,k) = t1 * s + t2 * c;
          end
%
%  A -> QT * A
%
          for k = 1 : n
            t1 = a(k,i);
            t2 = a(k,j);
            a(k,i) = c * t1 - s * t2;
            a(k,j) = s * t1 + c * t2;
          end

        end
      end
    end
%
%  Test the size of the off-diagonal elements.
%
    sum2 = 0.0;
    for i = 1 : n
      for j = 1 : i - 1
        sum2 = sum2 + abs ( a(i,j) );
      end
    end

    if ( sum2 <= eps * ( norm_fro + 1.0 ) ) 
      break
    end

    if ( it_max <= it )
      break
    end

  end
%
%  The eigenvalues are on the diagonal of A.
%
  lambda = sort ( diag ( a ) );

  return
end
