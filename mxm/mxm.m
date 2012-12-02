function mxm ( n1, n2, n3 )

%*****************************************************************************80
%
%% MXM computes a matrix-matrix product reports the elapsed CPU time.
%
%  Discussion:
%
%    The multiplication carried out is
%
%      A(1:N1,1:N3) = B(1:N1,1:N2) * C(1:N2,1:N3)
%
%    where B and C are real matrices whose entries
%    are assigned randomly.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Usage:
%
%    mxm n1 n2 n3
%
%  Parameters:
%
%    Command line argument, integer N1, N2, N3, defines the number of
%    rows and columns in the two matrices.
%
  timestamp ( );

  fprintf ( 1, '\n'  );
  fprintf ( 1, 'MXM:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Compute matrix-matrix product A = B * C\n' );
%
%  Get the number of command line arguments.
%
  if ( 1 <= nargin )

  else

    n1 = input ( '  Enter N1, the number of rows in B:  ' );

  end
%
%  Get N2.
%
  if ( 2 <= nargin )

  else

    n2 = input ( '  Enter N2, the number of columns in B and rows in C:  ' );

  end
%
%  Get N3.
%
  if ( 3 <= nargin )

  else

    n3 = input ( '  Enter N3, the number of columns in C:  ' );

  end
%
%  Record the amount of work.
%  Each of the N1 * N3 entries of A requires N2 multiplies and N2 adds.
%
  flop_count = 2 * n1 * n2 * n3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix B is %d by %d\n', n1, n2 );
  fprintf ( 1, '  Matrix C is %d by %d\n', n2, n3 );
  fprintf ( 1, '  Matrix A will be %d by %d\n', n1, n3 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of floating point operations = %d\n', flop_count );
  time_estimate = flop_count / 2.6E+09;
  fprintf ( 1, '  Estimated CPU time is %f seconds\n', time_estimate );
%
%  Set B and C.
%
  seed = 1325;
  [ b, seed ] = matgen ( n1, n2, seed );
  [ c, seed ] = matgen ( n2, n3, seed );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Method     Cpu Seconds       MegaFlopS\n' );
  fprintf ( 1, '  ------  --------------  --------------\n' );
%
%  IJK
%
  [ cpu_seconds, a ] = mxm_ijk ( n1, n2, n3, b, c );

  if ( 0.0 < cpu_seconds )
    mflops = flop_count / cpu_seconds / 1000000.0;
  else
    mflops = -1.0;
  end

  fprintf ( 1, '  IJK     %14f  %14f\n', cpu_seconds, mflops );
%
%  IKJ
%
  [ cpu_seconds, a ] = mxm_ikj ( n1, n2, n3, b, c );

  if ( 0.0 < cpu_seconds )
    mflops = flop_count / cpu_seconds / 1000000.0;
  else
    mflops = -1.0;
  end

  fprintf ( 1, '  IKJ     %14f  %14f\n', cpu_seconds, mflops );
%
%  JIK
%
  [ cpu_seconds, a ] = mxm_jik ( n1, n2, n3, b, c );

  if ( 0.0 < cpu_seconds )
    mflops = flop_count / cpu_seconds / 1000000.0;
  else
    mflops = -1.0;
  end

  fprintf ( 1, '  JIK     %14f  %14f\n', cpu_seconds, mflops );
%
%  JKI
%
  [ cpu_seconds, a ] = mxm_jki ( n1, n2, n3, b, c );

  if ( 0.0 < cpu_seconds )
    mflops = flop_count / cpu_seconds / 1000000.0;
  else
    mflops = -1.0;
  end

  fprintf ( 1, '  JKI     %14f  %14f\n', cpu_seconds, mflops );
%
%  KIJ
%
  [ cpu_seconds, a ] = mxm_kij ( n1, n2, n3, b, c );

  if ( 0.0 < cpu_seconds )
    mflops = flop_count / cpu_seconds / 1000000.0;
  else
    mflops = -1.0;
  end

  fprintf ( 1, '  KIJ     %14f  %14f\n', cpu_seconds, mflops );
%
%  KJI
%
  [ cpu_seconds, a ] = mxm_kji ( n1, n2, n3, b, c );

  if ( 0.0 < cpu_seconds )
    mflops = flop_count / cpu_seconds / 1000000.0;
  else
    mflops = -1.0;
  end

  fprintf ( 1, '  KJI     %14f  %14f\n', cpu_seconds, mflops );
%
%  STAR
%
  [ cpu_seconds, a ] = mxm_star ( n1, n2, n3, b, c );

  if ( 0.0 < cpu_seconds )
    mflops = flop_count / cpu_seconds / 1000000.0;
  else
    mflops = -1.0;
  end

  fprintf ( 1, '  B*C     %14f  %14f\n', cpu_seconds, mflops );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MXM:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( )

  return
end
function [ a, seed ] = matgen ( m, n, seed )

%*****************************************************************************80
%
%% MATGEN generates a random matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2010
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
%    Input, integer SEED, a seed for the random number
%    generator.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );
%
%  Set the matrix A.
%
  for j = 1 : n
    for i = 1 : m
      seed = mod ( ( 3125 * seed ), 65536 );
      a(i,j) = ( seed - 32768.0 ) / 16384.0;
    end
  end

  return
end
function [ cpu_seconds, a ] = mxm_ijk ( n1, n2, n3, b, c )

%*****************************************************************************80
%
%% MXM_IJK computes A = B * C using DO I, DO J, DO K loops.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, N2, N3, define the orders of the
%    matrices.
%
%    Input, real B(N1,N2), C(N2,N3), the factor matrices.
%
%    Output, real CPU_SECONDS, the elapsed CPU time.
%
%    Output, real A(N1,N3), the result matrix.
%
  a = zeros ( n1, n3 );

  tic;

  for i = 1 : n1
    for j = 1 : n3
      for k = 1 : n2
        a(i,j) = a(i,j) + b(i,k) * c(k,j);
      end
    end
  end

  cpu_seconds = toc;

  return
end
function [ cpu_seconds, a ] = mxm_ikj ( n1, n2, n3, b, c )

%*****************************************************************************80
%
%% MXM_IKJ computes A = B * C using DO I, DO K, DO J loops.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, N2, N3, define the orders of the
%    matrices.
%
%    Input, real B(N1,N2), C(N2,N3), the factor matrices.
%
%    Output, real CPU_SECONDS, the elapsed CPU time.
%
%    Output, real A(N1,N3), the result matrix.
%
  a = zeros ( n1, n3 );

  tic;

  for i = 1 : n1
    for k = 1 : n2
      for j = 1 : n3
        a(i,j) = a(i,j) + b(i,k) * c(k,j);
      end
    end
  end

  cpu_seconds = toc;

  return
end
function [ cpu_seconds, a ] = mxm_jik ( n1, n2, n3, b, c )

%*****************************************************************************80
%
%% MXM_JIK computes A = B * C using DO J, DO I, DO K loops.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, N2, N3, define the orders of the
%    matrices.
%
%    Input, real B(N1,N2), C(N2,N3), the factor matrices.
%
%    Output, real CPU_SECONDS, the elapsed CPU time.
%
%    Output, real A(N1,N3), the result matrix.
%
  a = zeros ( n1, n3 );

  tic;

  for j = 1 : n3
    for i = 1 : n1
      for k = 1 : n2
        a(i,j) = a(i,j) + b(i,k) * c(k,j);
      end
    end
  end

  cpu_seconds = toc;

  return
end
function [ cpu_seconds, a ] = mxm_jki ( n1, n2, n3, b, c )

%*****************************************************************************80
%
%% MXM_JKI computes A = B * C using DO J, DO K, DO I loops.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, N2, N3, define the orders of the
%    matrices.
%
%    Input, real B(N1,N2), C(N2,N3), the factor matrices.
%
%    Output, real CPU_SECONDS, the elapsed CPU time.
%
%    Output, real A(N1,N3), the result matrix.
%
  a = zeros ( n1, n3 );

  tic;

  for j = 1 : n3
    for k = 1 : n2
      for i = 1 : n1
        a(i,j) = a(i,j) + b(i,k) * c(k,j);
      end
    end
  end

  cpu_seconds = toc;

  return
end
function [ cpu_seconds, a ] = mxm_kij ( n1, n2, n3, b, c )

%*****************************************************************************80
%
%% MXM_KIJ computes A = B * C using DO K, DO I, DO J loops.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, N2, N3, define the orders of the
%    matrices.
%
%    Input, real B(N1,N2), C(N2,N3), the factor matrices.
%
%    Output, real CPU_SECONDS, the elapsed CPU time.
%
%    Output, real A(N1,N3), the result matrix.
%
  a = zeros ( n1, n3 );

  tic;

  for k = 1 : n2
    for i = 1 : n1
      for j = 1 : n3
        a(i,j) = a(i,j) + b(i,k) * c(k,j);
      end
    end
  end

  cpu_seconds = toc;

  return
end
function [ cpu_seconds, a ] = mxm_kji ( n1, n2, n3, b, c )

%*****************************************************************************80
%
%% MXM_KJI computes A = B * C using DO K, DO J, DO I loops.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, N2, N3, define the orders of the
%    matrices.
%
%    Input, real B(N1,N2), C(N2,N3), the factor matrices.
%
%    Output, real CPU_SECONDS, the elapsed CPU time.
%
%    Output, real A(N1,N3), the result matrix.
%
  a = zeros ( n1, n3 );

  tic;

  for k = 1 : n2
    for j = 1 : n3
      for i = 1 : n1
        a(i,j) = a(i,j) + b(i,k) * c(k,j);
      end
    end
  end

  cpu_seconds = toc;

  return
end
function [ cpu_seconds, a ] = mxm_star ( n1, n2, n3, b, c )

%*****************************************************************************80
%
%% MXM_STAR computes A = B * C using MATLAB's "*" operator.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, N2, N3, define the orders of the
%    matrices.
%
%    Input, real B(N1,N2), C(N2,N3), the factor matrices.
%
%    Output, real CPU_SECONDS, the elapsed CPU time.
%
%    Output, real A(N1,N3), the result matrix.
%
  tic;

  a = b * c;

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
