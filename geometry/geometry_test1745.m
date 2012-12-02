function geometry_test1745 ( )

%*****************************************************************************80
%
%% TEST1745 tests R8MAT_SOLVE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  n = 3;
  nrhs = 2;

  a = [ ...
     1.0,  4.0,  7.0; ...
     2.0,  5.0,  8.0; ...
     3.0,  6.0,  0.0; ...
    14.0, 32.0, 23.0; ...
     7.0, 16.0,  7.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1745\n' );
  fprintf ( 1, '  R8MAT_SOLVE solves linear systems.\n' );
  fprintf ( 1, '\n' );
%
%  Print out the matrix to be inverted.
%
  r8mat_print ( n, n+nrhs, a, '  The linear system:' );
%
%  Solve the systems.
%
  [ a, info ] = r8mat_solve ( n, nrhs, a );
 
  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The input matrix was singular.\n' );
    fprintf ( 1, '  The solutions could not be computed.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The computed solutions:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    for j = 1 : nrhs
      fprintf ( 1, '  %12f', a(i,n+j) );
    end
    fprintf ( 1, '\n' );
  end
 
  return
end
