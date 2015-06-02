function solve_test01 ( )

%******************************************************************************/
%
%% SOLVE_TEST01 demonstrates how a 3X3 linear system can be set up and solved.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SOLVE_TEST01\n' );
  fprintf ( 1, '  R8MAT_FS solves a linear system with Gauss elimination.\n' );
%
%  Define the array size.
%
  n = 3;
%
%  Set the array.
%
  a = [ 1, 2, 3; ...
        4, 5, 6; ...
        7, 8, 0 ];
%
%  Set the right hand side as a column vector.
%
  b = [ 14; 32; 23 ];
%
%  Request the solution of A*x=b.
%
  x = r8mat_fs ( n, a, b );

  r8vec_print ( n, x, '  Solution:' );

  return
end

