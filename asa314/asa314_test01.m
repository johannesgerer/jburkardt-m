function asa314_test01 ( )

%*****************************************************************************80
%
%% ASA314_TEST01 tests INVMOD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Roger Payne,
%    Inversion of matrices with contents subject to modulo arithmetic,
%    Applied Statistics,
%    Volume 46, Number 2, 1997, pages 295-298.
%
  nrow = 3;
%
%  Note that the matrices are supplied as vectors, and listed in
%  column major order.  In particular, the mathematical representation
%  of JMAT is:
%
%    1 2 1
%    0 1 0
%    0 0 1
%
  jmat = [ 1, 0, 0, ... 
           2, 1, 0, ...
           1, 0, 1 ];

  mat = [  1, 0, 0, ...
           1, 1, 0, ...
           2, 0, 1 ]';

  cmod(1:nrow) = 3;
  rmod(1:nrow) = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA314_TEST01\n' );
  fprintf ( 1, '  INVMOD computes the inverse of a matrix\n' );
  fprintf ( 1, '  whose elements are subject to modulo arithmetic.\n' );

  matmat = reshape ( mat, nrow, nrow ); 
  i4mat_print ( nrow, nrow, matmat, '  The matrix to be inverted:' );

  [ imat, mat, ifault ] = invmod ( mat, rmod, cmod, nrow );

  imatmat = reshape ( imat, nrow, nrow ); 
  i4mat_print ( nrow, nrow, imatmat, '  The computed inverse:' );

  jmatmat = reshape ( jmat, nrow, nrow ); 
  i4mat_print ( nrow, nrow, jmatmat, '  The correct inverse:' );

  return
end

