function linpack_s_test20 ( )

%*****************************************************************************80
%
%% TEST20 tests SPPFA and SPPDI.
%
%  Discussion:
%
%    SPPFA factors a packed positive definite symmetric matrix,
%    and SPPDI can compute the determinant or the inverse.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST20\n' );
  fprintf ( 1, '  For a positive definite symmetric packed matrix,\n' );
  fprintf ( 1, '  SPPFA factors the matrix.\n' );
  fprintf ( 1, '  SPPDI computes the inverse or determinant.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Set the matrix A.
%
  k = 0;
  for j = 1 : n
    for i = 1 : j
      k = k + 1;
      if ( i == j - 1 )
        a(k) = -1.0;
      elseif ( i == j )
        a(k) = 2.0;
      else
        a(k) = 0.0;
      end
    end
  end
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );

  [ a, info ] = sppfa ( a, n );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Error, SPPFA returns INFO = %d\n', info );
    return
  end
%
%  Invert the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Get the determinant and inverse.\n' );

  job = 11;
  [ a, det ] = sppdi ( a, n, job );
%
%  Print the results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1,'  Determinant  = %f * 10 ^ %f\n', det(1), det(2) );
%
%  SPPDI produces only the 'upper half triangle' of the inverse,
%  which is actually symmetric.  Thus, the lower half could be
%  produced by copying from the upper half.  However, the first row
%  of A, as returned, is exactly the first row of the inverse.
%
  k = 0;
  for j = 1 : n
    for i = 1 : j
      k = k + 1;
      b(i,j) = a(k);
      b(j,i) = a(k);
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Inverse:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %14f', b(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
