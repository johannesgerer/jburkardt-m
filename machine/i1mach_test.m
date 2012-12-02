function i1mach_test ( )

%*****************************************************************************80
%
%% I1MACH_TEST reports the constants returned by I1MACH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 April 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I1MACH_TEST\n' );
  fprintf ( 1, '  I1MACH reports the value of constants associated\n' );
  fprintf ( 1, '  with integer computer arithmetic.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Numbers associated with input/output units:\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(1) = the standard input unit.\n' );
  fprintf ( 1, '%d\n', i1mach(1) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(2) = the standard output unit.\n' );
  fprintf ( 1, '%d\n', i1mach(2) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(3) = the standard punch unit.\n' );
  fprintf ( 1, '%d\n', i1mach(3) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(4) = the standard error message unit.\n' );
  fprintf ( 1, '%d\n', i1mach(4) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Numbers associated with words:\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(5) = the number of bits per integer.\n' );
  fprintf ( 1, '%d\n', i1mach(5) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(6) = the number of characters per integer.\n' );
  fprintf ( 1, '%d\n', i1mach(6) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Numbers associated with integer values:\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Assume integers are represented in the S digit \n' );
  fprintf ( 1, '  base A form:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Sign * (X(S-1)*A^(S-1) + ... + X(1)*A + X(0))\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  where the digits X satisfy 0 <= X(1:S-1) < A.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(7) = A, the base.\n' );
  fprintf ( 1, '%d\n', i1mach(7) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(8) = S, the number of base A digits.\n' );
  fprintf ( 1, '%d\n', i1mach(8) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(9) = A^S-1, the largest integer.\n' );
  fprintf ( 1, '%d\n', i1mach(9) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Numbers associated with floating point values:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Assume floating point numbers are represented \n' );
  fprintf ( 1, '  in the T digit base B form:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Sign * (B^E) * ((X(1)/B) + ... + (X(T)/B^T) )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  where \n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    0 <= X(1:T) < B,\n' );
  fprintf ( 1, '    0 < X(1) (unless the value being represented is 0),\n' );
  fprintf ( 1, '    EMIN <= E <= EMAX.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(10) = B, the base.\n' );
  fprintf ( 1, '%d\n', i1mach(10) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Numbers associated with single precision values:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(11) = T, the number of base B digits.\n' );
  fprintf ( 1, '%d\n', i1mach(11) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(12) = EMIN, the smallest exponent E.\n' );
  fprintf ( 1, '%d\n', i1mach(12) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(13) = EMAX, the largest exponent E.\n' );
  fprintf ( 1, '%d\n', i1mach(13) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Numbers associated with double precision values:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(14) = T, the number of base B digits.\n' );
  fprintf ( 1, '%d\n', i1mach(14) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(15) = EMIN, the smallest exponent E.\n' );
  fprintf ( 1, '%d\n', i1mach(15) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  I1MACH(16) = EMAX, the largest exponent E.\n' );
  fprintf ( 1, '%d\n', i1mach(16) );

  return
end
