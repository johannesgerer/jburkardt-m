function linpack_c_test32 ( )

%*****************************************************************************80
%
%% TEST32 tests CSPFA and CSPSL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2009
%
%  Author:
%
%    John Burkardt
%
  n = 3;

  fprintf ( 1, '\n' )
  fprintf ( 1, 'TEST32\n' );
  fprintf ( 1, '  For a single precision complex (C)\n' );
  fprintf ( 1, '  symmetric matrix in packed storage (SP),\n' );
  fprintf ( 1, '  CSPFA factors the matrix.\n' );
  fprintf ( 1, '  CSPSL solves a linear system.\n' );
  fprintf ( 1, '\n' )
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the packed matrix A.
%
  k = 0;
  seed = 123456789;

  for j = 1 : n

    for i = 1 : j-1
      k = k + 1;
      [ a(k), seed ] = c4_uniform_01 ( seed );
    end

    k = k + 1;
    [ a(k), seed ] = c4_uniform_01 ( seed );

  end
%
%  Copy the packed matrix into a "normal" matrix.
%
  k = 0;
  for j = 1 : n
    for i = 1 : j
      k = k + 1;
      a_save(i,j) = a(k);
    end
  end

  for j = 1 : n
    a_save(j+1:n,j) = transpose ( a_save(j,j+1:n) );
  end

  fprintf ( 1, '\n' )
  fprintf ( 1, '  The matrix A is\n' );
  fprintf ( 1, '\n' )
 
  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( a_save(i,j) ), imag ( a_save(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Set the values of the right hand side vector B.
%
  [ x, seed ] = c4vec_uniform_01 ( n, seed );

  b(1:n) = a_save(1:n,1:n) * transpose ( x(1:n) );
 
  fprintf ( 1, '\n' )
  fprintf ( 1, '  The right hand side B is\n' );
  fprintf ( 1, '\n' )
  for i = 1 : n
    fprintf ( 1, '  (%8f  %8f)\n', real ( b(i) ), imag ( b(i) ) );
  end
%
%  Factor the matrix A.
%
  [ a, ipvt, info ] = cspfa ( a, n );
 
  if ( info ~= 0 )
    fprintf ( 1, '\n' )
    fprintf ( 1, '  CSPFA returned an error flag INFO = %d\n', info );
    return
  end
%
%  Solve the system.
%
  b = cspsl ( a, n, ipvt, b );
 
  fprintf ( 1, '\n' )
  fprintf ( 1, '  Computed                     Exact\n' );
  fprintf ( 1, '  Solution                     Solution\n' );
  fprintf ( 1, '\n' )
 
  for i = 1 : n
    fprintf ( 1, '  (%8f  %8f)  (%8f  %8f)\n', ...
      real ( b(i) ), imag ( b(i) ), real ( x(i) ), imag ( x(i) ) );
  end

  return
end
