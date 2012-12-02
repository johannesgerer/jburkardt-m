function linplus_test55 ( )

%*****************************************************************************80
%
%% TEST55 tests R8SD_CG.
%
%  Discussion:
%
%    This is a sample demonstration of how to compute some eigenvalues
%    and corresponding eigenvectors of a matrix.  The matrix is the
%    discretized Laplacian operator, which can be stored by diagonals,
%    and handled by the conjugate gradient method.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  maxvec = 3;
  ndiag = 3;
  nx = 10;
  ny = 10;
  n = nx * ny;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST55\n' );
  fprintf ( 1, '  R8SD_CG is used for linear equation solving\n' );
  fprintf ( 1, '    in a demonstration of inverse iteration to\n' );
  fprintf ( 1, '    compute eigenvalues and eigenvectors of a\n' );
  fprintf ( 1, '    symmetric matrix stored by diagonals.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here are 25 of the smallest eigenvalues:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, J, eigenvalue(I,J):\n' );
  fprintf ( 1, '\n' );

  for i = 1 : min ( 5, nx )
    for j = 1 : min ( 5, ny )
      eval = 4.0 - 2.0 * cos ( i * pi / ( nx + 1 ) ) ...
                 - 2.0 * cos ( j * pi / ( ny + 1 ) );
      fprintf ( 1, '%4d  %4d  %f\n', i, j, eval );
    end
  end
%
%  OFFSET tells us where the nonzero diagonals are.  It does this
%  by recording how "high" or to the right the diagonals are from
%  the main diagonal.
%
  offset = [ 0, 1, nx ];
%
%  Now we compute the numbers that go into the diagonals.  For this
%  problem, we could simply store a column of 4's, and two columns of
%  -1's, but I wanted to go through the motions of thinking about the
%  value of each entry.  "K" counts the row of the original matrix
%  that we are working on.
%
  k = 0;
  for j = 1 : ny
    for i = 1 : nx

      k = k + 1;
%
%  Central
%
      a(k,1) = 4.0;
%
%  East ( = West )
%
      if ( i == nx )
        a(k,2) = 0.0;
      else
        a(k,2) = -1.0;
      end
%
%  North ( = South )
%
      if ( j == ny )
        a(k,3) = 0.0;
      else
        a(k,3) = -1.0;
      end

    end
  end

  nvec = 0;
%
%  Set the starting eigenvector and eigenvalue estimates.
%
  while ( 1 ) 

    fprintf ( 1, '\n' );

    lambda = 0.0;

    k = 0;
    for j = 1 : ny
      for i = 1 : nx
        k = k + 1;
        x(k) = 1.0;
      end
    end
%
%  Remove any components of previous eigenvectors.
%
    for ivec = 1 : nvec
      dot = x(1:n) * vec(1:n,ivec);
      x(1:n) = x(1:n) - dot * vec(1:n,ivec)';
    end

    xnew(1:n) = x(1:n);
%
%  Iterate
%
    for iter = 1 : 2

      norm = sqrt ( xnew(1:n) * xnew(1:n)' );

      xnew(1:n) = xnew(1:n) / norm;

      lambda_old = lambda;
      lambda = 1.0 / norm;
%
%  Check for convergence.
%
      if ( 1 < iter )
        del = abs ( lambda - lambda_old );
        if ( del < 0.000001 )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'Lambda estimate = %f\n', lambda );
          fprintf ( 1, 'Converged on step %d\n', iter );
          break
        end
      end
%
%  Call the conjugate gradient method, solving
%    A * XNEW = X.
%
      x(1:n) = xnew(1:n);

      xnew = r8sd_cg ( n, ndiag, offset, a, x, xnew );

      for ivec = 1 : nvec
        dot = xnew(1:n) * vec(1:n,ivec);
        xnew(1:n) = xnew(1:n) - dot * vec(1:n,ivec)';
      end

    end

    nvec = nvec + 1;
    lamvec(nvec) = lambda;
    vec(1:n,nvec) = xnew(1:n)';

    if ( maxvec <= nvec )
      break;
    end

  end

  return
end
