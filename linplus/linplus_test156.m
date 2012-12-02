function linplus_test156 ( )

%*****************************************************************************80
%
%% TEST156 tests R8BTO_SL.
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
  m = 2;
  l = 3;
  n = m * l;

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
  fprintf ( 1, 'TEST156\n' );
  fprintf ( 1, '  For a real block Toeplitz matrix,\n' );
  fprintf ( 1, '  R8BTO_SL solves a block Toeplitz system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Block order M =  %d\n', m );
  fprintf ( 1, '  Block number L = %d\n', l );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  r8bto_print ( m, l, a, '  The block Toeplitz matrix:' );
%
%  Set the desired solution.
%
  xvec = r8vec_indicator ( n );
  x = r8vec_to_r8ge ( m, l, xvec )
%
%  Compute the right hand side.
%
  b = r8bto_mxv ( m, l, a, x );

  r8ge_print ( m, l, b, '  The right hand side B:' );

  x = r8bto_sl ( m, l, a, b );

  r8ge_print ( m, l, x, '  The computed solution X:' );

  return
end
