function elimination_complexity ( )

%*****************************************************************************80
%
%% ELIMINATION_COMPLEXITY measures the complexity of Gauss elimination.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 December 2012
%
%  Author:
%
%    MATLAB version by John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELIMINATION_COMPLEXITY:\n' );
  fprintf ( 1, '  Measure the increase in execution time for Gauss elimination\n' );
  fprintf ( 1, '  as a function of the number of equations N.\n' );
%
%  Get some data for N = 1 : 200.
%  Do the loop twice to avoid startup anomalies.
%
  for i = 1 : 2

    data_size = zeros ( 200, 1 );
    data_time = zeros ( 200, 1 );

    for n = 1 : 200
      a = rand ( n, n );
      tic;
      [ a, ipvt, info ] = dgefa ( a, n );
      data_size(n) = n;
      data_time(n) = toc;
    end

  end

  figure ( 1 )
  plot ( data_size, data_time, 'r-' )
  grid on
  xlabel ( 'Matrix order N' );
  ylabel ( 'Elapsed time T' );
  title ( 'T(N), time to Gauss eliminate a matrix of order N' );

  filename = 'elimination_1to200.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s".\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELIMINATION_COMPLEXITY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function [ a, ipvt, info ] = dgefa ( a, n )

%*****************************************************************************80
%
%% DGEFA factors a real matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2005
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Dongarra, Moler, Bunch and Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, real A(N,N), the matrix to be factored.
%
%    Input, integer N, the order of the matrix A.
%
%    Output, real A(N,N), an upper triangular matrix and the multipliers 
%    used to obtain it.  The factorization can be written A=L*U, where L is 
%    a product of permutation and unit lower triangular matrices, and U is 
%    upper triangular.
%
%    Output, integer IPVT(N), the pivot indices.
%
%    Output, integer INFO, singularity indicator.
%    0, normal value.
%    K, if U(K,K) == 0.  This is not an error condition for this subroutine,
%    but it does indicate that DGESL or DGEDI will divide by zero if called.
%    Use RCOND in DGECO for a reliable indication of singularity.
%

%
%  Gaussian elimination with partial pivoting.
%
  info = 0;

  for k = 1 : n - 1
%
%  Find L = pivot index.
%
    [ amax, l ] = max ( a(k:n,k) );
    l = l + k - 1;
    ipvt(k) = l;
%
%  Zero pivot implies this column already triangularized.
%
    if ( a(l,k) == 0.0 )
      info = k;
      continue
    end
%
%  Interchange if necessary.
%
    if ( l ~= k )
      t      = a(l,k);
      a(l,k) = a(k,k);
      a(k,k) = t;
    end
%
%  Compute multipliers.
%
    a(k+1:n,k) = - a(k+1:n,k) / a(k,k);
%
%  Row elimination with column indexing.
%
    for j = k+1 : n
      t = a(l,j);
      if ( l ~= k )
        a(l,j) = a(k,j);
        a(k,j) = t;
      end
      a(k+1:n,j) = a(k+1:n,j) + t * a(k+1:n,k);
    end

  end

  ipvt(n) = n;

  if ( a(n,n) == 0.0 )
    info = n;
  end

  return
end
