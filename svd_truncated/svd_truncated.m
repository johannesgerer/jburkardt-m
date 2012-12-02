function svd_truncated ( )

%*****************************************************************************80
%
%% MAIN is the main program for SVD_TRUNCATED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_TRUNCATED:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate the use of the truncated or economy-size\n' );
  fprintf ( 1, '  Singular Value Decomposition (SVD) for cases where\n' );
  fprintf ( 1, '  the sizes of M and N are very different.\n' );

  m = 4;
  n = 3;
  svd_truncated_u_test ( m, n );

  m = 3;
  n = 4;
  svd_truncated_v_test ( m, n );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_TRUNCATED:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function svd_truncated_u_test ( m, n )

%*****************************************************************************80
%
%% SVD_TRUNCATED_U_TEST tests SVD_TRUNCATED_U.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_TRUNCATED_U_TEST\n' );
  fprintf ( 1, '  M = %d\n', m );
  fprintf ( 1, '  N = %d\n', n );

  a_save = rand ( m, n );
 
  r8mat_print ( m, n, a_save, '  A:' );

  a(1:m,1:n) = a_save(1:m,1:n);

  [ un, sn, v ] = svd ( a, 'econ' );
%
%  Check the factorization by computing A = U * S * V'
%
  a = un * sn * v';

  err = max ( max ( abs ( a(1:m,1:n) - a_save(1:m,1:n) ) ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum error |A - U*S*V''| = %g\n', err );

  r8mat_print ( m, n, a, '  Recomputed A = U * S * V'':' );

  return
end
function svd_truncated_v_test ( m, n )

%*****************************************************************************80
%
%% SVD_TRUNCATED_V_TEST tests SVD_TRUNCATED_V.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_TRUNCATED_V_TEST\n' );
  fprintf ( 1, '  M = %d\n', m );
  fprintf ( 1, '  N = %d\n', n );

  a_save = rand ( m, n );
 
  r8mat_print ( m, n, a_save, '  A:' );

  a(1:m,1:n) = a_save(1:m,1:n);

  [ u, sm, vm ] = svd ( a, 'econ' );
%
%  Check the factorization by computing A = U * S * V'
%
  a = u * sm * vm';

  err = max ( max ( abs ( a(1:m,1:n) - a_save(1:m,1:n) ) ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum error |A - U*S*V''| = %g\n', err );

  r8mat_print ( m, n, a, '  Recomputed A = U * S * V'':' )
  return
end
function r8mat_print ( m, n, a, title )

%*****************************************************************************80
%
%% R8MAT_PRINT prints an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, real A(M,N), the matrix.
%
%    Input, string TITLE, a title.
%
  r8mat_print_some ( m, n, a, 1, 1, m, n, title );

  return
end
function r8mat_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8MAT_PRINT_SOME prints out a portion of an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, real A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, a title.
%
  incx = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  if ( m <= 0 || n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  (None)\n' );
    return
  end

  for j2lo = max ( jlo, 1 ): incx : min ( jhi, n )

    j2hi = j2lo + incx - 1;
    j2hi = min ( j2hi, n );
    j2hi = min ( j2hi, jhi );
    
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col: ' );

    for j = j2lo : j2hi
      fprintf ( 1, '%7d       ', j );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row\n' );

    i2lo = max ( ilo, 1 );
    i2hi = min ( ihi, m );

    for i = i2lo : i2hi

      fprintf ( 1, '%7d :', i );
      
      for j = j2lo : j2hi
        fprintf ( 1, '%12g  ', a(i,j) );
      end

      fprintf ( 1, '\n' );

    end

  end

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
