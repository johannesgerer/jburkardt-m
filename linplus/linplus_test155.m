function linplus_test155 ( )

%*****************************************************************************80
%
%% TEST155 tests R8BTO_MXV, R8BTO_VXM.
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
  l = 3;
  m = 2;
  n = m * l;
%
%  I don't know how MATLAB wants me to enter a triply-dimensioned array.
%  I've tried several different approaches with no success, so 
%  here's the clodhopper's method:
%
  a = zeros ( m, m, 2*l-1 );
  
  a(1,1,1) = 1.0E+00;
  a(2,1,1) = 5.0E+00; 
  a(1,2,1) = 2.0E+00;
  a(2,2,1) = 5.0E+00;
  a(1,1,2) = 3.0E+00;
  a(2,1,2) = 6.0E+00; 
  a(1,2,2) = 4.0E+00;
  a(2,2,2) = 6.0E+00;
  a(1,1,3) = 5.0E+00;
  a(2,1,3) = 7.0E+00; 
  a(1,2,3) = 6.0E+00;
  a(2,2,3) = 7.0E+00;
  a(1,1,4) = 7.0E+00;
  a(2,1,4) = 8.0E+00; 
  a(1,2,4) = 8.0E+00;
  a(2,2,4) = 8.0E+00;
  a(1,1,5) = 9.0E+00;
  a(2,1,5) = 9.0E+00; 
  a(1,2,5) = 0.0E+00;
  a(2,2,5) = 9.0E+00;
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST155\n' );
  fprintf ( 1, '  For a real block Toeplitz matrix,\n' );
  fprintf ( 1, '  R8BTO_MXV computes A * x.\n' );
  fprintf ( 1, '  R8BTO_VXM computes A''* x.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Block order M =  %d\n', m );
  fprintf ( 1, '  Block number L = %d\n', l );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  r8bto_print ( m, l, a, '  The block Toeplitz matrix:' );

  x = r8ge_indicator ( m, l );
   
  r8ge_print ( m, l, x, '  The matrix x:' );

  b = r8bto_mxv ( m, l, a, x );

  r8ge_print ( m, l, b, '  The product A*x:' );

  b = r8bto_vxm ( m, l, a, x );

  r8ge_print ( m, l, b, '  The product A''*x:' );

  return
end
