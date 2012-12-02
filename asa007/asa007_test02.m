function asa007_test02 ( )

%*****************************************************************************80
%
%% TEST02 demonstrates the use of SYMINV.
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
  fprintf ( 1, 'TEST02:\n' );
  fprintf ( 1, '  SYMINV computes the inverse of a positive\n' );
  fprintf ( 1, '  definite symmetric matrix.\n' );
  fprintf ( 1, '  A compressed storage format is used.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here we look at the Hilbert matrix\n' );
  fprintf ( 1, '  A(I,J) = 1 / ( I + J - 1 )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We expect errors to grow quickly with N.\n' );

  for n = 1 : n_max
%
%  Set A to the Hilbert matrix.
%
    k = 0;
    for i = 1 : n
      for j = 1 : i
        k = k + 1;
        a(k) = 1.0 / ( i + j - 1 );
      end
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
