function linpack_c_test33 ( )

%*****************************************************************************80
%
%% TEST33 tests CSPFA and CSPDI.
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
  fprintf ( 1, 'TEST33\n' );
  fprintf ( 1, '  For a single precision complex (C)\n' );
  fprintf ( 1, '  symmetric matrix in packed storage (SP)\n' );
  fprintf ( 1, '  CSPFA factors the matrix.\n' );
  fprintf ( 1, '  CSPDI computes the determinant or inverse.\n' );
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
%  Factor the matrix A.
%
  [ a, ipvt, info ] = cspfa ( a, n );
 
  if ( info ~= 0 )
    fprintf ( 1, '\n' )
    fprintf ( 1, '  CSPFA returned an error flag INFO = %d\n', info );
    return
  end
%
%  Get the determinant.
%
  job = 10;
  [ a, det ] = cspdi ( a, n, ipvt, job );
 
  fprintf ( 1, '\n' )
  fprintf ( 1, '  Determinant = (%8f  %8f)*10^(%8f)\n', ...
    real ( det(1) ), imag ( det(1) ), real ( det(2) ) );
%
%  Get the inverse.
%
  job = 01;
  [ a, det ] = cspdi ( a, n, ipvt, job );
%
%  Copy the packed matrix into a "normal" matrix.
%
  k = 0;
  for j = 1 : n
    for i = 1 : j
      k = k + 1;
      b_save(i,j) = a(k);
    end
  end

  for j = 1 : n
    b_save(j+1:n,j) = transpose ( b_save(j,j+1:n) );
  end
 
  c(1:n,1:n) = b_save(1:n,1:n) * a_save(1:n,1:n);

  fprintf ( 1, '\n' )
  fprintf ( 1, '  The product inv(A) * A is\n' );
  fprintf ( 1, '\n' )
 
  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( c(i,j) ), imag ( c(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
