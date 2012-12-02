function linplus_test285 ( )

%*****************************************************************************80
%
%% TEST285 tests R8GE_CO.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;
  x = 2.0E+00;
  y = 3.0E+00;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST285\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_CO estimates the condition number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( i == j )
        a(i,j) = x + y;
      else
        a(i,j) = y;
      end
    end
  end

  a_norm_l1 = 0.0E+00;
  for j = 1 : n
    a_norm_l1 = max ( a_norm_l1, sum ( abs ( a(1:n,j) ) ) );
  end

  [ a_lu, pivot, info ] = r8ge_fa ( n, a );

  a_inverse = r8ge_inverse ( n, a_lu, pivot );

  a_inverse_norm_l1 = 0.0E+00;
  for j = 1 : n
    a_inverse_norm_l1 = max ( a_inverse_norm_l1, ...
      sum ( abs ( a_inverse(1:n,j) ) ) );
  end

  cond_l1 = a_norm_l1 * a_inverse_norm_l1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The L1 condition number is %f\n', cond_l1 );
%
%  Factor the matrix.
%
  [ a_lu, pivot, rcond, z ] = r8ge_co ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The R8GE_CO estimate is     %f\n', 1.0E+00 / rcond );

  return
end
