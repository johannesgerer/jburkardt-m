function mxv ( m, n )

%*****************************************************************************80
%
%% MAIN is the main program for MXV.
%
%  Discussion:
%
%    MXV computes a matrix-vector product in a number of ways, and reports
%    the elapsed CPU time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 May 2008
%
%  Author:
%
%    John Burkardt
%
%  Usage:
%
%    mxv ( m, n )
%
%  Parameters:
%
%    Input, integer M, the number of rows in the matrix.
%
%    Input, integer N, the number of columns in the matrix.
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MXV:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute matrix vector products y = A*x.\n' );
%
%  Get the number of rows, M.
%
  if ( nargin < 1 )
    m = input ( '  Enter the number of rows, M' );    
  end
%
%  Get the number of columns, N.
%
  if ( nargin < 2 )
    n = input ( '  Enter the number of rows, N' );    
  end
%
%  Record the amount of work.
%  Each of the M entries of Y requires N multiplies and N adds.
%
  flop_count = 2 * m * n;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of matrix rows M =             %d\n', m );
  fprintf ( 1, '  Number of matrix columns N =          %d\n', n );
  fprintf ( 1, '  Number of floating point operations = %d\n', flop_count );
%
%  Set A and X.
%
  [ a, x ] = matgen ( m, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Method       Cpu Seconds       MegaFlopS\n' );
  fprintf ( 1, '  --------  --------------  --------------\n' );
%
%  FORIFORJ
%
  [ y, cpu_seconds ] = mxv_foriforj ( m, n, a, x );

  if ( 0.0 < cpu_seconds )
    mflops = flop_count / cpu_seconds / 1000000.0;
  else
    mflops = -1.0;
  end

  fprintf ( '  %s  %14e  %14f\n', 'FORIFORJ', cpu_seconds, mflops );
%
%  FORJFORI
%
  [ y, cpu_seconds ] = mxv_forjfori ( m, n, a, x );

  if ( 0.0 < cpu_seconds )
    mflops = flop_count / cpu_seconds / 1000000.0;
  else
    mflops = -1.0;
  end

  fprintf ( '  %s  %14e  %14f\n', 'FORJFORI', cpu_seconds, mflops );
%
%  ASTARX
%
  [ y, cpu_seconds ] = mxv_astarx ( m, n, a, x );

  if ( 0.0 < cpu_seconds )
    mflops = flop_count / cpu_seconds / 1000000.0;
  else
    mflops = -1.0;
  end

  fprintf ( '  %s  %14e  %14f\n', 'ASTARX  ', cpu_seconds, mflops );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MXV:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ a, x ] = matgen ( m, n )

%*****************************************************************************80
%
%% MATGEN generates a random matrix A and vector X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 May 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns 
%    of the matrix.
%
%    Output, real A(M,N), the matrix.
%
%    Output, real X(N,1), the vector.
%
  a = rand ( m, n );
%
%  Set X.
%
  x(1:n,1) = 1 : n;

  return
end
function [ y, cpu_seconds ] = mxv_astarx ( m, n, a, x )

%*****************************************************************************80
%
%% MXV_ASTARX computes y = A * x, using the MATLAB "A * X" notation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 May 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns 
%    of the matrix.
%
%    Input, real A(M,N), the matrix.
%
%    Input, real X(N,1), the vector to be multiplied.
%
%    Output, real Y(M,1), the product vector.
%
%    Output, real CPU_SECONDS, the elapsed CPU time.
%
  tic;

  y(1:m,1) = a(1:m,1:n) * x(1:n,1);

  cpu_seconds = toc;

  return
end
function [ y, cpu_seconds ] = mxv_foriforj ( m, n, a, x )

%*****************************************************************************80
%
%% MXV_FORIFORJ computes y = A * x, using FOR I, FOR J loops.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 May 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns
%    of the matrix.
%
%    Input, real A(M,N), the matrix.
%
%    Input, real X(N,1), the vector to be multiplied.
%
%    Output, real Y(M,1), the product vector.
%
%    Output, real CPU_SECONDS, the elapsed CPU time.
%
  tic;

  for i = 1 : m
    y(i,1) = 0.0;
    for j = 1 : n
      y(i,1) = y(i,1) + a(i,j) * x(j,1);
    end
  end

  cpu_seconds = toc;

  return
end
function [ y, cpu_seconds ] = mxv_forjfori ( m, n, a, x )

%*****************************************************************************80
%
%% MXV_FORJFORI computes y = A * x, using FOR J, FOR I loops.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 May 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns
%    of the matrix.
%
%    Input, real A(M,N), the matrix.
%
%    Input, real X(N,1), the vector to be multiplied.
%
%    Output, real Y(M,1), the product vector.
%
%    Output, real CPU_SECONDS, the elapsed CPU time.
%
  tic;

  for i = 1 : m
    y(i,1) = 0.0;
  end

  for j = 1 : n
    for i = 1 : m
      y(i,1) = y(i,1) + a(i,j) * x(j,1);
    end
  end

  cpu_seconds = toc;

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
