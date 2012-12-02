function asa007_test01 ( )

%*****************************************************************************80
%
%% TEST01 demonstrates the use of SYMINV.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2008
%
%  Author:
%
%    John Burkardt
%
  n_max = 15;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  SYMINV computes the inverse of a positive\n' );
  fprintf ( 1, '  definite symmetric matrix.\n' );
  fprintf ( 1, '  A compressed storage format is used.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here we look at the matrix A which is\n' );
  fprintf ( 1, '  N+1 on the diagonal and\n' );
  fprintf ( 1, '  N   on the off diagonals.\n' );

  for n = 1 : n_max
%
%  Set A to the lower triangle of the matrix which is N+1 on the diagonal
%  and N on the off diagonals.
%
    k = 0;
    for i = 1 : n
      for j = 1 : i - 1
        k = k + 1;
        a(k) = n;
      end
      k = k + 1;
      a(k) = n + 1;
    end

    [ c, nullty, ifault ] = syminv ( a, n );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Matrix order N = %d\n', n );
    fprintf ( 1, '  Maxtrix nullity NULLTY = %d\n', nullty );

    k = 0;
    for j = 1 : n
      for i = 1 : j - 1
        k = k + 1;
        cfull(i,j) = c(k);
        cfull(j,i) = c(k);
      end
      k = k + 1;
      cfull(j,j) = c(k);
    end

    k = 0;
    for j = 1 : n
      for i = 1 : j - 1
        k = k + 1;
        afull(i,j) = a(k);
        afull(j,i) = a(k);
      end
      k = k + 1;
      afull(j,j) = a(k);
    end
%
%  Compute C * A - I.
%
    b(1:n,1:n) = cfull(1:n,1:n) * afull(1:n,1:n) - eye(n);

    diff = sqrt ( sum ( sum ( b(1:n,1:n).^2 ) ) );

    fprintf ( 1,  '  RMS ( C * A - I ) = %e\n', diff );
  end

  return
end
