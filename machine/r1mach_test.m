function r1mach_test ( )

%*****************************************************************************80
%
%% R1MACH_TEST reports the constants returned by R1MACH.
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
  fprintf ( 1, 'R1MACH_TEST\n' );
  fprintf ( 1, '  R1MACH reports the value of constants associated\n' );
  fprintf ( 1, '  with real single precision computer arithmetic.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Assume that single precision numbers are stored \n' );
  fprintf ( 1, '  with a mantissa of T digits in base B, with an \n' );
  fprintf ( 1, '  exponent whose value must lie between EMIN and EMAX.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  For input arguments of 1 <= I <= 5,\n' );
  fprintf ( 1, '  R1MACH will return the following values:\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R1MACH(1) = B^*(EMIN-1), the smallest positive magnitude.\n' );
  fprintf ( 1, '%26.16e\n', r1mach(1) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R1MACH(2) = B^EMAX*(1-B^(-T)), the largest magnitude.\n' );
  fprintf ( 1, '%26.16e\n', r1mach(2) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R1MACH(3) = B^(-T), the smallest relative spacing.\n' );
  fprintf ( 1, '%26.16e\n', r1mach(3) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R1MACH(4) = B^(1-T), the largest relative spacing.\n' );
  fprintf ( 1, '%26.16e\n', r1mach(4) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R1MACH(5) = log10(B).\n' );
  fprintf ( 1, '%26.16e\n', r1mach(5) );

  return
end
