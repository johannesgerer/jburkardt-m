function x = mgmres_st ( n, nz_num, ia, ja, a, x, rhs, itr_max, mr, ...
  tol_abs, tol_rel )

%*****************************************************************************80
%
%% MGMRES_ST applies restarted GMRES to a matrix in sparse triplet form.
%
%  Discussion:
%
%    The linear system A*X=B is solved iteratively.
%
%    The matrix A is assumed to be stored in sparse triplet form.  
%    Only the nonzero entries of A are stored.  For instance, the k-th 
%    nonzero entry in the matrix is stored by:
%
%      A(k) = value of entry,
%      IA(k) = row of entry,
%      JA(k) = column of entry.
%
%    Thanks to Jesus Pueblas Sanchez-Guerra for supplying two
%    corrections to the code on 31 May 2007.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%   
%  Modified:
%
%    25 March 2008
%
%  Author:
%
%    Original C version by Lili Ju
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Richard Barrett, Michael Berry, Tony Chan, James Demmel,
%    June Donato, Jack Dongarra, Victor Eijkhout, Roidan Pozo,
%    Charles Romine, Henk van der Vorst,
%    Templates for the Solution of Linear Systems:
%    Building Blocks for Iterative Methods,
%    SIAM, 1994.
%    ISBN: 0898714710,
%    LC: QA297.8.T45.
%
%    Tim Kelley,
%    Iterative Methods for Linear and Nonlinear Equations,
%    SIAM, 2004,
%    ISBN: 0898713528,
%    LC: QA297.8.k45.
%
%    Yousef Saad,
%    Iterative Methods for Sparse Linear Systems,
%    Second Edition,
%    SIAM, 2003,
%    ISBN: 0898715342,
%    LC: QA188.S17.
%
%  Parameters:
%
%    Input, integer N, the order of the linear system.
%
%    Input, integer NZ_NUM, the number of nonzero matrix values.
%
%    Input, integer IA(NZ_NUM), JA(NZ_NUM), the row and column indices
%    of the matrix values.
%
%    Input, real A(NZ_NUM), the matrix values.
%
%    Input, real X(N); an approximation to the solution.
%
%    Input, real RHS(N), the right hand side of the linear system.
%
%    Input, integer ITR_MAX, the maximum number of (outer) iterations
%    to take.
%
%    Input, integer MR, the maximum number of (inner) iterations
%    to take.  0 < MR <= N.
%
%    Input, real TOL_ABS, an absolute tolerance applied to the
%    current residual.
%
%    Input, real TOL_REL, a relative tolerance comparing the
%    current residual to the initial residual.
%
%    Output, real X(N); an improved approximation to the solution.
%
  delta = 0.001;
  verbose = 1;

  if ( n < mr )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MGMRES_ST - Fatal error!\n' );
    fprintf ( 1, '  N < MR.\n' );
    fprintf ( 1, '  N = %d\n', n );
    fprintf ( 1, '  MR = %d\n', mr );
    error ( 'MGMRES_ST - Fatal error!' );
  end

  itr_used = 0;

  for itr = 1 : itr_max

    r = ax_st ( n, nz_num, ia, ja, a, x );

    r(1:n) = rhs(1:n) - r(1:n);

    rho = norm ( r(1:n) );

    if ( verbose ) 
      fprintf ( 1, '  ITR = %8d  Residual = %e\n', itr, rho );
    end

    if ( itr == 1 ) 
      rho_tol = rho * tol_rel;
    end

    v(1:n,1) = r(1:n) / rho;

    g(1) = rho;
    g(2:mr+1) = 0.0;
    h(1:mr+1,1:mr) = 0.0;

    for k = 1 : mr

      k_copy = k;

      v(1:n,k+1) = ax_st ( n, nz_num, ia, ja, a, v(1:n,k) );

      av = norm ( v(1:n,k+1) );

      for j = 1 : k
        h(j,k) = v(1:n,j)' * v(1:n,k+1);
        v(1:n,k+1) = v(1:n,k+1) - h(j,k) * v(1:n,j);
      end

      h(k+1,k) = norm ( v(1:n,k+1) );

      if ( av + delta * h(k+1,k) == av )

        for j = 1 : k
          htmp = v(1:n,j)' * v(1:n,k+1);
          h(j,k) = h(j,k) + htmp;
          v(1:n,k+1) = v(1:n,k+1) - htmp * v(1:n,j);
        end

        h(k+1,k) = norm ( v(1:n,k+1) );

      end

      if ( h(k+1,k) ~= 0.0 )
        v(1:n,k+1) = v(1:n,k+1) / h(k+1,k);
      end

      if ( 1 < k )

        y(1:k+1) = h(1:k+1,k);

        for j = 1 : k-1
          y(1:k+1) = mult_givens ( c(j), s(j), j, y(1:k+1) );
        end

        h(1:k+1,k) = y(1:k+1);

      end

      mu = sqrt ( h(k,k)^2 + h(k+1,k)^2 );
      c(k) = h(k,k) / mu;
      s(k) = -h(k+1,k) / mu;
      h(k,k) = c(k) * h(k,k) - s(k) * h(k+1,k);
      h(k+1,k) = 0.0;
      g(1:k+1) = mult_givens ( c(k), s(k), k, g(1:k+1) );

      rho = abs ( g(k+1) );

      itr_used = itr_used + 1;

      if ( verbose )
        fprintf ( 1, '  K =   %8d  Residual = %e\n', k, rho );
      end

      if ( rho <= rho_tol & rho <= tol_abs )
        break
      end

    end

    k = k_copy - 1;

    y(k+1) = g(k+1) / h(k+1,k+1);
    for i = k : -1 : 1
      y(i) = ( g(i) - h(i,i+1:k+1) * y(i+1:k+1)' ) / h(i,i);
    end

    for i = 1 : n
      x(i) = x(i) + v(i,1:k+1) * y(1:k+1)';
    end

    if ( rho <= rho_tol & rho <= tol_abs )
      break
    end

  end

  if ( verbose )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MGMRES_ST\n' );
    fprintf ( 1, '  Iterations = %d\n', itr_used );
    fprintf ( 1, '  Final residual = %e\n', rho );
  end

  return
end
