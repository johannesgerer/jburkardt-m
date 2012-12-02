function subpak_test077 ( )

%*****************************************************************************80
%
%% TEST077 tests R8MAT_SOLVE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 3;
  rhs_num = 2;
%
%  Each row of this definition is a COLUMN of the matrix.
%
  a(1:n,1:n+rhs_num) = [ ...
       1.0,  4.0,  7.0; ...
       2.0,  5.0,  8.0; ...
       3.0,  6.0,  0.0; ...
      14.0, 32.0, 23.0; ...
       7.0, 16.0,  7.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST077\n' );
  fprintf ( 1, '  R8MAT_SOLVE solves linear systems.\n' );
%
%  Print out the matrix to be inverted.
%
  r8mat_print ( n, n+rhs_num, a, '  The linear system:' );
%
%  Solve the systems.
%
  [ a, info ] = r8mat_solve ( n, rhs_num, a );
 
  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The input matrix was singular.\n' );
    fprintf ( 1, '  The solutions could not be computed.\n' );
    return
  end

  r8mat_print ( n, rhs_num, a(1:n,n+1:n+rhs_num), '  The computed solutions' );

  return
end
