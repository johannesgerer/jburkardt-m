function linpack_c_test27 ( )

%*****************************************************************************80
%
%% TEST27 tests CQRDC and CQRSL.
%
%  Discussion:
%
%    CQRDC and CQRSL compute the QR factorization, and use it
%    to solve linear systems.
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
  p = 3;
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST27\n' );
  fprintf ( 1, '  For a single precision complex (C)\n' );
  fprintf ( 1, '  general matrix,\n' );
  fprintf ( 1, '  CQRDC computes the QR decomposition of a \n' );
  fprintf ( 1, '  matrix, but does not return Q and R explicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix row order is N    = %d\n', n );
  fprintf ( 1, '  The matrix column order is P = %d\n', p );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Show how Q and R can be recovered using CQRSL.\n' );
%
%  Set the values of the matrix A.
%
  seed = 123456789;

  [ a, seed ] = c4mat_uniform_01 ( n, p, seed );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix A is\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : n
    for j = 1 : p
      fprintf ( 1, '  (%8f  %8f)', real ( a(i,j) ), imag ( a(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Decompose the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Decompose the matrix.\n' );
 
  job = 0;
  ipvt(1:p) = 0;

  [ a, qraux, ipvt ] = cqrdc ( a, lda, n, p, ipvt, job );
%
%  Print out what CQRDC has stored in A...
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The packed matrix A which describes Q and R:\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : n
    for j = 1 : p
      fprintf ( 1, '  (%8f  %8f)', real ( a(i,j) ), imag ( a(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  ...and in QRAUX.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The QRAUX vector, containing some additional\n' );
  fprintf ( 1, '  information defining Q:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  (%8f  %8f)\n', real ( qraux(i) ), imag ( qraux(i) ) );
  end
%
%  Print out the resulting R factor.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The R factor:\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : n

    r(i,1:i-1) = 0.0;
    r(i,i:p) = a(i,i:p);
  
  end

  for i = 1 : n
    for j = 1 : p
      fprintf ( 1, '  (%8f  %8f)', real ( r(i,j) ), imag ( r(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Call CQRSL to extract the information about the Q matrix.
%  We do this, essentially, by asking CQRSL to tell us the
%  value of Q*Y, where Y is a column of the identity matrix.
%
  job = 10000;
 
  for j = 1 : n
%
%  Set the vector Y.
%
    y(1:n) = 0.0;
 
    y(j) = 1.0;
%
%  Ask CQRSL to tell us what Q*Y is.
%
    [ qy, qty, b, rsd, xb, info ] = cqrsl ( a, lda, n, p, qraux, y, job );
 
    if ( info ~= 0 )
      fprintf ( 1, '  Error!  CQRSL returns INFO = %d\n', info );
      return
    end
%
%  Copy QY into the appropriate column of Q.
%
    q(1:n,j) = transpose ( qy(1:n) );
 
  end
%
%  Now print out the Q matrix we have extracted.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The Q factor:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( q(i,j) ), imag ( q(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Compute Q*R to verify that it equals A.
%
  b(1:n,1:p) = q(1:n,1:n) * r(1:n,1:p);
%
%  Print the result.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The product Q * R:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : p
      fprintf ( 1, '  (%8f  %8f)', real ( b(i,j) ), imag ( b(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end
  
  return
end
