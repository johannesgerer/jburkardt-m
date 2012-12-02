function test128 ( )

%*****************************************************************************80
%
%% TEST128 tests R8MAT_PERMANENT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST128\n' );
  fprintf ( 1, '  R8MAT_PERMANENT: the matrix permanent function.\n' );
  fprintf ( 1, '  We will analyze matrices with 0 diagonal and\n' );
  fprintf ( 1, '  1 on all offdiagonals.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Order	    Permanent.\n' );
  fprintf ( 1, '\n' );
 
  for n = 2 : 12
 
    a(1:n,1:n) = 1.0;

    for i = 1 : n
      a(i,i) = 0.0;
    end
 
    perm = r8mat_permanent ( n, a );
 
    fprintf ( 1, '  %2d  %18f\n', n, perm );
 
  end
 
  return
end
