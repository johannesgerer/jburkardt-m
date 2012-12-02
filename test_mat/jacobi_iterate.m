function [ lambda, x ] = jacobi_iterate ( n, a )

%*****************************************************************************80
%
%% JACOBI_ITERATE applies the Jacobi eigenvalue iteration to a symmetric matrix.
%
%  Discussion:
%
%    I had to modify the code, in order to avoid cases where the
%    off-diagonal element was not exactly zero, but very very close.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real A(N,N), a symmetric matrix.
%    On output, the matrix has been overwritten by an approximately
%    diagonal matrix, with the eigenvalues on the diagonal.
%
%    Output, real LAMBDA(N), the computed eigenvalues.
%
%    Output, real X(N,N), the computed eigenvector matrix.
%
  eps = 0.00001;
  maxit = 100;

  error_frobenius = r8mat_is_symmetric ( n, n, a );

  if ( eps < error_frobenius )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'JACOBI_ITERATE - Fatal error!\n' );
    fprintf ( 1, '  The input matrix is not symmetric.\n' );
    error ( 'JACOBI_ITERATE - Fatal error!' );
  end

  b(1:n,1:n) = a(1:n,1:n);

  norm_fro = r8mat_norm_fro ( n, n, b );

  x = identity ( n, n );

  for it = 1 : maxit

    for i = 1 : n
      for j = 1 : i - 1

        if ( eps * norm_fro < abs ( b(i,j) ) + abs ( b(j,i) ) )

          u = ( b(j,j) - b(i,i) ) / ( b(i,j) + b(j,i) );

          t = r8_sign ( u ) / ( abs ( u ) + sqrt ( u * u + 1.0 ) );
          c = 1.0 / sqrt ( t * t + 1.0 );
          s = t * c;
%
%  A -> A * Q.
%
          for k = 1 : n
            t1 = b(i,k);
            t2 = b(j,k);
            b(i,k) = t1 * c - t2 * s;
            b(j,k) = t1 * s + t2 * c;
          end
%
%  A -> Q' * A
%
          for k = 1 : n
            t1 = b(k,i);
            t2 = b(k,j);
            b(k,i) = c * t1 - s * t2;
            b(k,j) = s * t1 + c * t2;
          end
%
%  X -> Q' * X
%
          for k = 1 : n
            t1 = x(k,i);
            t2 = x(k,j);
            x(k,i) = c * t1 - s * t2;
            x(k,j) = s * t1 + c * t2;
          end

        end

      end
    end
%
%  Test the size of the off-diagonal elements.
%
    sum2 = 0.0;
    for i = 1 : n
      sum2 = sum2 + sum ( abs ( b(i,1:i-1) ) );
    end

    if ( sum2 <= eps * ( norm_fro + 1.0 ) )
      break
    end

  end

  lambda = diag ( b );

  return
end
