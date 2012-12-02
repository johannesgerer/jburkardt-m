function linpack_d_test23 ( )

%*****************************************************************************80
%
%% TEST23 tests DQRDC and DQRSL.
%
%  Discussion:
%
%    DQRDC and DQRSL compute the QR factorization, and use it
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
  fprintf ( 1, 'TEST23\n' );
  fprintf ( 1, '  For a general matrix,\n' );
  fprintf ( 1, '  DQRDC computes the QR decomposition of a\n' );
  fprintf ( 1, '  matrix, but does not return Q and R explicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Show how Q and R can be recovered using DQRSL.\n' );
%
%  Set the matrix A.
%
  a = [ ...
    1.0, 1.0, 0.0; ...
    1.0, 0.0, 1.0; ...
    0.0, 1.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The original matrix A:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : p
      fprintf ( 1, '  %14f', a(i,j) );
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

  [ a, qraux, ipvt ] = dqrdc ( a, lda, n, p, ipvt, job );
%
%  Print out what DQRDC has stored in A...
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The packed matrix A which describes Q and R:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : p
      fprintf ( 1, '  %14f', a(i,j) );
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
    fprintf ( 1, '  %14f', qraux(i) );
  end
  fprintf ( 1, '\n' );
%
%  Print out the resulting R factor.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The R factor:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : p

      if ( j < i ) 
        r(i,j) = 0.0;
      else
        r(i,j) = a(i,j);
      end

    end

    for j = 1 : p
      fprintf ( 1, '  %14f', r(i,j) );
    end
    fprintf ( 1, '\n' );

  end
%
%  Call DQRSL to extract the information about the Q matrix.
%  We do this, essentially, by asking DQRSL to tell us the
%  value of Q*Y, where Y is a column of the identity matrix.
%
  job = 10000;

  for i = 1 : n
%
%  Set the vector Y.
%
    y(1:n) = 0.0;

    y(i) = 1.0;
%
%  Ask DQRSL to tell us what Q*Y is.
%
    [ qy, qty, b, rsd, xb, info ] = dqrsl ( a, lda, n, p, qraux, y, job );

    if ( info ~= 0 )
      fprintf ( 1, '  Error!  DQRSL returns INFO = %d\n', info );
      return
    end
%
%  Copy QY into the appropriate column of Q.
%
    q(1:n,i) = qy(1:n);

  end
%
%  Now print out the Q matrix we have extracted.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The Q factor:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %14f', q(i,j) );
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
      fprintf ( 1, '  %14f', b(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
